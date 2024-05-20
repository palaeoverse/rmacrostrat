#' @title Retrieve Macrostrat hosted time scales
#' @description This function fetches all available time scales from
#'   [Macrostrat](https://macrostrat.org) via the [Macrostrat
#'   API](https://macrostrat.org/#api).
#' @return A `data.frame` of time scales hosted by
#'   [Macrostrat](https://macrostrat.org) containing:
#' \itemize{
#'  \item{timescale_id: }{The time scale identification number.}
#'  \item{timescale: }{The name of the time scale.}
#'  \item{n_intervals: }{The number of intervals within the time scale.}
#'  \item{max_age: }{The maximum age of the intervals in the time scale.}
#'  \item{min_age: }{The minimum age of the intervals in the time scale.}
#'  \item{ref_id: }{The identification number of the reference the time scale
#'   is based on.}
#' }
#' @author Lewis A. Jones
#' @examples
#' # Get available time scales
#' macrostrat_timescales()
#' @export
macrostrat_timescales <- function () {
  # Define endpoint
  endpoint <- "/defs/timescales"
  # Get request
  dat <- GET_macrostrat(endpoint = endpoint,
                        query = NULL,
                        format = "csv")
  # Return data
  return(dat)
}
