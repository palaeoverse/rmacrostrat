#' Get timescale data from Macrostrat
#'
#' This function gets timescale data from [Macrostrat](http://macrostrat.org).
#'
#' @param scale \code{character}. The name of a timescale available via
#'   [Macrostrat](https://macrostrat.org/api/defs/timescales?all).
#'
#' @details This function returns a \code{data.frame} of a desired timescale
#'   available via
#'   [Macrostrat](https://macrostrat.org/api/defs/timescales?all).
#'
#' @returns A \code{data.frame} of the requested
#'   [Macrostrat](https://macrostrat.org/api/defs/timescales?all) timescale.
#'
#' @examples
#' timescale <- get_timescale(scale = "international age")
#' @export
get_timescale <- function(scale = "international periods") {
  # Error handling
  if (!is.character(scale)) {
    stop("`scale` must be of class character.")
  }
  # Check which scales are available
  available_scales <- "defs/timescales?all"
  available_scales <- data.frame(fetch_macrostrat(path = available_scales,
                                                  query = NULL,
                                                  format = "json"))
  available_scales <- available_scales$success.data.timescale
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
  dat <- fetch_macrostrat(path = path, query = scale, format = "csv")
  # Clean up data
  dat <- dat[, -which(colnames(dat) %in% c("int_id", "timescales"))]
  return(dat)
}
