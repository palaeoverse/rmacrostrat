#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param lithology \code{character}. The name of a lithology (e.g., "limestone") to return a definition for.
#' @param lithology_group \code{character}. The name of a lithological group (e.g., "unconsolidated") to return a definition for.
#' @param lithology_class \code{character}. The name of a lithological class (e.g., "sedimentary") to return a definition for.
#' @param lithology_type \code{character}. The name of a lithological type (e.g., "siliciclastic") to return a definition for.
#' @param lithology_id \code{integer}. The unique identification number(s) of one or more lithologies to return a definition for.
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

def_lithologies <- function(
    lithology = NULL,
    lithology_group = NULL,
    lithology_class = NULL,
    lithology_type = NULL,
    lithology_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    lithology = "character",
    lithology_group = "character",
    lithology_class = "character",
    lithology_type = "character",
    lithology_id = "integer"
  )
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- "json"
  # Get request
  dat <- GET_macrostrat(endpoint = "INSERT ENDPOINT", query = args, format = format)

  # Return data
  return(dat)
}
