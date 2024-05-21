#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param age \code{numeric}. Return a paleogeographic reconstruction based on a numerical age in millions of years (between 0 and 550)., Default: NULL
#' @param interval_name \code{character}. Return a paleogeographic reconstruction based on a specified time interval. Ignored if `age` is supplied., Default: NULL
#' @param sf \code{logical}. Should the results be returned as an `sf` object? Defaults to `TRUE`. If `FALSE`, a `data.frame` is returned., Default: NULL
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

get_paleogeography <- function (
   age = NULL,
   interval_name = NULL,
   sf = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    age = 'numeric', 
    interval_name = 'character', 
    sf = 'logical')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

