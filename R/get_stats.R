#' Get Macrostrat project statistics from Macrostrat
#'
#' This function gets specific statistics on Macrostrat projects from
#' [Macrostrat](http://macrostrat.org).
#'
#' @param x \code{character}. The name of a project available via
#'   [Macrostrat](https://macrostrat.org/api/stats?all).
#' @param available \code{logical}. If set to \code{TRUE}, a vector of the
#'   available projects will be returned. If set to \code{FALSE} (default),
#'   the requested project will be checked against those available.
#'
#' @details This function returns a \code{data.frame} of the requested
#'   project stats. Available
#'   [Macrostrat](https://macrostrat.org/api/stats?all) project statistics
#'   can be requested via the `available` argument. Note: if this argument is
#'   set to \code{TRUE}, only a vector of available project names are returned.
#'   To return the desired project statistics, this argument should be set to
#'   \code{FALSE}.
#'
#' @returns A \code{vector} of available projects or a \code{data.frame} of
#'   the requested
#'   [Macrostrat](https://macrostrat.org/api/stats?all) project statistics
#'   containing:
#'  \item{project_id}{The project ID number.}
#'  \item{project}{The name of the project.}
#'  \item{columns}{The number of geological columns associated with the
#'  project.}
#'  \item{packages}{The number of geological packages associated with the
#'  project.}
#'  \item{units}{The number of geological units associated with the project.}
#'  \item{pbdb_collections}{The number of Paleobiology Database collections
#'  associated with the project.}
#'  \item{measurements}{The number of measurements associated with the
#'  project.}
#'  \item{t_polys}{The number of polygons(?) associated with the project.}
#'
#' @examples
#' # Get available timescales
#' available <- get_stats(available = TRUE)
#' # Get all stats
#' all <- get_stats()
#' # Get project specific
#' nz <- get_stats(x = "New Zealand")
#' @export
get_stats <- function(x = NULL, available = FALSE) {
  # Error handling
  if (!is.character(x) && !is.null(x)) {
    stop("`x` must be of character class.")
  }
  if (!is.logical(available)) {
    stop("`available` must be of logical class.")
  }
  # Define options
  path <- "stats"
  query <- list(all = "all", format = "csv")
  # Get content
  dat <- GET_macrostrat(path = path, query = query)
  # Check which projects are available
  if (available) {
    dat <- dat$project
    return(dat)
  }
  # Filter data if requested
  if (!is.null(x)) {
    if(!x %in% dat$project) {
      stop("`x` not available. Set `available` to TRUE to see options.")
    }
    dat <- dat[which(dat$project == x), ]
    # Return dat
    return(dat)
  } else {
    return(dat)
  }
}
