#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param timescale \code{character}. The name of the desired timescale to return a definition for (e.g., "international epochs")., Default: NULL
#' @param interval_name \code{character}. The name of the desired interval to return a definition for. If set to NULL (default), all interval data for the respective timescale is returned., Default: NULL
#' @param interval_id \code{integer}. The identification number(s) of the desired time interval to return a definition for., Default: NULL
#' @param age \code{numeric}. Age in millions of years before present to return an interval definition for. All intervals overlapping with this age will be returned., Default: NULL
#' @param age_top \code{numeric}. The minimum age for which interval definitions should be returned, in millions of years before present. If specified, `age_bottom` must also be specified, and this must be younger than `age_bottom`., Default: NULL
#' @param age_bottom \code{numeric}. The maximum age for which interval definitions should be returned, in millions of years before present. If specified, `age_top` must also be specified, and this must be older than `age_top`., Default: NULL
#' @param rule \code{character}. How should interval definitions be returned for the given `age_top` and `age_bottom`? Use "contains" to return all intervals that fall entirely within `age_top` and `age_bottom`. Use "exact" to return any intervals with both boundaries equal to `age_top` and `age_bottom`. Use "loose" (the default) to return all intervals touching the range of `age_top` and `age_bottom`. If `age_top` and `age_bottom` are not provided, this argument is ignored., Default: NULL
#' @param true_colors \code{logical}. Should the original international time scale colors be returned? Defaults to `TRUE`., Default: NULL
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

def_intervals <- function (
   timescale = NULL,
   interval_name = NULL,
   interval_id = NULL,
   age = NULL,
   age_top = NULL,
   age_bottom = NULL,
   rule = NULL,
   true_colors = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    timescale = 'character', 
    interval_name = 'character', 
    interval_id = 'integer', 
    age = 'numeric', 
    age_top = 'numeric', 
    age_bottom = 'numeric', 
    rule = 'character', 
    true_colors = 'logical')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

