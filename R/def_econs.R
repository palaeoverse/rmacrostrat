#' @title Define economic resources
#'
#' @description A function to retrieve the definitions for one or more
#'   economic resources in the Macrostrat database. By default, all economic
#'   definitions are returned.
#'
#' @param econ \code{character}. The name of the economic resource (e.g., "gas
#'   reservoir") to return a definition for.
#' @param econ_type \code{character}. The type of economic resource (e.g.,
#'   "hydrocarbon") to return a definition for.
#' @param econ_class \code{character}. The class of economic resource (e.g.,
#'   "energy") to return a definition for.
#' @param econ_id \code{integer}. The unique identification number(s) of the
#'   economic resource(s) to return a definition for.
#'
#' @return A \code{data.frame} containing the following columns:
#' \itemize{
#'  \item \code{econ_id}: The unique identifier of the economic resource.
#'  \item \code{name}: The name of the economic resource.
#'  \item \code{type}: The type of economic resource.
#'  \item \code{class}: The class of economic resource.
#'  \item \code{color}: The recommended coloring for units based on the dominant
#'    lithology.
#'  \item \code{t_units}: The total number of Macrostrat units containing the
#'    economic resource.
#'  }
#'
#' @section Developer(s):
#'   Bethany Allen
#' @section Reviewer(s):
#'   William Gearty
#'
#' @examples
#' \donttest{
#' # Return all economic resource definitions
#' econ_inf <- def_econs()
#' # Return only definitions for hydrocarbon resources
#' econ_inf <- def_econs(econ_type = "hydrocarbon")
#' }
#' @export
#' @family defs_feat
def_econs <- function(econ = NULL, econ_type = NULL, econ_class = NULL,
                      econ_id = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(econ = "character", econ_type = "character",
              econ_class = "character", econ_id = "integer")
  check_arguments(x = args, ref = ref)

  # Get request
  dat <- GET_macrostrat(endpoint = "defs/econs", query = args, format = "json")

  # Return data
  return(dat)
}
