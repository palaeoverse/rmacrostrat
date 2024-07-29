#' @title Define grain sizes
#'
#' @description A function to return grain size definitions from the
#'   Macrostrat Database based on user-specified arguments. If no arguments
#'   are specified, all definitions are returned.
#'
#' @param grain_name \code{character}. The name of the specific grain (e.g.,
#'   "Coarse Gravel") to return a definition for.
#' @param grain_group \code{character}. The name of the group the grain
#'   belongs to (e.g., "Gravel") to return a definition for.
#' @param soil_group \code{character}. The name of the family of soils the
#'   grain belongs to (e.g., "Coarse Soil") to return a definition for.
#' @param grain_id \code{integer}. The unique identification number(s) of the
#'   desired grain definitions(s) to return a definition for.
#' @param grain_symbol \code{character}. The abbreviation of the desired grain
#'   definition(s) (e.g., "CGr") to return a definition for.
#' @param grain_classification \code{character}. The classification scheme the
#'   given grain belongs to (e.g., "Wentworth") to return a definition for.
#'
#' @return A \code{data.frame} containing the following columns:
#' \itemize{
#'   \item \code{grain_id}: The unique identification number of the
#'     grain.
#'   \item \code{grain_symbol}: The grain symbol (or abbreviation) to use for
#'     display purposes.
#'   \item \code{grain_name}: The name of the grain.
#'   \item \code{grain_group}: The name of the group the grain belongs to.
#'   \item \code{soil_group}: The name of the soil family the grain belongs
#'     to.
#'   \item \code{min_size}: The minimum size of the size in millimeters.
#'   \item \code{max_size}: The maximum size of the grain in millimeters.
#'   \item \code{classification}: The classification scheme the given grain
#'     belongs to.
#' }
#'
#' @section Developer(s):
#'   Lewis A. Jones
#' @section Reviewer(s):
#'   William Gearty
#'
#' @examples
#' \donttest{
#'  # Return all definitions
#'  ex1 <- def_grain_sizes()
#'  # Return grain sizes by group
#'  ex2 <- def_grain_sizes(grain_group = "Gravel")
#' }
#' @export
#' @family defs_feat
def_grain_sizes <- function(grain_name = NULL, grain_group = NULL,
                            soil_group = NULL, grain_id = NULL,
                            grain_symbol = NULL,
                            grain_classification = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(grain_name = "character", grain_group = "character",
              soil_group = "character",
              grain_id = "integer", grain_symbol = "character",
              grain_classification = "character")
  check_arguments(x = args, ref = ref)
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/grainsizes",
                        query = args, format = "json")
  # Return data
  return(dat)
}
