#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param source_id \code{integer}. The unique identification number(s) of the desired source(s) to return a definition for.
#' @param lat \code{numeric}. A valid latitude in decimal degrees to return a source definition for. Must also supply a valid longitude.
#' @param lng \code{numeric}. A valid longitude in decimal degrees to return a source definition for. Must also supply a valid latitude.
#' @param shape \code{character}. A valid well-known text (WKT) representation of geometry, such as "POINT(30 10)" or "POLYGON((30 10, 40 40, 20 40, 10 20))", to return a source definition for.
#' @param buffer \code{integer}. The geographic buffer (in metres) that should be applied to the specified `shape`.
#' @param scale \code{character}. The desired Burwell scale, either: "tiny" (global), "small" (continental), "medium" (regional), or "large" (local).
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

def_sources <- function (
   source_id = NULL,
   lat = NULL,
   lng = NULL,
   shape = NULL,
   buffer = NULL,
   scale = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    source_id = 'integer', 
    lat = 'numeric', 
    lng = 'numeric', 
    shape = 'character', 
    buffer = 'integer', 
    scale = 'character')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- 'json'
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

