#' @title Define lithology attributes
#'
#' @description A function to retrieve the definitions for one or more
#'   lithology attributes in the Macrostrat database. By default, all lithology
#'   attribute definitions are returned.
#'
#' @param lithology_att \code{character}. The name of the lithology attribute
#'   (e.g., "cross-bedded") to return a definition for.
#' @param att_type \code{character}. The type of lithology attribute (e.g., "sed
#'   structure") to return a definition for.
#' @param lithology_att_id \code{integer}. The unique identification number(s)
#'   of lithology attribute(s) to return a definition for.
#' @return A \code{data.frame} containing the following columns:
#' \itemize{
#'   \item \code{lith_att_id}: The unique identifier of the lithology attribute.
#'   \item \code{name}: The name of the lithology attribute.
#'   \item \code{type}: The lithology attribute type.
#'   \item \code{t_units}: The total number of Macrostrat units to which the
#'    lithology attribute is attached.
#'  }
#' @section Developer(s):
#'  Bethany Allen
#' @section Reviewer(s):
#'  Christopher D. Dean
#' @examples
#' \donttest{
#' # Return all lithology attribute definitions
#' ex1 <- def_lithology_att()
#' # Return subsets of lithology attribute definitions
#' ex2 <- def_lithology_att(att_type = "sed structure")
#' }
#' @export
#' @family defs_feat
def_lithology_att <- function(lithology_att = NULL,
                              att_type = NULL,
                              lithology_att_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(lithology_att = "character", att_type = "character",
              lithology_att_id = "integer"
  )
  check_arguments(x = args, ref = ref)
  # Recode names
  api_names <- list(lithology_att = "lith_att",
                    lithology_att_id = "lith_att_id")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/lithology_attributes", query = args,
                        format = "json")
  # Return data
  return(dat)
}
