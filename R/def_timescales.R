#' @title Define timescales
#'
#' @description A function to retrieve all timescale definitions from the
#'   Macrostrat database. Function is called without user-specified arguments.
#'
#' @return A \code{data.frame} containing the following columns:
#' \itemize{
#'   \item \code{timescale_id}: The unique identification number of the
#'   timescale.
#'   \item \code{timescale}: The name of the timescale.
#'   \item \code{n_intervals}: The number of intervals within the timescale.
#'   \item \code{max_age}: The maximum age coverage of the timescale in
#'   millions of years before present.
#'   \item \code{min_age}: The minimum age coverage of the timescale in
#'   millions of years before present.
#'   \item \code{ref_id}: The unique identification number of the associated
#'   reference.
#' }
#' @section Developer(s):
#'  Lewis A. Jones
#' @section Reviewer(s):
#'  Christopher D. Dean
#' @examples
#' \donttest{
#'  # Retrieve all timescale definitions
#'  ex1 <- def_timescales()
#' }
#' @export
#' @family defs_time
def_timescales <- function() {
  # Collect input arguments as a list
  args <- list(all = "all")
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/timescales",
                        query = args, format = "json")
  # Return data
  return(dat)
}
