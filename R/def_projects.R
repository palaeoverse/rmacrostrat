#' @title Retrieve metadata for Macrostrat projects
#' @description Obtain information concerning the different Macrostrat
#' projects. By default, data for all projects are returned.
#'
#' @param project_id \code{integer}. The unique identification number(s) of the
#'   desired project(s) to return a definition for.
#'
#' @return A \code{dataframe} containing:
#' \describe{
#'  \item{project_id}{The unique identifier of the Macrostrat project}
#'  \item{project}{The name of the Macrostrat project}
#'  \item{descrip}{Description of the Macrostrat project}
#'  \item{timescale_id}{The unique identifier of the timescale used in the
#'  Macrostrat project}
#'  \item{t_cols}{The total number of Macrostrat columns associated with the
#'  project}
#'  \item{in_process_cols}{The total number of in-progress Macrostrat columns
#'  associated with the project}
#'  \item{obsolete_cols}{The total number of obsolete Macrostrat columns
#'  associated with the project}
#'  \item{t_units}{The total number of Macrostrat units associated with the
#'  project}
#'  \item{area}{The area covered by the Macrostrat project}
#'  }
#'
#' @author Bethany Allen
#'
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # projects <- def_projects()
#'   # projects <- def_projects(project_id = 4)
#' }
#' }
#' @export

def_projects <- function(
    project_id = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    project_id = "integer"
  )
  check_arguments(x = args, ref = ref)

  # Set default for format
  format <- "json"

  # Get request
  dat <- GET_macrostrat(endpoint = "defs/projects", query = args,
                        format = format)

  # Return data
  return(dat)
}
