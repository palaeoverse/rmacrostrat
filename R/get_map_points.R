#' @title Retrieve geologic map point shape element data
#'
#' @description A function to retrieve data for geologic map point shape
#'   elements from various sources.
#'
#' @param point_id \code{integer}. The unique identification number(s) of the
#'   point(s) to return.
#' @param point_type \code{character}. Filter points to those of one or more
#'   point type(s). Options are "cleavage", "bedding", "axial plane", "fault
#'   plane", "foliation", and "joint". Ignored if `point_id` is supplied.
#' @param min_lat \code{integer}. The minimum latitude used to define the
#'   bounding box of the points to return. Requires `min_lng`, `max_lat`, and
#'   `max_lng`. Ignored if `point_id` is supplied.
#' @param min_lng \code{integer}. A minimum longitude used to define the
#'   bounding box of the points to return. Requires `min_lat`, `max_lat`, and
#'   `max_lng`. Ignored if `point_id` is supplied.
#' @param max_lat \code{integer}. A maximum latitude used to define the
#'   bounding box of the points to return. Requires `min_lat`, `min_lng`, and
#'   `max_lng`. Ignored if `point_id` is supplied.
#' @param max_lng \code{integer}. A maximum longitude used to define the
#'   bounding box of the points to return. Requires `min_lat`, `min_lng`, and
#'   `max_lat`. Ignored if `point_id` is supplied.
#' @param source_id \code{integer}. The unique identification number(s) of the
#'   source(s) to filter the points by. Ignored if `point_id` is supplied.
#' @param sf \code{logical}. Should the results be returned as an `sf` object?
#'   Defaults to `TRUE`.
#'
#' @return An \code{sf} object containing the following columns:
#' \itemize{
#'   \item \code{point_id}: The identification number of the point element.
#'   \item \code{strike}: The strike value of the point element.
#'   \item \code{dip}: The dip value of the point element.
#'   \item \code{dip_dir}: The dip direction of the point element.
#'   \item \code{point_type}: The type of point element (e.g. "bedding").
#'   \item \code{certainty}: The certainty of the point element location.
#'   \item \code{comments}: Notes assigned to the point element.
#'   \item \code{source_id}: The unique identification number of the source
#'     for the point element.
#'   \item \code{geometry}: The point spatial data.
#' }
#'   If `sf` is `TRUE` (the default), an `sf` object is returned, with the
#'   a "geometry" column that contains the spatial data. If `sf` is `FALSE`,
#'   a `data.frame` object is returned with two additional columns (lng,
#'   lat) containing the geographic coordinates of the point elements.
#'
#' @section Developer(s):
#'  Lewis A. Jones
#' @section Reviewer(s):
#'  Bethany Allen
#' @details More information can be found relating to the inputs for this
#'  function using the definition functions (beginning with \code{def_}).
#'
#' @examples
#' \donttest{
#' # Return a specific point
#' ex1 <- get_map_points(point_id = 1)
#' # Return all points within a user-specified bounding box
#' ex2 <- get_map_points(min_lng = -80, min_lat = 40,
#'                       max_lng = -70, max_lat = 50)
#' }
#' @importFrom sf st_coordinates st_drop_geometry
#' @export
#' @family maps
get_map_points <- function(point_id = NULL, point_type = NULL,
                           min_lat = NULL, min_lng = NULL,
                           max_lat = NULL, max_lng = NULL,
                           source_id = NULL, sf = TRUE) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(point_id = "integer", point_type = "character",
              min_lat = "integer", min_lng = "integer", max_lat = "integer",
              max_lng = "integer", source_id = "integer", sf = "logical"
  )
  check_arguments(x = args, ref = ref)
  # Check geographic extents
  # Are some arguments specified?
  if (!is.null(min_lng) || !is.null(max_lng) ||
      !is.null(min_lat) || !is.null(max_lat)) {
    # Are all arguments specified?
    if (is.null(min_lng) || is.null(max_lng) ||
        is.null(min_lat) || is.null(max_lat)) {
      stop("`min_lng`, `max_lng`, `min_lat` and `max_lat` must be specified.")
    }
    if (min_lat >= max_lat) {
      stop("`min_lat` should be less than `max_lat`.")
    }
    if (min_lng >= max_lng) {
      stop("`min_lng` should be less than `max_lng`.")
    }
    if (min_lat <= -90) {
      stop("`min_lat` should be more than -90.")
    }
    if (max_lat >= 90) {
      stop("`max_lat` should be less than 90.")
    }
    if (min_lng <= -180) {
      stop("`min_lng` should be more than -180.")
    }
    if (max_lng >= 180) {
      stop("`max_lng` should be less than 180.")
    }
  }
  # Recode names
  api_names <- list(min_lat = "minlat", min_lng = "minlng",
                    max_lat = "maxlat", max_lng = "maxlng")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))
  # Get request
  dat <- GET_macrostrat(endpoint = "geologic_units/map/points",
                        query = args, format = "geojson")
  # data.frame requested?
  if (!sf) {
    coords <- st_coordinates(dat)
    colnames(coords) <- c("lng", "lat")
    dat <- cbind.data.frame(st_drop_geometry(dat), coords)
  }
  # Return data
  return(dat)
}
