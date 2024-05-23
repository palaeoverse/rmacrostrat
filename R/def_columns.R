#' @title Retrieve definitions for Macrostrat columns
#' @description A function to retrieve the definitions for Macrostrat columns.
#'   By default, all definitions are returned.
#' @param column_id \code{integer}. The unique identification number(s) of the
#'   desired column(s) to return a definition for.
#' @param column_group_id \code{integer}. The unique identification number(s) of
#'   the desired column group(s) to return a definition for.
#' @param column_name \code{character}. The name of the desired column to return
#'   a definition for.
#' @param project_id \code{integer}. The unique identification number(s) of the
#'   desired Macrostrat project(s) to return a definition for.
#' @param status \code{character}. The status of the column to return a
#'   definition for. Either "active", "in process", or "obsolete".
#' @return A \code{data.frame} containing the following columns:
#' \itemize{
#'   \item \code{col_id}: Unique identification number for the column.
#'   \item \code{col_group_id}: The identification number of the group to which
#'     the column belongs.
#'   \item \code{col_name}: Name of the column.
#'   \item \code{lat}: Latitude in WGS84 of the centroid of the column.
#'   \item \code{lng}: Longitude in WGS84 of the centroid of the column.
#'   \item \code{col_area}: Area of the Macrostrat column,
#'     in km\ifelse{html}{\out{<sup>2</sup>}}{\eqn{^2}}.
#'   \item \code{project_id}: Unique identification number for the column's
#'     project, corresponds to general geographic region.
#'   \item \code{t_units}: Total number of Macrostrat units within the column.
#'   \item \code{ref_id}: Unique identification number for the reference
#'     associated with the column.
#'   \item \code{status}: Indicates the current status of the column (values are
#'     'active', 'in process', and 'obsolete').
#' }
#' @author William Gearty
#' @examples
#' \dontrun{
#' # get all column definitions
#' ex1 <- def_columns()
#' # get subset of column definitions
#' ex2 <- def_columns(column_group_id = 17)
#' ex3 <- def_columns(column_name = "Eastern Kentucky")
#' }
#' @export
def_columns <- function(column_id = NULL, column_group_id = NULL,
                        column_name = NULL, project_id = NULL, status = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(column_id = "integer", column_group_id = "integer",
              column_name = "character", project_id = "integer",
              status = "character")
  check_arguments(x = args, ref = ref)
  # Change arguments to default api names
  api_names <- list(column_group_id = "col_group_id", column_id = "col_id",
                    column_name = "col_name")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))
  # Get request
  dat <- GET_macrostrat(endpoint = "/defs/columns", query = args,
                        format = "json")

  # Return data
  return(dat)
}
