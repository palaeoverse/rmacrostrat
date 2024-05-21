#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param column_id \code{integer}. The unique identification number(s) of the desired column(s) to return a definition for.
#' @param column_group_id \code{integer}. The unique identification number(s) of the desired column group(s) to return a definition for.
#' @param column_name \code{character}. The name of the desired column to return a definition for.
#' @param project_id \code{integer}. The unique identification number(s) of the desired Macrostrat project(s) to return a definition for.
#' @param status \code{character}. The status of the column to return a definition for. Either "active", "in process", or "obsolete".
#' @return OUTPUT_DESCRIPTION
#' @author AUTHOR [AUTHOR_2]
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @export 

def_columns <- function (
   column_id = NULL,
   column_group_id = NULL,
   column_name = NULL,
   project_id = NULL,
   status = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    column_id = 'integer', 
    column_group_id = 'integer', 
    column_name = 'character', 
    project_id = 'integer', 
    status = 'character')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- 'json'
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

