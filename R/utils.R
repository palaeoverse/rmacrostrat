#' Filters NULL and FALSE arguments from a list
#'
#' This function checks whether any elements in a list are
#' NULL or FALSE and removes them.
#'
#' @param x \code{list}. The user-query list
#' @param filter_null \code{logical}. Should NULL value queries be filtered?
#' @param filter_false \code{logical}. Should FALSE value queries be filtered?
#'
#' @return A `NULL` and `FALSE` filtered list of `x`.
#' @keywords internal
filter_args <- function(x, filter_null = TRUE, filter_false = TRUE) {
  if (filter_null) x <- Filter(Negate(is.null), x)
  if (filter_false) x <- Filter(Negate(isFALSE), x)
  x
}

#' Check if arguments are valid (internal)
#'
#' This function checks whether user arguments are valid
#' in terms of being an available argument or of the correct
#' class.
#'
#' @param x \code{list}. The user-query list to compare against `ref`.
#' @param ref \code{list}. The reference list to compare `x` against.
#'
#' @return Error messages or \code{TRUE} if all arguments are valid.
#' @keywords internal
check_arguments <- function(x, ref) {
  x <- filter_args(x)
  if (length(x) == 0) {
    return(TRUE)
  }
  chk <- names(x) %in% names(ref)
  if (!all(chk)) {
    invalid <- toString(names(x)[!chk])
    stop("The following are not valid argument(s): ", invalid,
         ". \nSee function documentation.")
  }
  # Filter ref by matched arguments
  ref <- ref[names(ref) %in% names(x)]
  # reorder by ref
  x <- x[names(ref)]
  # Convert integer class to numeric
  ref_upd <- ref
  ref_upd[which(ref_upd == "integer")] <- "numeric"
  # Convert integer class to numeric
  x[unlist(lapply(x, is.integer))] <- lapply(x[unlist(lapply(x, is.integer))], as.numeric)
  # Evaluate class
  chk <- unlist(lapply(x, class)) == unlist(ref_upd)
  if (!all(chk)) {
    invalid <- toString(names(x)[!chk])
    invalid <- sapply(invalid, function(x) {
      message(paste0("`", x, "` should be of class ",
                     unlist(ref[x]), "."))
    })
    stop("Invalid class of argument(s).")
  }
  # Return TRUE if valid arguments
  return(TRUE)
}
