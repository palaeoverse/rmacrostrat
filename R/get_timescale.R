#' Get timescale data from Macrostrat
#'
#' This function gets timescale data from [Macrostrat](http://macrostrat.org).
#'
#' @param scale \code{character}. The name of a timescale available via
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
#' @returns A \code{data.frame} of the requested
#'   [Macrostrat](https://macrostrat.org/api/defs/timescales?all) timescale or
#'   a \code{vector} of available timescales.
#'
#' @examples
#' available <- get_timescale(available = TRUE)
#' ages <- get_timescale(scale = "international ages")
#' periods <- get_timescale(scale = "international periods")
#' @export
get_timescale <- function(scale = "international ages",
                          available = FALSE) {
  # Error handling
  if (!is.character(scale)) {
    stop("`scale` must be of character class.")
  }
  if (!is.logical(available)) {
    stop("`available` must be of logical class.")
  }
  # Check which scales are available
  path <- "defs/timescales?all"
  available_scales <- data.frame(GET_macrostrat(path = path,
                                                  query = NULL,
                                                  format = "json"))
  available_scales <- available_scales$success.data.timescale
  # Return available scales if requested
  if (available) {
    return(available_scales)
  }
  # Lower case timescale
  scale <- tolower(scale)
  # Match available scales
  mch <- charmatch(x = scale, table = available_scales)
  # No match
  if (is.na(mch) || mch == 0) {
    stop(paste("No scale matched. Choose from:",
                toString(available_scales)))
  }
  # Use matched scale
  scale <- available_scales[mch]
  # Get user request
  path <- "defs/intervals?format=csv&timescale="
  dat <- GET_macrostrat(path = path, query = scale, format = "csv")
  # Clean up data
  dat <- dat[, -which(colnames(dat) %in% c("int_id", "timescales"))]
  return(dat)
}
