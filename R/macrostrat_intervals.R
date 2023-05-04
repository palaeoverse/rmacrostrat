#' @title Retrieve Macrostrat hosted interval data
#' @description This function fetches Macrostrat interval data based on
#'   user-defined arguments via the [Macrostrat
#'   API](https://macrostrat.org/#api).
#' @param timescale \code{character}. The name of the desired timescale.
#'   Available timescales can be retrieved via [macrostrat_timescales].
#' @param name \code{character}. The name of the desired interval. If set to
#'   NULL (default), all interval data for the respective timescale is
#'   returned.
#' @param age \code{numeric}. Age in millions of years before present. All
#'   intervals overlapping with this age will be returned.
#' @param t_age \code{numeric}. The minimum age bound interval data should be
#'   returned for in millions of years before present. If set to NULL
#'   (default), all interval data for the respective timescale is returned.
#' @param b_age \code{numeric}. The maximum age bound interval data should be
#'   returned for in millions of years before present. If set to NULL
#'   (default), all interval data for the respective timescale is returned.
#' @param rule \code{character}. How should intervals be returned for the
#'   given `t_age` and `b_age`? Use "contains" to return all intervals that
#'   fall entirely within `t_age` and `b_age`. Use "exact" to return all
#'   intervals within boundaries equal to `t_age` and `b_age`. Use "loose" to
#'   return all intervals touching the range of `t_age` and `b_age`. If
#'   `t_age` and `b_age` are not provided, this argument is ignored.
#' @param all \code{logical}. Should all available interval definitions be
#'   returned? Defaults to TRUE.
#' @param true_colors \code{logical}. Should the original international time
#'   scale colors be returned? Defaults to TRUE.
#' @param int_id \code{integer}. The identification number of the desired
#'   interval.
#' @param timescale_id \code{integer}. The identification number of the
#'   desired timescale. Available timescale identification numbers can be
#'   retrieved via [macrostrat_timescales].
#' @return A `data.frame` of time scales hosted by
#'   [Macrostrat](https://macrostrat.org) containing:
#' \itemize{
#'  \item{int_id: }{The unique identification number of the interval.}
#'  \item{name: }{The name of the interval.}
#'  \item{abbrev: }{If available, the interval abbreviation.}
#'  \item{t_age: }{The minimum age of the interval.}
#'  \item{b_age: }{The maximum age of the interval.}
#'  \item{int_type: }{The type (or rank) of interval (e.g. age, period).}
#'  \item{timescales: }{The time scale the interval belongs to.}
#'  \item{color: }{International time scale colors.}
#' }
#' @author Lewis A. Jones
#' @details DETAILS
#' @examples
#' # Get international ages
#' ages <- macrostrat_intervals(timescale = "international ages")
#' # Get international periods
#' periods <- macrostrat_intervals(timescale = "international periods")
#' # Get NALMAs
#' NALMAs <- macrostrat_intervals(timescale = "North American Land Mammal Ages")
#' # Get specific interval by name
#' Hettangian <- macrostrat_intervals(name = "Hettangian")
#' # Get specific interval by ID
#' Chattian <- macrostrat_intervals(int_id = 20L)
#' # Get international age by age
#' Gzhelian <- macrostrat_intervals(timescale = "international ages", age = 300)
#' # Get international age by age range
#' intervals <- macrostrat_intervals(timescale = "international ages", t_age = 0, b_age = 100)
#' @export
macrostrat_intervals <- function (timescale = NULL, name = NULL, age = NULL,
                           t_age = NULL, b_age = NULL, rule = NULL,
                           all = TRUE, true_colors = NULL, int_id = NULL,
                           timescale_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  args <- filter_null(args)
  if (length(args) == 0) {
    stop("No arguments have been defined.")
  }
  # Define endpoint
  endpoint <- "/defs/intervals"
  # Check whether class of arguments is valid
  ref <- params[[endpoint]]
  check_arguments(x = args, ref = ref)
  # Get request
  dat <- GET_macrostrat(endpoint = endpoint, query = args, format = "csv")
  # Data returned?
  if (nrow(dat) == 0) {
    stop(paste0("Content not found. ",
                "Modify your request. ",
                "Hint: You can use `get_timescales` to see available time ",
                "scales."))
  }
  # Return data
  return(dat)
}
