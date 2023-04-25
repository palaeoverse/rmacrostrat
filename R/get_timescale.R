#' Get timescale data from Macrostrat
#'
#' This function can be used to query timescale data from
#' [Macrostrat](http://macrostrat.org).
#'
#' @param query \code{list}. A named parameter list to query the
#'   Macrostrat API by. The name of the element within the list must be
#'   an available parameter and the element an available value.
#' @param params \code{logical}. If set to \code{TRUE}, a list of the
#'   available parameters for the Macrostrat interval route will be returned.
#'   If set to \code{FALSE} (default), the `query` will be checked against
#'   available parameters.
#' @param available \code{logical}. If set to \code{TRUE}, a vector of the
#'   available timescales will be returned. If set to \code{FALSE} (default),
#'   the requested scale will be checked against those available.
#'
#' @details This function returns a \code{data.frame} of the requested
#'   content. Available parameters for the query can be requested via the
#'   `params` argument. Available
#'   [Macrostrat](https://macrostrat.org/api/defs/timescales?all) timescales
#'   can be requested via the `available` argument. Note: if the `params` or
#'   `available` argument is set to \code{TRUE}, only the available
#'   parameters or timescales are returned. To return the desired content,
#'   these arguments should be set to \code{FALSE}.
#'
#' @returns A \code{list} of available parameters, a \code{vector} of
#'   available timescales, or a \code{data.frame} of the requested
#'   [Macrostrat](https://macrostrat.org/api/defs/timescales?all) timescale
#'   content containing:
#'   \item{int_id}{The unique ID of the interval.}
#'   \item{name}{The name of the interval.}
#'   \item{abbrev}{The respective abbreviation of the interval name.}
#'   \item{t_age}{The interval top age, i.e. minimum age in millions of years.}
#'   \item{b_age}{The interval bottom age, i.e. maximum age in millions of years.}
#'   \item{int_type}{The type of interval.}
#'   \item{timescales}{The respective timescale the interval belongs to.}
#'   \item{color}{The assigned interval colour.}
#'
#' @examples
#' # Get available timescales
#' timescales <- get_timescale(available = TRUE)
#' # Get available parameters
#' params <- get_timescale(params = TRUE)
#' # Get timescale data by name (ages)
#' ages <- get_timescale(query = list(timescale = "international ages"))
#' # Get timescale data by id (epochs)
#' periods <- get_timescale(query = list(timescale_id = 2))
#' # Get specific interval based on one age
#' int_age <- get_timescale(query = list(timescale = "international ages",
#'                                       age = 50))
#' # Get specific intervals based on age range
#' int_range <- get_timescale(query = list(timescale = "international ages",
#'                                         b_age = 100,
#'                                         t_age = 30))
#' @export
get_timescale <- function(query = NULL,
                          params = FALSE,
                          available = FALSE) {
  # Error handling (internal function)
  handle_error_query(query = query, params = params, available = available)

  # Return available parameters
  if (params) {
    params <- get_options(
      x = "parameters",
      route = "defs",
      path = "intervals")$parameters
    # Drop format (csv will always be used here)
    params <- params[-which(names(params) == "format")]
    return(params)
  }

  # Check input parameters
  if (is.list(query)) {
    params <- get_options(
      x = "parameters",
      route = "defs",
      path = "intervals")$parameters
    if (!all(names(query) %in% names(params))) {
      stop(paste0("Parameter in `query` not found. ",
                  "Available parameters are: "),
           toString(names(params)))
    }
  }

  # Return available timescales
  if (available) {
    x <- get_available_content(x = NULL, path = "defs/timescales",
                               query = list(all = "all", format = "csv"),
                               var = "timescale", available = TRUE)
    return(x)
  }

  # Set format to csv for handling
  if ("format" %in% names(query)) {
    query <- query[-which(names(query) == "format")]
  }
  query <- append(query, list(format = "csv"), after = length(query))

  # Get user request
  path <- "defs/intervals"
  dat <- GET_macrostrat(path = path, query = query)

  # Add abbreviation if it doesn't exist
  if (any(is.na(dat$abbrev))) {
    dat$abbrev <- abbreviate(names.arg = dat$name, minlength = 2)
  }

  # Return data
  return(dat)
}
