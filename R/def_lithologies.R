#' @title Define lithologies
#' @description A function to retrieve the definitions of one or more
#'   lithologies in the Macrostrat database. If no arguments are specified
#'   (the default), all lithology definitions are returned.
#' @param lithology \code{character}. The name of the desired lithology (e.g.,
#'   "limestone") to return a definition for.
#' @param lithology_group \code{character}. The name of the desired lithological
#'   group (e.g., "unconsolidated") to return a definition for.
#' @param lithology_class \code{character}. The name of the desired lithological
#'   class (e.g., "sedimentary") to return a definition for.
#' @param lithology_type \code{character}. The name of the desired lithological
#'   type (e.g., "siliciclastic") to return a definition for.
#' @param lithology_id \code{integer}. The unique identification number(s) of
#'   one or more lithologies to return a definition for.
#' @return A `data.frame` containing the following columns:
#' \itemize{
#'   \item \code{lith_id}: The unique identification number of the lithology.
#'   \item \code{name}: The name of the lithology.
#'   \item \code{type}: The lithology type, less inclusive than class.
#'   \item \code{group}: The lithology group, less inclusive than type.
#'   \item \code{class}: The lithology class, more inclusive than type.
#'   \item \code{color}: The recommended coloring for the lithology.
#'   \item \code{fill}: The code for the fill pattern as established in the
#'     [Federal Geographic Data Committee](https://ngmdb.usgs.gov/fgdc_gds/)'s
#'     [Digital Cartographic Standard for Geologic Map
#'     Symbolization](https://ngmdb.usgs.gov/fgdc_gds/).
#'   \item \code{t_units}: The total number of Macrostrat units that are
#'     partially or entirely composed of the lithology.
#' }
#' @section Developer(s):
#'   William Gearty
#' @section Reviewer(s):
#'   Bethany Allen
#' @examples
#' \donttest{
#' # return all lithology definitions
#' ex1 <- def_lithologies()
#' # return a definition for sandstone
#' ex2 <- def_lithologies(lithology = "sandstone")
#' # return definitions for lithologies of a specific type
#' ex3 <- def_lithologies(lithology_type = "sedimentary")
#' # return definitions for lithologies using their unique ID numbers
#' ex4 <- def_lithologies(lithology_id = c(1,5))
#' }
#' @export
#' @family defs_feat
def_lithologies <- function(lithology = NULL, lithology_group = NULL,
                            lithology_class = NULL, lithology_type = NULL,
                            lithology_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(lithology = "character", lithology_group = "character",
              lithology_class = "character", lithology_type = "character",
              lithology_id = "integer"
  )
  check_arguments(x = args, ref = ref)
  # Change arguments to default api names
  api_names <- c(lithology = "lith", lithology_class = "lith_class",
                 lithology_group = "lith_group", lithology_id = "lith_id",
                 lithology_type = "lith_type")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/lithologies", query = args,
                        format = "json")

  # Return data
  return(dat)
}
