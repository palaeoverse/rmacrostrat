#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param grain_name \code{character}. The name of the specific grain (e.g., "Coarse Gravel") to return a definition for., Default: NULL
#' @param grain_group \code{character}. The name of the group the grain belongs to (e.g., "Gravel") to return a definition for., Default: NULL
#' @param soil_group \code{character}. The name of the family of soils the grain belongs to (e.g., "Coarse Soil") to return a definition for., Default: NULL
#' @param grain_id \code{integer}. The unique identification number(s) of the desired grain definitions(s) to return a definition for., Default: NULL
#' @param grain_symbol \code{character}. The abbreviation of the desired grain definition(s) (e.g., "CGr") to return a definition for., Default: NULL
#' @param grain_classification \code{character}. The classification scheme the given grain belongs to (e.g., "Wentworth") to return a definition for., Default: NULL
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

def_grain_sizes <- function (
   grain_name = NULL,
   grain_group = NULL,
   soil_group = NULL,
   grain_id = NULL,
   grain_symbol = NULL,
   grain_classification = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    grain_name = 'character', 
    grain_group = 'character', 
    soil_group = 'character', 
    grain_id = 'integer', 
    grain_symbol = 'character', 
    grain_classification = 'character')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

