#' @title Define environments
#'
#' @description A function to retrieve the definitions for one or more
#'   environments in the Macrostrat database. By default, all environment
#'   definitions are returned.
#'
#' @param environ \code{character}. The name of a specific environment (e.g.,
#'   "reef") to return a definition for.
#' @param environ_type \code{character}. The name of a type of environment
#'   (e.g., "carbonate") to return a definition for.
#' @param environ_class \code{character}. The name of a class of environment
#'   (e.g., "marine") to return a definition for.
#' @param environ_id \code{integer}. The unique identification number of the
#'   desired environment to return a definition for.
#' @return A `data.frame` containing the following columns:
#' \itemize{
#'   \item \code{environ_id}: The unique identification number of the
#'   environment.
#'   \item \code{name}: The name of the environment.
#'   \item \code{type}: Environment type, less inclusive than class.
#'   \item \code{class}: Environment class, more inclusive than type.
#'   \item \code{color}: Recommended coloring for environment, based on the
#'   dominant lithology.
#'   \item \code{t_units}: The total number of Macrostrat units that are
#'     partially, or entirely, composed of the environment.
#' }
#' @section Developer(s):
#'  Christopher D. Dean
#' @section Reviewer(s):
#'  Lewis A. Jones
#' @examples
#' \donttest{
#' # Return all environment definitions
#' ex1 <- def_environments()
#' # Return subsets of environment definitions
#' ex2 <- def_environments(environ = "reef")
#' ex3 <- def_environments(environ_type = "carbonate")
#' ex4 <- def_environments(environ_class = "marine")
#' }
#' @export
#' @family defs_feat
def_environments <- function(environ = NULL, environ_type = NULL,
                             environ_class = NULL, environ_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(environ = "character", environ_type = "character",
              environ_class = "character", environ_id = "integer")
  check_arguments(x = args, ref = ref)
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/environments",
                        query = args,
                        format = "json")
  # Return data
  return(dat)
}
