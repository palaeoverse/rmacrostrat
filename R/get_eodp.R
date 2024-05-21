#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param column_id \code{integer}. Filter cores by unique identification number(s) of column(s)., Default: NULL
#' @param site \code{character}. Filter cores to those of a particular drilling site (e.g., "U1351")., Default: NULL
#' @param leg \code{character}. Filter cores to those of a particular drilling leg (or expedition for IODP, e.g., "317")., Default: NULL
#' @param program \code{character}. Filter cores to those of a particular drilling program ("DSDP", "ODP", or "IODP")., Default: NULL
#' @param sf \code{logical}. Should the results be returned as an `sf` object? Defaults to `FALSE`., Default: NULL
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

get_eodp <- function (
   column_id = NULL,
   site = NULL,
   leg = NULL,
   program = NULL,
   sf = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    column_id = 'integer', 
    site = 'character', 
    leg = 'character', 
    program = 'character', 
    sf = 'logical')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

