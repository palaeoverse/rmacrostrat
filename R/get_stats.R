#' @title Retrieve Macrostrat database statistics
#' @description A function to retrieve various statistics about each Macrostrat
#'   project in the Macrostrat database.
#' @return A `data.frame` containing the following columns:
#' \itemize{
#'   \item \code{project_id}: Unique ID of the Macrostrat project.
#'   \item \code{project}: The name of the Macrostrat project.
#'   \item \code{columns}: The number of Macrostrat columns associated with the
#'     project.
#'   \item \code{packages}: The number of Macrostrat packages/sections
#'     associated with the project.
#'   \item \code{units}: The number of Macrostrat units associated with the
#'     project.
#'   \item \code{pbdb_collections}: The number of Paleobiology Database
#'     collections associated with the project.
#'   \item \code{measurements}: The number of measurements associated with the
#'     project.
#'   \item \code{t_polys}: The number of spatial polygons associated with the
#'     project.
#' }
#' @author William Gearty
#' @examples
#' \dontrun{
#' get_stats()
#' }
#' @export
get_stats <- function() {
  # Get request
  dat <- GET_macrostrat(endpoint = "stats", query = list(all = TRUE),
                        format = "json")

  # Return data
  return(dat)
}
