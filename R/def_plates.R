#' @title Define tectonic plates
#'
#' @description A function to retrieve tectonic plate definitions for a
#'   user-specified plate identification number, as defined by the Wright et
#'   al. (2013) Global Plate Model. If no arguments are supplied, all plates
#'   are returned.
#'
#' @param plate_id \code{integer}. The unique identification number(s) of the
#'   desired plate(s) to return a definition for. If NULL (default), all
#'   plates are returned.
#' @return A `data.frame` containing the `plate_id` of the tectonic plate and
#'   the name of the tectonic plate as defined by Wright et al. (2013).
#' @section Developer(s):
#'  Lewis A. Jones
#' @section Reviewer(s):
#'  Christopher D. Dean
#' @section References: Wright, N., Zahirovic, S., Müller, R.D., Seton, M.
#'   (2013). Towards community-driven paleogeographic reconstructions:
#'   integrating open-access paleogeographic and paleobiology data with plate
#'   tectonics. Biogeosciences, 10, 1529--1541. \doi{10.5194/bg-10-1529-2013}.
#' @examples
#' \donttest{
#'  # Get all tectonic plates
#'  ex1 <- def_plates()
#'  # Get name of tectonic plate by ID
#'  ex2 <- def_plates(plate_id = 604)
#' }
#' @export
#' @family paleogeo
def_plates <- function(plate_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(plate_id = "integer")
  check_arguments(x = args, ref = ref)
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/plates/",
                        query = args, format = "json")
  # Return data
  return(dat)
}
