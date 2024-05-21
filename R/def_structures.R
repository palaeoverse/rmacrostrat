#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param structure \code{character}. The name of a geological structure (e.g., "syncline") to return a definition for., Default: NULL
#' @param structure_class \code{character}. The name of the geological structure class (e.g., "sedimentology") to return a definition for., Default: NULL
#' @param structure_type \code{character}. The name of the geological structure type (e.g., "fault") to return a definition for., Default: NULL
#' @param structure_id \code{integer}. The unique idenfication number(s) of geological structures(s) to return a definition for., Default: NULL
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

def_structures <- function (
   structure = NULL,
   structure_class = NULL,
   structure_type = NULL,
   structure_id = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    structure = 'character', 
    structure_class = 'character', 
    structure_type = 'character', 
    structure_id = 'integer')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

