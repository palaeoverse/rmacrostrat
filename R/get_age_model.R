#' @title Retrieve Macrostrat column age models
#'
#' @description A function to obtain information about the age models used for
#'   Macrostrat columns or sections. This consists of the temporal boundaries
#'   applied to the column's constituent units.
#'
#' @param column_id \code{integer}. Filter age models to those associated with
#'   column(s) as specified by their unique identification number(s).
#' @param section_id \code{integer}. Filter age models to those associated with
#'   section(s) as specified by their unique identification number(s).
#'
#' @return A \code{data.frame} containing, for each boundary between units for
#' each retrieved age model:
#' \itemize{
#'   \item{boundary_id}: The unique identification number of the boundary
#'   between two units.
#'   \item{col_id}: The unique identification number of the Macrostrat column.
#'   \item{section_id}: The unique identification number of the Macrostrat
#'   section.
#'   \item{interval_id}: The unique identification number of the time interval
#'   which the boundary lies within.
#'   \item{interval_name}: The name of the time interval which the boundary
#'   lies within.
#'   \item{age_bottom}: The numerical lower limit on the age of the boundary
#'   (maximum age), in millions of years before present.
#'   \item{age_top}: The numerical upper limit on the age of the boundary
#'   (minimum age), in millions of years before present.
#'   \item{rel_position}: The relative position of the boundary.
#'   \item{model_age}: The age of the boundary, as correlated with other ages in
#'   the column, in millions of years before present.
#'   \item{boundary_status}: The method used to determine the age of the
#'   boundary.
#'   \item{boundary_type}: The type of boundary.
#'   \item{boundary_position}: The position of the boundary.
#'   \item{unit_below}: The Macrostrat unit beneath the given boundary.
#'   \item{unit_above}: The Macrostrat unit above the given boundary.
#'   \item{ref_id}: The unique identification number of the reference.
#'  }
#'
#' @section Developer(s):
#'  Bethany Allen
#'
#' @section Reviewer(s):
#'  Lewis A. Jones
#'
#' @details The Macrostrat age models are used to determine the ages of the
#'  boundaries between units in an internally consistent manner, allowing each
#'  boundary to be dated with respect to all age information available for the
#'  column.
#'
#' @examples
#' \donttest{
#'  # Get age model for specific columns by ID
#'  ex1 <- get_age_model(column_id = c(503, 504))
#'  # Get age model for specific sections by ID
#'  ex2 <- get_age_model(section_id = c(65, 22))
#' }
#' @export
#' @family macrostrat
get_age_model <- function(column_id = NULL, section_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    column_id = "integer",
    section_id = "integer"
  )
  check_arguments(x = args, ref = ref)
  # Handle errors
  if (is.null(column_id) && is.null(section_id)) {
    stop("A `column_id` or `section_id` must be specified.")
  }
  # Recode names
  api_names <- list(column_id = "col_id")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))
  # Get request
  dat <- GET_macrostrat(endpoint = "age_model",
                        query = args,
                        format = "json")
  # Return data
  return(dat)
}
