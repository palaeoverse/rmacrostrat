#' Check available options
#'
#' This function checks which options are available.
#'
#' @param x \code{character}. Which options should be checked? Choose from
#' "parameters", "output_formats", "examples", or "fields". If this argument
#' is set to `NULL` (default), all options are returned.
#' @param endpoint \code{character}. The endpoint that should be checked
#' such as "defs/timescales" or "columns".
#'
#' @return A \code{list} of available "parameters", "output_formats",
#' "examples", or "fields". If `x` and `endpoint` are set to `NULL`,
#' the base routes are returned.
get_options <- function(x = NULL, endpoint = NULL) {
  # Generate list
  args <- list(endpoint)
  # Remove NULL arguments
  args <- args[!sapply(args, is.null)]
  # Set path
  path <- do.call(paste, args)
  # Get content
  cont <- GET_macrostrat(endpoint = path)
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
