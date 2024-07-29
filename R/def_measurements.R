#' @title Define measurements
#' @description A function to retrieve the definitions of different measurements
#'   that are included in the Macrostrat database. By default, all definitions
#'   are returned.
#' @param measure_id \code{integer}. The unique identification number(s) of the
#'   desired measurement(s) to return a definition for.
#' @param measurement_type \code{character}. Filter the returned definitions to
#'   those of one or more named type(s) of measurement (e.g.,
#'   "geochronological"). This is a less inclusive grouping than
#'   `measurement_class`.
#' @param measurement_class \code{character}. Filter the returned definitions to
#'   those of one or more named class(es) of measurement (e.g., "geochemical").
#'   This is a more inclusive grouping than `measurement_type`.
#' @return A \code{data.frame} containing the following columns:
#' \itemize{
#'   \item \code{measure_id}: The unique identification number of the
#'     measurement.
#'   \item \code{name}: The name of the measurement.
#'   \item \code{type}: Measurement type, less inclusive than class
#'   \item \code{class}: Measurement class, more inclusive than type.
#'   \item \code{t_units}: The total number of Macrostrat units containing this
#'     measurement.
#' }
#' @section Developer(s):
#'  William Gearty
#' @section Reviewer(s):
#'  Christopher D. Dean
#' @examples
#' \donttest{
#' # Return all definitions
#' ex1 <- def_measurements()
#' # Return subsets of definitions
#' ex2 <- def_measurements(measure_id = c(1, 2, 4))
#' ex3 <- def_measurements(measurement_class = "geochemical")
#' }
#' @export
#' @family external
#' @family defs_feat
def_measurements <- function(measure_id = NULL, measurement_type = NULL,
                             measurement_class = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(measure_id = "integer", measurement_type = "character",
              measurement_class = "character")
  check_arguments(x = args, ref = ref)
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/measurements", query = args,
                        format = "json")
  # Return data
  return(dat)
}
