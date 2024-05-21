#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param project_id \code{integer}. The unique identification number(s) of the desired project(s) to return a definition for. If NULL (default), all projects are returned., Default: NULL
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

def_projects <- function (
   project_id = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    project_id = 'integer')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

