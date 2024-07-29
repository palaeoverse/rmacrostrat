#' @title Retrieve paleogeographic geometries
#'
#' @description A function to retrieve paleogeographic geometries
#'   reconstructed to a given a age or interval using the Wright et al. (2013)
#'   Global Plate Model.
#'
#' @param age \code{numeric}. Return a paleogeographic reconstruction based on
#'   a numerical age in millions of years before present (between 0 and 550).
#' @param interval_name \code{character}. Return a paleogeographic
#'   reconstruction based on a specified time interval. Ignored if `age` is
#'   supplied.
#' @return An `sf` object containing the geometries of the paleogeographic map.
#' @section Developer(s):
#'  Lewis A. Jones
#' @section Reviewer(s):
#'  Christopher D. Dean
#' @details More information for appropriate interval inputs for this function
#' can be found using the \code{def_intervals()} function.
#' @section References: Wright, N., Zahirovic, S., Müller, R.D., Seton, M.
#'   (2013). Towards community-driven paleogeographic reconstructions:
#'   integrating open-access paleogeographic and paleobiology data with plate
#'   tectonics. Biogeosciences, 10, 1529--1541. \doi{10.5194/bg-10-1529-2013}.
#' @examples
#' \donttest{
#'  # Get paleogeographic map via age
#'  ex1 <- get_paleogeography(age = 250)
#'  # Get paleogeographic map via interval name
#   ex2 <- get_paleogeography(interval_name = "Campanian")
#' }
#' @export
#' @family paleogeo
get_paleogeography <- function(age = NULL, interval_name = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(age = "numeric", interval_name = "character")
  check_arguments(x = args, ref = ref)
  # Check user inputs
  if (is.null(age) && is.null(interval_name)) {
    stop("Either `age` or `interval_name` must be provided.")
  }
  # Get request
  dat <- GET_macrostrat(endpoint = "paleogeography",
                        query = args, format = "geojson")
  # Return data
  return(dat)
}
