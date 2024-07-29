#' @title Retrieve metadata for Macrostrat projects
#'
#' @description A function to obtain information concerning the different
#'   Macrostrat projects. If no arguments are specified (default), data for
#'   all projects are returned.
#'
#' @param project_id \code{integer}. The unique identification number(s) of
#'   the desired project(s) to return a definition for.
#'
#' @return A \code{data.frame} containing:
#' \itemize{
#'  \item \code{project_id}: The unique identification number of the
#'  Macrostrat project.
#'  \item \code{project}: The name of the Macrostrat project.
#'  \item \code{descrip}: Description of the Macrostrat project.
#'  \item \code{timescale_id}: The unique identification number of the
#'  timescale used in the Macrostrat project.
#'  \item \code{t_cols}: The total number of Macrostrat columns associated
#'  with the project.
#'  \item \code{in_process_cols}: The total number of in-progress Macrostrat
#'  columns associated with the project.
#'  \item \code{obsolete_cols}: The total number of obsolete Macrostrat
#'  columns associated with the project.
#'  \item \code{t_units}: The total number of Macrostrat units associated with
#'  the project.
#'  \item \code{area}: The area covered by the Macrostrat project in
#'   km\ifelse{html}{\out{<sup>2</sup>}}{\eqn{^2}}.
#'  }
#'
#' @section Developer(s):
#' Bethany Allen
#'
#' @section Reviewer(s):
#' Lewis A. Jones
#'
#' @examples
#' \donttest{
#'  ex1 <- def_projects()
#'  ex2 <- def_projects(project_id = 4)
#' }
#' @export
#' @family meta
def_projects <- function(project_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(project_id = "integer")
  check_arguments(x = args, ref = ref)
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/projects",
                        query = args,
                        format = "json")
  # Return data
  return(dat)
}
