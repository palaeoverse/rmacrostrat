#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param econ \code{character}. The name of the economic resource (e.g., "gas reservoir") to return a definition for., Default: NULL
#' @param econ_type \code{character}. The type of economic resource (e.g., "hydrocarbon") to return a definition for., Default: NULL
#' @param econ_class \code{character}. The class of economic resource (e.g., "energy") to return a definition for., Default: NULL
#' @param econ_id \code{integer}. The unique idenfication number(s) of the economic resource(s) to return a definition for., Default: NULL
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

def_econs <- function (
   econ = NULL,
   econ_type = NULL,
   econ_class = NULL,
   econ_id = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    econ = 'character', 
    econ_type = 'character', 
    econ_class = 'character', 
    econ_id = 'integer')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

