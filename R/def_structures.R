#' @title Define geological structure
#'
#' @description A function to retrieve definitions for various geological
#'   structures within the Macrostrat database.
#'
#' @param structure \code{character}. The name of a geological structure
#'   (e.g., "syncline") to return a definition for.
#' @param structure_class \code{character}. The name of the geological
#'   structure class (e.g., "sedimentology") to return a definition for.
#' @param structure_type \code{character}. The name of the geological
#'   structure type (e.g., "fault") to return a definition for.
#' @param structure_id \code{integer}. The unique idenfication number(s) of
#'   geological structures(s) to return a definition for.
#' @return A \code{data.frame} containing the following columns:
#' \itemize{
#'   \item \code{structure_id}: The unique identification number of the
#'     structure.
#'   \item \code{name}: The name of the structure.
#'   \item \code{structure_type}: Structure type, less inclusive than class.
#'   \item \code{group}: Structure group, less inclusive than type.
#'   \item \code{class}: Structure class, more inclusive than type.
#' }
#' @section Developer(s):
#'  William Gearty
#' @section Reviewer(s):
#'  Lewis A. Jones
#' @examples
#' \donttest{
#' # Get all structure definitions
#' ex1 <- def_structures()
#' # Get subset of structure definitions
#' ex2 <- def_structures(structure_id = c(1, 3))
#' ex3 <- def_structures(structure_class = "igneous")
#' }
#' @export
#' @family defs_feat
def_structures <- function(structure = NULL, structure_class = NULL,
                           structure_type = NULL, structure_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(structure = "character", structure_class = "character",
              structure_type = "character", structure_id = "integer")
  check_arguments(x = args, ref = ref)
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/structures", query = args,
                        format = "json")
  # Return data
  return(dat)
}
