#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param strat_name \code{character}. The name(s) of the desired stratigraphic unit(s) to return a definition for., Default: NULL
#' @param interval_name \code{character}. The chronostratigraphic interval name for which to return stratigraphic name definitions with any temporal overlap (e.g., "Campanian"). This returns only `strat_names` with an age declared in Macrostrat., Default: NULL
#' @param rank \code{character}. The formal stratigraphic rank abbreviation of the desired unit(s) (i.e., "SGp", "Gp", "SubGp", "Fm", "Mbr", or "Bed") to return a definition for., Default: NULL
#' @param concept_id \code{integer}. The unique identification number(s) of stratigraphic concepts (grouped `strat_name`s which represent the same entity) to return a definition for., Default: NULL
#' @param ref_id \code{character}. The unique identification number(s) of the desired reference(s). Only stratigraphic names linked to the specified `ref_id` will be returned., Default: NULL
#' @param strat_name_id \code{integer}. The unique identification number(s) of the desired stratigraphic name to return a definition for., Default: NULL
#' @param rule \code{character}. The hierarchical rule for returning stratigraphic name definitions (either "all" or "down"). The "all" option will return the entire stratigraphic name hierarchy (parents and children of all levels) that the specified request belongs to. The "down" option will return any direct children of the requested stratigraphic name. Can only be used with `strat_name_id`., Default: NULL
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

def_strat_names <- function (
   strat_name = NULL,
   interval_name = NULL,
   rank = NULL,
   concept_id = NULL,
   ref_id = NULL,
   strat_name_id = NULL,
   rule = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    strat_name = 'character', 
    interval_name = 'character', 
    rank = 'character', 
    concept_id = 'integer', 
    ref_id = 'character', 
    strat_name_id = 'integer', 
    rule = 'character')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

