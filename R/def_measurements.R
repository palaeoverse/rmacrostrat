#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param measure_id \code{integer}. The unique identification number(s) of the desired measurement definition(s) to return a definition for., Default: NULL
#' @param measurement_type \code{character}. The type of measurement definitions to return a definition for (e.g., "geochronological"). This is a less inclusive grouping than `class`., Default: NULL
#' @param measurement_class \code{character}. The class of measurement definitions to return a definition for (e.g., "geochemical"). This is a more inclusive grouping than `type`., Default: NULL
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

def_measurements <- function (
   measure_id = NULL,
   measurement_type = NULL,
   measurement_class = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    measure_id = 'integer', 
    measurement_type = 'character', 
    measurement_class = 'character')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

