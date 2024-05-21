#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param program \code{character}. The name of a drilling program (i.e., "DSDP", "ODP", or "IODP") to return a definiton for., Default: NULL
#' @param leg \code{integer}. The unique identification number(s) of drilling leg(s) to return a definition for., Default: NULL
#' @param site \code{integer}. The unique identification number(s) of drilling site(s) to return a definition for., Default: NULL
#' @param sf \code{logical}. Should the results be returned as an `sf` object (defaults to `TRUE`)? If `FALSE`, a `data.frame` is returned., Default: NULL
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

def_drilling_sites <- function (
   program = NULL,
   leg = NULL,
   site = NULL,
   sf = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    program = 'character', 
    leg = 'integer', 
    site = 'integer', 
    sf = 'logical')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

