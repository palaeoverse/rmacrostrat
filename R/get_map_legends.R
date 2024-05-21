#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param source_id \code{integer}. Filter legend components to those in sources specified by their unique identification number(s)., Default: NULL
#' @param lithology_id \code{integer}. Filter legend components to those containing one or more lithology(ies) as specified by their unique identification number(s)., Default: NULL
#' @param lithology_type \code{character}. Filter legend components to those containing one or more named lithology type(s) (e.g., "carbonate", "siliciclastic")., Default: NULL
#' @param lithology_class \code{character}. Filter legend components to those containing one or more named lithology class(es) (e.g., "sedimentary", "igneous", "metamorphic")., Default: NULL
#' @param description \code{character}. Filter legend components to those containing the given character string in the map unit description field., Default: NULL
#' @param comments \code{character}. Filter legend components to those containing the given character string in the map unit comments field., Default: NULL
#' @param scale \code{character}. Filter legend components to those from maps of specific scale(s) in Macrostrat's system. Options are "tiny" (global), "small" (continental), "medium" (regional), or "large" (local)., Default: NULL
#' @param carto \code{character}. Filter legend components to those of specific scale(s) in Macrostrat's system. Options are "tiny" (global), "small" (continental), "medium" (regional), or "large" (local)., Default: NULL
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

get_map_legends <- function (
   source_id = NULL,
   lithology_id = NULL,
   lithology_type = NULL,
   lithology_class = NULL,
   description = NULL,
   comments = NULL,
   scale = NULL,
   carto = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    source_id = 'integer', 
    lithology_id = 'integer', 
    lithology_type = 'character', 
    lithology_class = 'character', 
    description = 'character', 
    comments = 'character', 
    scale = 'character', 
    carto = 'character')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

