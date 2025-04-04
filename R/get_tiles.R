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
  # NOTE: do.call(rbind) can take a while for high zooms
  lines <- lapply(tiles_filt, function(x) x$lines)
  lines_filt <- Filter(Negate(is.null), lines)
  tiles$lines <- do.call(rbind, lines_filt)
  units <- lapply(tiles_filt, function(x) x$units)
  units_filt <- Filter(Negate(is.null), units)
  tiles$units <- do.call(rbind, units_filt)
  return(tiles)
  # TODO: document variables in return object
}
