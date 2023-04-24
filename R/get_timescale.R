#' Get timescale data from Macrostrat
#'
#' This function gets timescale data from [Macrostrat](http://macrostrat.org).
#'
#' @param x \code{character}. The name of a timescale available via
#'   [Macrostrat](https://macrostrat.org/api/defs/timescales?all).
#' @param available \code{logical}. If set to \code{TRUE}, a vector of the
#'   available timescales will be returned. If set to \code{FALSE} (default),
#'   the requested scale will be checked against those available.
#'
#' @details This function returns a \code{data.frame} of the requested
#'   timescale. Available
#'   [Macrostrat](https://macrostrat.org/api/defs/timescales?all) timescales
#'   can be requested via the `available` argument. Note: if this argument is
#'   set to \code{TRUE}, only a vector of available scales are returned. To
#'   return the desired timescale, this argument should be set to
#'   \code{FALSE}.
#'
#' @returns A \code{vector} of available timescales or a \code{data.frame} of
#'   the requested
#'   [Macrostrat](https://macrostrat.org/api/defs/timescales?all) timescale
#'   containing:
#'  \item{name}{Interval name.}
#'  \item{abbrev}{Interval name abbreviation.}
#'  \item{t_age}{Interval top age, i.e. minimum age.}
#'  \item{b_age}{Interval bottom age, i.e. maximum age.}
#'  \item{color}{Assigned interval colour.}
#'
#' @examples
#' # Get available timescales
#' available <- get_timescale(available = TRUE)
#' # Get timescale data
#' ages <- get_timescale(x = "international ages")
#' periods <- get_timescale(x = "international periods")
#' @export
get_timescale <- function(x = "international ages", available = FALSE) {
  # Error handling
  if (!is.character(x)) {
    stop("`x` must be of character class.")
  }
  if (!is.logical(available)) {
    stop("`available` must be of logical class.")
  }

  # Define path
  path <- "defs/timescales"
  # Define variable
  var <- "timescale"
  # Define query
  query <- list(all = "all", format = "csv")

  # Check which scales are available
  if (available) {
    x <- get_available_content(x = x, path = path,
                               query = query,
                               var = var,
                               available = TRUE)
    return(x)
  } else {
    # Get matched content
    x <- get_available_content(x = x, path = path, query = query,
                               var = var, available = FALSE)
  }

  # Get user request
  path <- "defs/intervals"
  query <- list(timescale = x, format = "csv")
  dat <- GET_macrostrat(path = path, query = query)

  # Clean up data (should we be cleaning up data?)
  dat <- dat[, -which(colnames(dat) %in% c("int_id",
                                           "int_type",
                                           "timescales"))]
  # Add abbreviation if it doesn't exist
  if (any(is.na(dat$abbrev))) {
    dat$abbrev <- abbreviate(names.arg = dat$name, minlength = 2)
  }
  # Return data
  return(dat)
}
