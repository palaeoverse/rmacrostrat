#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param point_id \code{integer}. The unique identification number(s) of the point(s) to return.
#' @param point_type \code{character}. Filter points to those of one or more point type(s). Options are "cleavage", "bedding", "axial plane", "fault plane", "foliation", and "joint". Ignored if `point_id` is supplied.
#' @param min_lat \code{integer}. A minimum latitude that represents the southwest corner of a bounding box of the points to return. Requires `min_lng`, `max_lat`, and `max_lng`. Ignored if `point_id` is supplied.
#' @param min_lng \code{integer}. A minimum longitude that represents the southwest corner of a bounding box of the points to return. Requires `min_lat`, `max_lat`, and `max_lng`. Ignored if `point_id` is supplied.
#' @param max_lat \code{integer}. A maximum latitude that represents the northeast corner of a bounding box of the points to return. Requires `min_lat`, `min_lng`, and `max_lng`. Ignored if `point_id` is supplied.
#' @param max_lng \code{integer}. A maximum longitude that represents the northeast corner of a bounding box of the points to return. Requires `min_lat`, `min_lng`, and `max_lat`. Ignored if `point_id` is supplied.
#' @param source_id \code{integer}. The unique identification number(s) of the source(s) to filter the points by. Ignored if `point_id` is supplied.
#' @param sf \code{logical}. Should the results be returned as an `sf` object? Defaults to `TRUE`. If `FALSE`, a `data.frame` is returned.
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

get_map_points <- function (
   point_id = NULL,
   point_type = NULL,
   min_lat = NULL,
   min_lng = NULL,
   max_lat = NULL,
   max_lng = NULL,
   source_id = NULL,
   sf = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    point_id = 'integer', 
    point_type = 'character', 
    min_lat = 'integer', 
    min_lng = 'integer', 
    max_lat = 'integer', 
    max_lng = 'integer', 
    source_id = 'integer', 
    sf = 'logical')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- 'json'
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

