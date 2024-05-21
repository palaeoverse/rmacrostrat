#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param mineral \code{character}. The name of a mineral (e.g., "calcite") to return a definition for., Default: NULL
#' @param mineral_type \code{character}. The type of mineral (e.g., "feldspar") to return a definition for., Default: NULL
#' @param element \code{character}. The chemical element abbreviation of a mineral to return a definition for (e.g., "CaCO3"). Note: abbreviations are case sensitive., Default: NULL
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

def_minerals <- function (
   mineral = NULL,
   mineral_type = NULL,
   element = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    mineral = 'character', 
    mineral_type = 'character', 
    element = 'character')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

