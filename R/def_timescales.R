#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param all \code{logical}. Should all available timescales be returned?, Default: NULL
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

def_timescales <- function (
   all = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    all = 'logical')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- 'json'
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

