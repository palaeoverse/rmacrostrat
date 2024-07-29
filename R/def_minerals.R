#' @title Define minerals
#'
#' @description A function to retrieve mineral definitions from the Macrostrat
#'   database based on user-specified arguments. If no arguments are provided,
#'   all definitions are returned.
#'
#' @param mineral \code{character}. The name of a mineral (e.g., "calcite") to
#'   return a definition for.
#' @param mineral_type \code{character}. The type of mineral (e.g.,
#'   "feldspar") to return a definition for.
#' @param element \code{character}. The chemical element abbreviation of a
#'   mineral (e.g., "CaCO3") to return a definition for. Note: abbreviations
#'   are case sensitive.
#'
#' @return A \code{data.frame} containing the following columns:
#' \itemize{
#'   \item \code{mineral_id}: The unique identification number of the mineral.
#'   \item \code{mineral}: The name of the mineral.
#'   \item \code{mineral_type}: The name of the type of mineral.
#'   \item \code{formula}: The chemical formula of the mineral.
#'   \item \code{formula_tags}: The chemical formula of the mineral with
#'     appropriate sub/superscript html tags.
#'   \item \code{url}: A URL for the mineral's entry in
#'     [Mindat](https://www.mindat.org).
#'   \item \code{hardness_min}: The minimum hardness value (Mohs Hardness
#'     Scale) of the mineral.
#'   \item \code{hardness_max}: The maximum hardness value (Mohs Hardness
#'     Scale) of the mineral.
#'   \item \code{crystal_form}: The crystal form of the mineral.
#'   \item \code{mineral_color}: A description of the color of the mineral.
#'   \item \code{lustre}: A description of the lustre of the mineral.
#' }
#'
#' @section Developer(s):
#'  Lewis A. Jones
#' @section Reviewer(s):
#'  Bethany Allen
#'
#' @examples
#' \donttest{
#'   # Get all mineral definitions
#'   ex1 <- def_minerals()
#'   # Get mineral definitions by type
#'   ex2 <- def_minerals(mineral_type = "element")
#' }
#' @export
#' @family defs_feat
def_minerals <- function(mineral = NULL, mineral_type = NULL, element = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(mineral = "character", mineral_type = "character",
    element = "character"
  )
  check_arguments(x = args, ref = ref)
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/minerals", query = args,
                        format = "json")
  # Return data
  return(dat)
}
