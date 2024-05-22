#' @title Retrieve paleogeographic geometries
#'
#' @description A function to retrieve paleogeographic geometries
#'   reconstructed to a given a age or interval using the Wright et al. (2013)
#'   Global Plate Model.
#'
#' @param age \code{numeric}. Return a paleogeographic reconstruction based on
#'   a numerical age in millions of years (between 0 and 550).
#' @param interval_name \code{character}. Return a paleogeographic
#'   reconstruction based on a specified time interval. Ignored if `age` is
#'   supplied.
#' @param sf \code{logical}. Should the results be returned as an `sf` object?
#'   Defaults to `TRUE`. If `FALSE`, a `data.frame` is returned.
#'
#' @return If `sf` = `TRUE` (default), returns an `sf` object containing the
#'   geometries of the paleogeographic map. If `sf` = `FALSE`, returns a
#'   `list` of the paleogeographic map geometries.
#'
#' @author Lewis A. Jones
#'
#' @section References: Sessa JA, Fraass AJ, LeVay LJ, Jamson KM, and Peters
#'   SE. (2023). Towards community-driven paleogeographic reconstructions:
#'   integrating open-access paleogeographic and paleobiology data with plate
#'   tectonics. Biogeosciences, 10, 1529--1541. \doi{10.5194/bg-10-1529-2013}.
#'
#' @examples
#' \dontrun{
#'  # Get paleogeographic map via age
#'  ex1 <- get_paleogeography(age = 250)
#'  # Get paleogeographic map via interval name
#   ex2 <- get_paleogeography(interval_name = "Campanian")
#' }
#' @export
get_paleogeography <- function(age = NULL, interval_name = NULL, sf = TRUE) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(age = "numeric", interval_name = "character", sf = "logical")
  check_arguments(x = args, ref = ref)
  # Check user inputs
  if (is.null(age) && is.null(interval_name)) {
    stop("Either `age` or `interval_name` must be provided.")
  }
  # Set default for format
  if (sf) format <- "geojson" else format <- "json"
  # Get request
  dat <- GET_macrostrat(endpoint = "paleogeography",
                        query = args, format = format)
  # Return data
  return(dat)
}
