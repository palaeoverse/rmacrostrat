#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param lithology_att \code{character}. The name of the lithology attribute (e.g., "cross-bedded") to return a definition for.
#' @param att_type \code{character}. The type of lithology attribute (e.g., "sed structure") to return a definition for.
#' @param lithology_att_id \code{integer}. The unique identification number(s) of lithology attribute(s) to return a definition for.
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

def_lithology_att <- function(
    lithology_att = NULL,
    att_type = NULL,
    lithology_att_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    lithology_att = "character",
    att_type = "character",
    lithology_att_id = "integer"
  )
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- "json"
  # Get request
  dat <- GET_macrostrat(endpoint = "INSERT ENDPOINT", query = args, format = format)

  # Return data
  return(dat)
}
