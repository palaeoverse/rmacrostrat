#' @title Retrieve column age models
#' @description Obtain information about the age models for columns. This
#'  largely consists of the temporal boundaries applied to the column's
#'  constituent units.
#'
#' @param column_id \code{integer}. Filter age models to those associated with
#'   column(s) as specified by their unique identification number(s).
#' @param section_id \code{integer}. Filter age models to those associated with
#'   section(s) as specified by their unique identification number(s).
#'
#' @return A \code{dataframe} containing, for each boundary between units for
#' each retrieved age model:
#' \describe{
#'  \item{boundary_id}{The unique identifier of the boundary between two units}
#'  \item{col_id}{The unique identifier of the Macrostrat column}
#'  \item{section_id}{The unique identifier of the Macrostrat section}
#'  \item{interval_id}{The unique identifier of the time interval which the
#'  boundary lies within}
#'  \item{interval_name}{The name of the time interval which the boundary lies
#'  within}
#'  \item{age_bottom}{The numerical lower limit on the age of the boundary}
#'  \item{age_top}{The numerical upper limit on the age of the boundary}
#'  \item{rel_position}{The relative position of the boundary}
#'  \item{model_age}{The age of the boundary, as correlated with other ages in
#'  the column}
#'  \item{boundary_status}{The method used to determine the age of the boundary}
#'  \item{boundary_type}{The type of boundary}
#'  \item{boundary_position}{The position of the boundary}
#'  \item{unit_below}{The Macrostrat unit beneath the given boundary}
#'  \item{unit_above}{The Macrostrat unit above the given boundary}
#'  \item{ref_id}{The unique identifier of the reference}
#'  }
#'
#' @author Bethany Allen
#' @details The Macrostrat age models are used to determine the ages of the
#'  boundaries between units in an internally consistent manner, allowing each
#'  boundary to be dated with respect to all age information available for the
#'  column.
#'
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # age_model <- get_age_model(column_id = c(503, 504))
#' }
#' }
#' @export
#' @family macrostrat
get_age_model <- function(
    column_id = NULL,
    section_id = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    column_id = "integer",
    section_id = "integer"
  )
  check_arguments(x = args, ref = ref)

  # Recode names
  api_names <- list(column_id = "col_id")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))

  # Set default for format
  format <- "json"

  # Get request
  dat <- GET_macrostrat(endpoint = "age_model", query = args, format = format)

  # Return data
  return(dat)
}
