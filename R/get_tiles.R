#' @title Retrieve Macrostrat vectorized tiles
#'
#' @description A function to retrieve map tile data from the
#'   [Macrostrat tile server](https://tiles.macrostrat.org/). This includes
#'   geologic line features such as faults, anticlines, and moraines, as well as
#'   geologic map polygons. The function retrieves the data in vectorized tile
#'   format.
#'
#' @details Note that the tile indices (\code{x} and \code{y}) are zero-indexed,
#'   meaning that the first tile in each dimension is \code{0}. The zoom level
#'   is also zero-indexed, meaning that the first zoom level is \code{0}. For a
#'   given zoom level, the possible tile indices are \code{0} to \code{2 ^ zoom
#'   - 1}.
#'
#' @param zoom \code{integer}. The unique identification number(s) of the map
#'   outcrop shape element(s) to return.
#' @param x \code{integer}. The x index/indices of the tile(s) to retrieve. If
#'   \code{NULL} (the default), tiles of all x indices will be retrieved and
#'   combined.
#' @param y \code{integer}. The y index/indices of the tile(s) to retrieve. If
#'   \code{NULL} (the default), tiles of all y indices will be retrieved and
#'   combined.
#' @param scale \code{character}. The Macrostrat map scale to be used. Options
#'   are "tiny" (global), "small" (continental), "medium" (regional), "large",
#'   (local), or "carto" (blended). The "carto" scale (the default) is for
#'   visualization purposes, and makes many assumptions about the relative
#'   priority of each map. The layers and scales are seamlessly blended so no
#'   scale-dependent decisions can or should be made.
#' @param combined \code{logical}. Whether all tiles should be combined. If
#'   \code{TRUE} (the default), the function returns a single list with all
#'   tiles combined (as described below). If \code{FALSE}, the function returns
#'   a list of lists, each element of which represents the data for a single
#'   tile.
#' @return A \code{list} of length two containing the following elements:
#' \itemize{
#'   \item \code{lines}: An \code{sf} object containing the geologic line
#'     features such as faults, anticlines, and moraines. It includes 7
#'     variables:
#'     \itemize{
#'       \item \code{map_id}: The unique identification number of the geologic
#'     }
#'   \item \code{units}: An \code{sf} object containing the geologic map
#'     polygons. It includes 23 variables:
#'     \itemize{
#'       \item \code{map_id}: The unique identification number of the geologic
#'     }
#' }
#'
#' @section Developer(s):
#'  William Gearty
#' @section Reviewer(s):
#'  Lewis A. Jones
#'
#' @examples
#' \donttest{
#' # get single carto tile of the world
#' ex1 <- get_tiles()
#' # get specific "large" tile
#' ex2 <- get_tiles(zoom = 6, x = 5, y = 5, scale = "tiny")
#' }
#' @export
#' @importFrom protolite read_mvt_sf
#' @importFrom httr http_error
#' @importFrom sf st_union
#' @importFrom utils txtProgressBar
#' @family maps
get_tiles <- function(zoom = 0, x = NULL, y = NULL, scale = "carto",
                      combined = TRUE) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    zoom = "integer",
    x = "integer",
    y = "integer",
    scale = "character",
    combined = "logical"
  )
  check_arguments(x = args, ref = ref)
  if (is.null(zoom)) {
    stop("zoom must be specified")
  } else if (zoom < 0) {
    stop("zoom must be greater than or equal to 0")
  }
  # if x or y is NULL, get all tiles in that dimension
  # otherwise, check if x and y are valid indices for given zoom
  if (is.null(x)) {
    x <- 0:(2 ^ zoom - 1)
  } else {
    if ((x < 0 ) | (x > (2 ^ zoom - 1))) {
      stop("x must be between 0 and ", 2 ^ zoom - 1)
    }
  }
  if (is.null(y)) {
    y <- 0:(2 ^ zoom - 1)
  } else {
    if ((y < 0 ) | (y > (2 ^ zoom - 1))) {
      stop("y must be between 0 and ", 2 ^ zoom - 1)
    }
  }
  # Get specified tiles
  tiles_list <- list()
  cat("Retrieving tiles...\n")
  pb <- txtProgressBar(min = 0, max = length(x) * length(y), style = 3)
  for (i in x) {
    for (j in y) {
      # Check if the tile exists
      url <- paste0(
        "https://tiles.macrostrat.org/", scale, "/",
        zoom, "/", i, "/", j, ".mvt"
      )
      if (http_error(url)) {
        stop("Tile does not exist: ", url)
      }
      tiles_list[[paste0(i, "/", j)]] <- read_mvt_sf(url)
      setTxtProgressBar(pb, i * length(y) + j + 1)
    }
  }
  close(pb)
  if (!combined) {
    return(tiles_list)
  }
  # remove tiles without data
  tiles_filt <- Filter(length, tiles_list)
  # combine the tiles
  tiles <- list()
  # TODO: use st_union to combine duplicates based on map_id
  cat("Cleaning and combining tiles...\n")
  lines <- lapply(tiles_filt, function(x) x$lines)
  lines_filt <- Filter(Negate(is.null), lines)
  tiles$lines <- st_rbindlist(lines_filt, use.names = TRUE, ignore.attr = TRUE,
                              fill = TRUE, idcol = "tile")
  units <- lapply(tiles_filt, function(x) x$units)
  units_filt <- Filter(Negate(is.null), units)
  tiles$units <- st_rbindlist(units_filt, use.names = TRUE, ignore.attr = TRUE,
                              fill = TRUE, idcol = "tile")
  return(tiles)
  # TODO: document variables in return object
}

# MODIFIED FROM https://github.com/a-benini/sfhelpers
#' @importFrom data.table rbindlist
#' @importFrom sf st_as_sf st_crs st_geometry<- st_geometry_type
#' @keywords internal
st_rbindlist <- function(l, ..., geometry_name = NULL) {
  if (!is.list(l) || is.data.frame(l)) {
    stop("input is ", class(l)[1L], " but should be a plain list of sf objects",
         " to be stacked", call. = FALSE)
  }
  if (!(is.null(geometry_name) |
        (is.character(geometry_name) & length(geometry_name) == 1))) {
    stop("geometry_name must be either NULL or a single character string",
         call. = FALSE)
  }
  is_not_null <- !vapply(l, is.null, logical(1))
  if (!all(vapply(l[is_not_null], inherits, what = "sf", logical(1)))) {
    stop("not all listed objects are of the class sf", call. = FALSE)
  }
  if(!any(is_not_null)) {
    stop("no sf objects included in input list", call. = FALSE)
  }
  if (length(unique(lapply(l[is_not_null], st_crs))) > 1) {
    stop("arguments have different crs", call. = FALSE)
  }
  # name of geometry column of the first listed sf-object
  first_geometry_name <- attr(l[is_not_null][[1]], "sf_column")

  # homogenize geometry types
  if (length(unique(vapply(l[is_not_null], st_geometry_type,
                           by_geometry = FALSE, factor(1)))) > 1) {
    for (i in seq_along(l)[is_not_null]) {
      class(l[[i]][[attr(l[[i]], "sf_column")]])[[1]] <- "sfc_GEOMETRY"
    }
  }

  sf <- st_as_sf(rbindlist(l, ...))
  sf <- sf[seq_len(nrow(sf)), ]
  class(sf) <- c("sf", "data.frame")

  if (is.null(geometry_name)) {
    st_geometry(sf) <- first_geometry_name
  } else {
    st_geometry(sf) <- geometry_name
  }

  return(sf)
}
