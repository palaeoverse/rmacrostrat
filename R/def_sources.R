#' @title Retrieve geologic map source definitions
#'
#' @description A function to retrieve the definitions for one or more geologic
#'   map sources in the Macrostrat database. By default, all source definitions
#'   are returned.
#'
#' @param source_id \code{integer}. The unique identification number(s) of the
#'   desired source(s) to return a definition for.
#' @param lat \code{numeric}. A valid latitude in decimal degrees to return a
#'   source definition for. Must also supply `lng`.
#' @param lng \code{numeric}. A valid longitude in decimal degrees to return a
#'   source definition for. Must also supply `lat`.
#' @param shape \code{character}. A valid well-known text (WKT) representation
#'   of geometry, such as "POINT(30 10)" or "POLYGON((30 10, 40 40, 20 40, 10
#'   20))", to return a source definition for.
#' @param buffer \code{integer}. The geographic buffer (in meters) that should
#'   be applied to the specified `shape`.
#' @param scale \code{character}. The desired Burwell scale, either: "tiny"
#'   (global), "small" (continental), "medium" (regional), or "large" (local).
#' @param sf \code{logical}. Should the results be returned as an `sf` object?
#'   Defaults to `TRUE`. If `FALSE`, a `data.frame` is returned.
#'
#' @return A \code{data.frame} containing the following columns:
#' \itemize{
#'   \item \code{source_id}: Identification number of the geologic map source.
#'   \item \code{name}: Name of the geologic map source.
#'   \item \code{url}: URL where additional information, the source, or
#'     contributing publication can be found.
#'   \item \code{ref_title}: Title of reference for geologic map source.
#'   \item \code{authors}: Authors of geologic map source.
#'   \item \code{ref_year}: Year of reference publication.
#'   \item \code{ref_source}: Original publication source of the reference.
#'   \item \code{isbn_doi}: The ISBN or DOI for the reference.
#'   \item \code{scale}: The Macrostrat scale the geologic map source belongs
#'     to.
#'   \item \code{features}: The total number of features (i.e., outcrop shape
#'     and point elements) associated with the geologic map source.
#'   \item \code{area}: The total geographic area of the geologic map source
#'     in km\ifelse{html}{\out{<sup>2</sup>}}{\eqn{^2}}.
#' }
#'   If `sf` is `TRUE` (the default), an `sf` object is returned instead, with
#'   the same columns plus a "geometry" column that contains the spatial data.
#'
#' @section Developer(s):
#'  William Gearty
#'
#' @section Reviewer(s):
#'  Lewis A. Jones
#'
#' @examples
#' \donttest{
#' # Get all sources
#' ex1 <- def_sources()
#' # Get subset of sources
#' ex2 <- def_sources(source_id = c(1,2,4))
#' ex3 <- def_sources(lat = 43.03, lng = -89.4, scale = "large")
#' # Use WKT representation
#' library(sf)
#' line <- st_linestring(x = matrix(c(-122.3438, 37,-89.3527, 43.0582),
#'                                  byrow = TRUE, ncol = 2))
#' ex4 <- def_sources(shape = st_as_text(line), buffer = 100)
#' }
#' @export
#' @family maps
#' @family meta
def_sources <- function(source_id = NULL, lat = NULL, lng = NULL,
                        shape = NULL, buffer = NULL, scale = NULL,
                        sf = TRUE) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(source_id = "integer", lat = "numeric", lng = "numeric",
              shape = "character", buffer = "integer", scale = "character",
              sf ="logical")
  check_arguments(x = args, ref = ref)
  if (!is.null(lat) || !is.null(lng)) {
    if (is.null(lat) || is.null(lng)) {
      stop("`lat` and `lng` must both be specified to filter by location.")
    }
    if (lng >= 180 || lng <= -180) {
      stop("`lng` should be less than 180 and more than -180.")
    }
    if (lat >= 90 || lat <= -90) {
      stop("`lat` should be less than 90 and more than -90.")
    }
  }
  # Set default for format
  if (sf) format <- "geojson" else format <- "json"
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/sources", query = args,
                        format = format)
  # Return data
  return(dat)
}
