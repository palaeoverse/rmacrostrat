#' @title Retrieve Macrostrat vectorized tiles
#'
#' @description A function to retrieve map tile data from the
#'   [Macrostrat tile server](https://tiles.macrostrat.org/). This includes
#'   geologic line features such as faults, anticlines, and moraines, as well as
#'   geologic map polygons (similar to [get_map_outcrop()] but for an entire
#'   geographic tile). The function retrieves the data in vectorized (\code{sf})
#'   tile format. Note that the geographic features come from the "carto"
#'   Macrostrat scale, which is primarily for visualization purposes, and makes
#'   many assumptions about the relative priority of each source map. The layers
#'   and scales are seamlessly blended based on the chosen \code{zoom} level, so
#'   no scale-dependent decisions can or should be made.
#'
#' @details The tile indices (\code{x} and \code{y}) are zero-indexed, meaning
#'   that the first tile in each dimension is \code{0}. The zoom level is also
#'   zero-indexed, meaning that the first (most zoomed out) zoom level is
#'   \code{0}. For a given zoom level, the possible tile indices are \code{0} to
#'   \code{2 ^ zoom - 1}. Note that retrieving multiple (or all tiles) at higher
#'   zoom levels returns large (memory-wise) data objects.
#'
#'   Also note that two (or more) tiles may contain parts of the same geologic
#'   outcrop polygon. Since tiles also overlap slightly, these separate outcrop
#'   components may also overlap, which may lead to confusing visualizations or
#'   invalid downstream analyses. To address this, users are encouraged to union
#'   polygons that have the same \code{map_id} values using the [sf::st_union()]
#'   function (either with a combination of [dplyr::group_by()] and
#'   [dplyr::summarise()] or with [palaeoverse::group_apply()], the former of
#'   which is significantly faster for a large number of tiles). We have not
#'   implemented this here to reduce the number of package dependencies and to
#'   reduce the computational time of this function.
#'
#' @param zoom \code{integer}. The zoom level of the tile(s) to retrieve. The
#'   minimum zoom level is \code{0}.
#' @param x \code{integer}. The x index/indices of the tile(s) to retrieve. If
#'   \code{NULL} (the default), tiles of all x indices will be retrieved and
#'   combined.
#' @param y \code{integer}. The y index/indices of the tile(s) to retrieve. If
#'   \code{NULL} (the default), tiles of all y indices will be retrieved and
#'   combined.
#' @param combined \code{logical}. Whether all tiles should be combined. If
#'   \code{TRUE} (the default), the function returns a single list with all
#'   tiles combined (as described below). If \code{FALSE}, the function returns
#'   a list of lists, each element of which represents the data for a single
#'   tile.
#' @return A \code{list} of length two containing the following elements:
#' \itemize{
#'   \item \code{lines}: An \code{sf} object containing the geologic line
#'     features such as faults, anticlines, and moraines. It includes 8
#'     variables:
#'     \itemize{
#'       \item \code{tile}: An identifier of the form "x/y" for the tile that
#'         contains the line feature. Not included if \code{combined = FALSE}.
#'       \item \code{line_id}: The unique identifier for a line feature.
#'       \item \code{source_id}: An integer that corresponds to the original map
#'         sources (see [def_sources()]).
#'       \item \code{descrip}: A description of the line.
#'       \item \code{name}: The name of the line, if available.
#'       \item \code{direction}: A normalized direction of the line. Not
#'         commonly available.
#'       \item \code{type}: A normalized line type (fault, fold, anticline,
#'         etc).
#'       \item \code{geometry}: The line features as \code{sf} objects.
#'     }
#'   \item \code{units}: An \code{sf} object containing the geologic map
#'     polygons. It includes 24 variables:
#'     \itemize{
#'       \item \code{tile}: An identifier of the form "x/y" for the tile that
#'         contains the polygon. Not included if \code{combined = FALSE}.
#'       \item \code{map_id}: The unique identifier for a polygon (see
#'         [get_map_outcrop[]).
#'       \item \code{source_id}: An integer that corresponds to the original map
#'         sources (see [def_sources()]).
#'       \item \code{legend_id}: An integer that corresponds to the
#'         associated legend component of the original map source (see
#'         [get_map_legends()]).
#'       \item \code{best_age_top}: The best top age that Macrostrat can assign
#'         to the unit based on linked resources.
#'       \item \code{best_age_bottom}: The best bottom age that Macrostrat can
#'         assign to the unit based on linked resources.
#'       \item \code{color}: A hex code associated with the best containing time
#'         interval for the map unit.
#'       \item \code{name}: The name of the polygon. Usually either a
#'         stratigraphic name or lithological description.
#'       \item \code{age}: The age indicated by the map author.
#'       \item \code{lith}: Lithologies, or lithological description (see
#'         [def_lithologies()]).
#'       \item \code{descrip}: A description of the map unit.
#'       \item \code{comments}: Comments about the map unit.
#'       \item \code{t_int_id}: The Macrostrat interval ID associated with the
#'         top age of the map unit (see [def_intervals()]).
#'       \item \code{t_int}: The name of the Macrostrat interval associated with
#'         the top age of the map unit (see [def_intervals()]).
#'       \item \code{b_int_id}: The Macrostrat interval ID associated with the
#'         bottom age of the map unit (see [def_intervals()]).
#'       \item \code{b_int}: The name of the Macrostrat interval associated with
#'         the bottom age of the map unit (see [def_intervals()]).
#'       \item \code{ref_url}: A URL to the original map source.
#'       \item \code{ref_name}: The name of the original map source.
#'       \item \code{ref_title}: The title of the original map source.
#'       \item \code{ref_authors}: The authors of the original map source.
#'       \item \code{ref_source}: The publication source of the original map
#'         source.
#'       \item \code{ref_year}: The publication year of the original map source.
#'       \item \code{ref_isbn}: The ISBN of the original map source.
#'       \item \code{geometry}: The polygon geometries as \code{sf} objects.
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
#' # get specific tile at a higher zoom
#' ex2 <- get_tiles(zoom = 6, x = 5, y = 5)
#' }
#' @export
#' @importFrom protolite read_mvt_sf
#' @importFrom httr http_error
#' @importFrom sf st_union
#' @importFrom utils txtProgressBar setTxtProgressBar
#' @family maps
get_tiles <- function(zoom = 0, x = NULL, y = NULL, combined = TRUE) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    zoom = "integer",
    x = "integer",
    y = "integer",
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
  ind <- 1
  for (i in x) {
    for (j in y) {
      # Check if the tile exists
      url <- paste0(
        "https://tiles.macrostrat.org/", "carto", "/",
        zoom, "/", i, "/", j, ".mvt"
      )
      if (http_error(url)) {
        stop("Tile does not exist: ", url)
      }
      tiles_list[[paste0(i, "/", j)]] <- read_mvt_sf(url)
      setTxtProgressBar(pb, ind)
      ind <- ind + 1
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
