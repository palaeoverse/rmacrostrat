#' @title Retrieve reference definitions
#' @description A function to retrieve the definitions for one or more published
#'   scientific references. By default, all reference definitions are returned.
#' @param ref_id \code{integer}. The unique identification number(s) of the
#'   desired reference(s) to return a definition for. If `NULL` (default), all
#'   references are returned.
#' @return A \code{data.frame} containing the following columns:
#' \itemize{
#'   \item \code{ref_id}: Unique identification number for the reference.
#'   \item \code{pub_year}: The year of publication for the reference.
#'   \item \code{author}: The author of the reference.
#'   \item \code{ref}: The name of the reference.
#'   \item \code{doi}: The digital object identifier of the reference.
#'   \item \code{url}: URL where additional information, the source, or
#'     contributing publication can be found.
#'   \item \code{t_units}: Total number of Macrostrat units associated with the
#'     reference.
#' }
#' @author William Gearty
#' @examples
#' \dontrun{
#' # Return all references
#' ex1 <- def_references()
#' # Return a subset of references
#' ex2 <- def_references(ref_id = c(1, 2, 3))
#' }
#' @export
#' @family meta
def_references <- function(ref_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(ref_id = "integer")
  check_arguments(x = args, ref = ref)
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/refs", query = args, format = "json")

  # Return data
  return(dat)
}