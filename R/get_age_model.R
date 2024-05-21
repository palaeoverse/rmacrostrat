#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param column_id \code{integer}. Filter age models to those associated with column(s) as specified by their unique identification number(s).
#' @param section_id \code{integer}. Filter age models to those associated with section(s) as specified by their unique identification number(s).
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

get_age_model <- function(
    column_id = NULL,
    section_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    column_id = "integer",
    section_id = "integer"
  )
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- "json"
  # Get request
  dat <- GET_macrostrat(endpoint = "INSERT ENDPOINT", query = args, format = format)

  # Return data
  return(dat)
}
