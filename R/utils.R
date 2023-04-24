#' Check available options
#'
#' This function checks which options are available.
#'
#' @param x \code{character}. Which options should be checked? Choose from
#' "parameters", "output_formats", "examples", or "fields". If this argument
#' is set to `NULL` (default), all options are returned.
#' @param route \code{character}. The first-level route that should be checked
#' such as "defs" or "columns".
#' @param path \code{character}. The second-level route that should be checked
#' such as "columns" or "minerals" if `route` is "defs".
#'
#' @return A \code{list} of available "parameters", "output_formats",
#' "examples", or "fields". If `x`, `route`, and `path` are set to `NULL`,
#' the base routes are returned.
get_options <- function(x = NULL, route = NULL, path = NULL) {
  # Generate list
  args <- list(route, path)
  # Remove NULL arguments
  args <- args[!sapply(args, is.null)]
  # Set path
  path <- do.call(paste, args)
  path <- gsub(pattern = " ", replacement = "/", x = path)
  # Get content
  cont <- GET_macrostrat(path = path)
  cont <- httr::content(cont)
  # Extract x if exists
  if (!is.null(x)) {
    dat <- cont$success$options[x]
  } else {
    dat <- cont$success$options
  }
  # Return routes if no matched content
  if (is.null(dat)) {
    dat <- cont$success$routes
  }
  return(dat)
}

#' Get available content
#'
#' This function checks whether the requested content is available. It can be
#' used to either return all available content for the requested variable or
#' to standardise the requested content.
#'
#' @param x \code{character}. The requested content value (e.g. "international
#'   ages").
#' @param path \code{character}. The relevant Macrostrat API path.
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
get_available_content <- function(x = NULL, path = NULL, query = NULL,
                                  var = NULL, available = TRUE) {
  # Is data available?
  content <- GET_macrostrat(path = path, query = query)
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
    stop(paste(x, "not found.",
    "Set `available` to TRUE to return available content."))
  }
  # Use matched scale
  if (mch != 0) {
    x <- content[mch]
  }
  # Return content
  return(x)
}
