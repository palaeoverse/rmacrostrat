#' @title Retrieve geologic map outcrop shape element data
#'
#' @description A function to retrieve data for geologic map outcrop shape
#'   elements from various sources.
#'
#' @param map_id \code{integer}. The unique identification number(s) of the
#'   map outcrop shape element(s) to return.
#' @param unit_id \code{integer}. Filter outcrop shape elements to those that
#'   match one or more Macrostrat unit(s) as specified by their unique
#'   identification number(s).
#' @param strat_name_id \code{integer}. Filter outcrop shape elements to those
#'   that match one or more stratigraphic name(s) as specified by their unique
#'   identification number(s).
#' @param lat \code{numeric}. Return the outcrop shape element(s) at the
#'   specified decimal degree latitude. Must also specify `lng`.
#' @param lng \code{numeric}. Return the outcrop shape element(s) at the
#'   specified decimal degree longitude. Must also specify `lat`.
#' @param scale \code{character}. The Macrostrat map scale to use (a vector of
#'   scales is also supported). Options are "tiny" (global), "small"
#'   (continental), "medium" (regional), or "large" (local).
#' @param sf \code{logical}. Should the results be returned as an `sf` object?
#'   Defaults to `TRUE`. If `FALSE`, a `data.frame` is returned.
#' @return A \code{data.frame} containing the following columns:
#' \itemize{
#'   \item \code{map_id}: The identification number of the outcrop shape
#'     element.
#'   \item \code{source_id}: The identification number of the source geologic
#'     map.
#'   \item \code{name}: The name of the outcrop shape element in the original
#'     (or modified) source geologic map.
#'   \item \code{strat_name}: The geologic name(s) of the outcrop shape
#'     element.
#'   \item \code{lith}: The lithology of the outcrop shape element as defined
#'     in the geologic map source in plain text.
#'   \item \code{descrip}: Description of the outcrop shape element in plain
#'     text.
#'   \item \code{comments}: Notes assigned to the outcrop shape element.
#'   \item \code{macro_units}: A vector containing the unique identification
#'     number(s) for known Macrostrat unit(s) matched to the outcrop shape
#'     element.
#'   \item \code{strat_names}: A vector containing the unique identification
#'     number(s) for known stratigraphic unit name(s) matched to the outcrop
#'     shape element (see [def_strat_names()]).
#'   \item \code{liths}: A vector containing the unique identification
#'     number(s) of the lithology(ies) represented within the outcrop shape
#'     element (see [def_lithologies()]).
#'   \item \code{t_int_id}: The identification number of the
#'     chronostratigraphic interval containing the top boundary of the outcrop
#'     shape element.
#'   \item \code{t_int_age}: The top age of the chronostratigraphic interval
#'     containing the top boundary of the outcrop shape element.
#'   \item \code{t_int_name}: The name of the chronostratigraphic interval
#'     containing the top boundary of the outcrop shape element.
#'   \item \code{b_int_id}: The identification number of the
#'     chronostratigraphic interval containing the bottom boundary of the
#'     outcrop shape element.
#'   \item \code{b_int_age}: The bottom age of the chronostratigraphic
#'     interval containing the bottom boundary of the outcrop shape element.
#'   \item \code{b_int_name}: The name of the chronostratigraphic interval
#'     containing the bottom boundary of the outcrop shape element.
#'   \item \code{color}: Recommended color for plotting the outcrop shape
#'     element based on the dominant lithology.
#'   \item \code{t_age}: The estimated top age (minimum age) of the outcrop
#'     shape element, in millions of years before present.
#'   \item \code{b_age}: The estimated bottom age (maximum age) of the outcrop
#'     shape element, in millions of years before present.
#'   \item \code{best_int_name}: The best/most representative interval name
#'     for the outcrop shape element.
#' }
#'   If `sf` is `TRUE` (the default), an `sf` object is returned instead, with
#'   the same columns plus a "geometry" column that contains the spatial data.
#'
#' @section Developer(s):
#'  William Gearty
#' @section Reviewer(s):
#'  Lewis A. Jones
#'
#' @details More information can be found for the inputs for this function
#'   using the definition functions (beginning with \code{def_}).
#'
#' @examples
#' \donttest{
#' ex1 <- get_map_outcrop(lat = 43, lng = -89.3)
#' ex2 <- get_map_outcrop(lat = 43, lng = -89.3, scale = "tiny")
#' }
#' @export
#' @family maps
get_map_outcrop <- function(map_id = NULL,
                            unit_id = NULL, strat_name_id = NULL,
                            lat = NULL, lng = NULL, scale = NULL, sf = TRUE) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    map_id = "integer",
    unit_id = "integer",
    strat_name_id = "integer",
    lat = "numeric",
    lng = "numeric",
    scale = "character",
    sf = "logical"
  )
  check_arguments(x = args, ref = ref)
  if (!is.null(lat) || !is.null(lng)) {
    if (is.null(lat) || is.null(lng)) {
      stop("`lat` and `lng` must both be specified to filter by an
           age range.")
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
  dat <- GET_macrostrat(endpoint = "geologic_units/map", query = args,
                        format = format)
  # Return data
  return(dat)
}
