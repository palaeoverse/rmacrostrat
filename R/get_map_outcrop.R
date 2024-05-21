#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param map_id \code{integer}. The unique identification number(s) of the map polygon(s) to return. Ignored if `unit_id` is supplied., Default: NULL
#' @param unit_id \code{integer}. Filter unit(s) by their unique identification number(s)., Default: NULL
#' @param strat_name_id \code{integer}. Filter units to those that match one or more stratigraphic name(s) as specified by their unique identification number(s). Ignored if `unit_id` or `map_id` is supplied., Default: NULL
#' @param lat \code{numeric}. Return the units at the specified decimal degree latitude. Must also specify `lng`. Ignored if `unit_id` or `map_id` is supplied., Default: NULL
#' @param lng \code{numeric}. Return the units at the specified decimal degree longitude. Must also specify `lat`. Ignored if `unit_id` or `map_id` is supplied., Default: NULL
#' @param scale \code{character}. The Macrostrat map scale to use. Options are "tiny" (global), "small" (continental), "medium" (regional), or "large" (local). Ignored if `unit_id` or `map_id` is supplied., Default: NULL
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

get_map_outcrop <- function (
   map_id = NULL,
   unit_id = NULL,
   strat_name_id = NULL,
   lat = NULL,
   lng = NULL,
   scale = NULL,
   sf = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    map_id = 'integer', 
    unit_id = 'integer', 
    strat_name_id = 'integer', 
    lat = 'numeric', 
    lng = 'numeric', 
    scale = 'character', 
    sf = 'logical')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

