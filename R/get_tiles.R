#' @title Retrieve Macrostrat vectorized tiles
#'
#' @description A function to retrieve map tile data from the
#'   [Macrostrat tile server](https://tiles.macrostrat.org/). This includes
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
#' @family maps
get_tiles <- function(zoom = 0, x = NULL, y = NULL, scale = "carto") {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    zoom = "integer",
    x = "integer",
    y = "integer",
    scale = "character"
  )
  check_arguments(x = args, ref = ref)
  # if x or y is NULL, get all tiles in that dimension
  if (is.null(x)) x <- 0:(2 ^ zoom - 1)
  if (is.null(y)) y <- 0:(2 ^ zoom - 1)
  # Get specified tiles
  tiles_list <- list()
  # TODO: add a progress bar
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
      tiles_list[[length(tiles_list) + 1]] <- read_mvt_sf(url)
    }
  }
  # remove tiles without data
  tiles_filt <- Filter(length, tiles_list)
  # combine the tiles
  tiles <- list()
  # TODO: use st_union to combine duplicates based on map_id
  lines <- lapply(tiles_filt, function(x) x$lines)
  lines_filt <- Filter(Negate(is.null), lines)
  tiles$lines <- as.data.frame(st_rbindlist(lines_filt,
                                            use.names = TRUE,
                                            ignore.attr = TRUE,
                                            fill = TRUE))
  units <- lapply(tiles_filt, function(x) x$units)
  units_filt <- Filter(Negate(is.null), units)
  tiles$units <- as.data.frame(st_rbindlist(units_filt,
                                            use.names = TRUE,
                                            ignore.attr = TRUE,
                                            fill = TRUE))
  return(tiles)
  # TODO: document variables in return object
}

# MODIFIED FROM https://github.com/a-benini/sfhelpers
#' @importFrom data.table rbindlist
#' @importFrom sf st_as_sf st_crs st_geometry_type
#' @importFrom uuid UUIDgenerate
st_rbindlist <- function(l, ..., geometry_name = NULL) {
  if (!is.list(l) || is.data.frame(l)) {
    stop("input is ", class(l)[1L], " but should be a plain list of sf objects",
         " to be stacked", call. = FALSE)
  }
  if (!(is.null(geometry_name) | (is.character(geometry_name) &
                                 length(geometry_name) == 1))) {
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
  if (length(unique(lapply(l[is_not_null], sf::st_crs))) > 1) {
    stop("arguments have different crs", call. = FALSE)
  }
  # name of geometry column of the first listed sf-object
  first_geometry_name <- attr(l[is_not_null][[1]], "sf_column")

  # homogenize name of active geometry columns
  if (length(unique(vapply(l[is_not_null], attr,
                           which = "sf_column", character(1)))) > 1) {
    tmp_geometry_name <- UUIDgenerate()
    for (i in seq_along(l)[is_not_null]) {
      st_geometry(l[[i]]) <- tmp_geometry_name
    }
  }

  # homogenize geometry types
  if (length(unique(vapply(l[is_not_null], st_geometry_type,
                           by_geometry = FALSE, factor(1)))) > 1) {
    for (i in seq_along(l)[is_not_null]) {
      class(l[[i]][[attr(l[[i]], "sf_column")]])[[1]] <- "sfc_GEOMETRY"
    }
  }

  sf <- st_as_sf(data.table::rbindlist(l, ...))
  sf <- sf[seq_len(nrow(sf)), ]
  class(sf) <- c("sf", "data.frame")

  if (is.null(geometry_name)) {
    st_geometry(sf) <- first_geometry_name
  } else {
    st_geometry(sf) <- geometry_name
  }

  return(sf)
}
