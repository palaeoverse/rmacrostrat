#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param strat_concept_name \code{character}. The name(s) of the desired stratigraphic name concept(s) to return a definition for (e.g., "Hell Creek").
#' @param strat_concept_id \code{integer}. The unique identification number(s) of the desired stratigraphic name concept(s) to return a definition for.
#' @return OUTPUT_DESCRIPTION
#' @author AUTHOR [AUTHOR_2]
#' @details DETAILS
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # EXAMPLE1
#' }
#' }
#' @export

def_strat_name_concepts <- function(
    strat_concept_name = NULL,
    strat_concept_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    strat_concept_name = "character",
    strat_concept_id = "integer"
  )
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- "json"
  # Get request
  dat <- GET_macrostrat(endpoint = "INSERT ENDPOINT", query = args, format = format)

  # Return data
  return(dat)
}
