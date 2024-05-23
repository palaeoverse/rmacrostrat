#' Get available content
#'
#' This function checks whether the requested content is available. It can be
#' used to either return all available content for the requested variable or
#' to standardise the requested content.
#'
#' @param x \code{character}. The requested content value (e.g. "international
#'   ages").
#' @param endpoint \code{character}. The relevant Macrostrat API endpoint.
#' @param query \code{list}. The variable to extract from the returned
#'   object to check \code{x} against.
#' @param var \code{character}. The variable to filter the content by.
#' @param available \code{logical}. Should all available content be returned
#'   for the desired \code{query}?
#'
#' @details This function checks whether the requested content is available
#'   via Macrostrat. It can also be used to return a vector of all available
#'   content for the desired \code{query}.
#'
#' @return A \code{vector} of the available content or the matched \code{x}
#'   value.
get_available_content <- function(x = NULL, endpoint = NULL, query = NULL,
                                  var = NULL, available = TRUE) {
  # Is data available?
  content <- GET_macrostrat(endpoint = endpoint, query = query)
  content <- content[, var]
  # Return available content if requested
  if (available) {
    content <- unique(content)
    return(content)
  }
  # Match available content
  mch <- charmatch(x = x, table = content)
  # No match
  if (is.na(mch)) {
    stop(paste(
      x, "not found.",
      "Set `available` to TRUE to return available content."
    ))
  }
  # Use matched scale
  if (mch != 0) {
    x <- content[mch]
  }
  # Return content
  return(x)
}
