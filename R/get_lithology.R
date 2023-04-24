#' Get lithology data from Macrostrat
#'
#' This function gets lithology data from [Macrostrat](http://macrostrat.org).
#'
#' @param x \code{character}. The name of a lithology available via
#'   [Macrostrat](https://macrostrat.org/api/defs/lithologies?all).
#' @param by \code{character}. The rank to search `name` by, should be either:
#'   "name", "group", "type", or "class".
#' @param available \code{logical}. If set to \code{TRUE}, a vector of the
#'   available lithologies will be returned. If set to \code{FALSE} (default),
#'   the requested lithology will be checked against those available.
#'
#' @details This function returns a \code{data.frame} of the requested
#'   lithology and related data. Available
#'   [Macrostrat](https://macrostrat.org/api/defs/lithologies?all) lithologies
#'   can be requested via the `available` argument. Note: if this argument is
#'   set to \code{TRUE}, only a vector of available lithologies are returned.
#'   To return the desired lithology, this argument should be set to
#'   \code{FALSE}.
#'
#' @returns A \code{vector} of available lithologies or a \code{data.frame} of
#'   the requested
#'   [Macrostrat](https://macrostrat.org/api/defs/lithologies?all) lithology
#'   containing at least the following columns:
#'  \item{lith_id}{Lithology ID number.}
#'  \item{name}{Name of lithology.}
#'  \item{type}{Type of lithology.}
#'  \item{group}{Group of lithology.}
#'  \item{class}{Class of lithology.}
#'  \item{color}{Assigned lithology colour.}
#' @examples
#' # Get lithology by name
#' get_lithology(by = "name", available = TRUE)
#' # Get lithology by type
#' get_lithology(by = "type", available = TRUE)
#' # Get lithology by group
#' get_lithology(by = "group", available = TRUE)
#' # Get lithology by class
#' get_lithology(by = "class", available = TRUE)
#' # Get all sedimentary lithologies
#' get_lithology(x = "sedimentary", by = "class", available = FALSE)
#' # Get specific lithology
#' get_lithology(x = "limestone", by = "name", available = FALSE)
#' @export
get_lithology <- function(x = NULL, by = "name", available = FALSE) {
  # Error handling
  if (!is.character(x) && !is.null(x)) {
    stop("`x` must be of character class.")
  }
  if (!is.logical(available)) {
    stop("`available` must be of logical class.")
  }
  # Check which lithologies are available
  # Define path
  path <- "defs/lithologies"
  # Define variable
  var <- "timescale"
  # Define query
  query <- list(all = "all", format = "csv")
  # Define var
  var <- by
  # Get available lithologies
  if (available) {
    x <- get_available_content(
      x = x, path = path, query = query,
      var = var, available = TRUE
    )
    # Remove no-content
    x <- x[which(x != "")]
    return(x)
  }
  # Check and match content if x is required
  if (!is.null(x)) {
    x <- get_available_content(
      x = x, path = path, query = query,
      var = by, available = FALSE
    )
  }
  # Get user request
  # if x required, filter
  if (!is.null(x)) {
    # Update by argument for filtering
    if (by == "name") {
      by <- "lith"
    } else {
      by <- paste0("lith_", by)
    }
    names(query)[which(names(query) == "all")] <- by
    query[by] <- x
    dat <- GET_macrostrat(path = path, query = query)
  }
  # Return data
  return(dat)
}
