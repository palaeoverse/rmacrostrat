#' @title Define Macrostrat time intervals
#'
#' @description A function to retrieve Macrostrat time interval definitions
#'   matching a user-specific search criteria. If no arguments are specified
#'   (the default), all time interval definitions are returned.
#'
#' @param timescale \code{character}. The name of the desired timescale to
#'   return a definition for (e.g., "international epochs").
#' @param interval_name \code{character}. The name of the desired interval to
#'   return a definition for.
#' @param interval_id \code{integer}. The identification number(s) of the
#'   desired time interval to return a definition for.
#' @param age \code{numeric}. Age in millions of years before present to
#'   return an interval definition for. All intervals overlapping with this
#'   age will be returned.
#' @param age_top \code{numeric}. The minimum age for which interval
#'   definitions should be returned, in millions of years before present. If
#'   specified, `age_bottom` must also be specified, and this must be younger
#'   than `age_bottom`.
#' @param age_bottom \code{numeric}. The maximum age for which interval
#'   definitions should be returned, in millions of years before present. If
#'   specified, `age_top` must also be specified, and this must be older than
#'   `age_top`.
#' @param rule \code{character}. How should interval definitions be returned
#'   for the given `age_top` and `age_bottom`? Use "contains" to return all
#'   intervals that fall entirely within `age_top` and `age_bottom`. Use
#'   "exact" to return any intervals with both boundaries equal to `age_top`
#'   and `age_bottom`. Use "loose" (the default) to return all intervals
#'   touching the range of `age_top` and `age_bottom`. If `age_top` and
#'   `age_bottom` are not provided, this argument is ignored.
#' @param true_colors \code{logical}. Should the original international time
#'   scale colors be returned? Defaults to `TRUE`.
#'
#' @return A `data.frame` containing the following columns:
#' \itemize{
#'   \item \code{int_id}: The unique identification number of the time
#'     interval.
#'   \item \code{name}: The name of the time interval.
#'   \item \code{abbrev}: The standard abbreviation for the time interval
#'     name, if one exists.
#'   \item \code{t_age}: The top age (minimum age) in millions of years
#'     before present.
#'   \item \code{b_age}: The bottom age (maximum age) in millions of years
#'     before present.
#'   \item \code{int_type}: The temporal rank of the interval (e.g., "age",
#'     "epoch", "chron").
#'   \item \code{timescales}: A \code{data.frame} containing the timescale(s)
#'     that the interval is included in (see [def_timescales()] for more
#'     details), with the following columns:
#'   \itemize{
#'      \item \code{timescale_id}: The unique identification number of the
#'        timescale.
#'      \item \code{name}: The name of the timescale.
#'   }
#'   \item \code{color}: The recommended coloring for units based on dominant
#'     lithology.
#' }
#'
#' @section Developer(s):
#'   Lewis A. Jones
#'
#' @section Reviewer(s):
#'   William Gearty
#'
#' @examples
#' \donttest{
#' # Return all intervals
#' ex1 <- def_intervals()
#' # Return all specific timescale intervals
#' ex2 <- def_intervals(timescale = "international ages")
#' # Return for specific age
#' ex3 <- def_intervals(timescale = "international ages", age = 70)
#' }
#' @export
#' @family defs_time
def_intervals <- function(timescale = NULL,
                          interval_name = NULL, interval_id = NULL,
                          age = NULL, age_top = NULL, age_bottom = NULL,
                          rule = NULL, true_colors = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    timescale = "character",
    interval_name = "character",
    interval_id = "integer",
    age = "numeric",
    age_top = "numeric",
    age_bottom = "numeric",
    rule = "character",
    true_colors = "logical"
  )
  check_arguments(x = args, ref = ref)
  # Recode names
  api_names <- list(interval_name = "name", interval_id = "int_id",
                    age_top = "t_age", age_bottom = "b_age")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/intervals",
                        query = args, format = "json")
  # Return data
  return(dat)
}
