#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param environ \code{character}. The name of a specific environment (e.g., "reef") to return a definition for.
#' @param environ_type \code{character}. The name of a type of environment (e.g., "carbonate") to return a definition for.
#' @param environ_class \code{character}. The name of a class of envrionment (e.g., "marine") to return a definition for.
#' @param environ_id \code{integer}. The unique identification number(s) of the desired environment(s) to return a definition for.
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

def_environments <- function (
   environ = NULL,
   environ_type = NULL,
   environ_class = NULL,
   environ_id = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    environ = 'character', 
    environ_type = 'character', 
    environ_class = 'character', 
    environ_id = 'integer')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- 'json'
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

