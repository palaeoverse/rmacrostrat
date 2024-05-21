#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param measure_id \code{integer}. Filter measurements to those of one or more unique identification number(s).
#' @param measurement_id \code{integer}. Filter measurements to those of one or more measurement definition(s) as specified by their unique identification number(s).
#' @param measurement \code{character}. Filter measurements to those of one or more measurement definition name(s) (e.g., "Pb" or "transport direction").
#' @param measurement_type \code{character}. Filter measurements to those of one or more measurement definition type(s) (e.g., "major elements", "geochronological").
#' @param measurement_class \code{character}. Filter measurements to those of one or more measurement definition class(es) (e.g., "geochemical", "geophysical").
#' @param measuremeta_id \code{integer}. Filter measurements to those of one or more measurement metadata(s) (usually refers to a sample) as specified by their unique identification number(s).
#' @param measure_phase \code{character}. Filter measurements by the phase from which measurement was taken (e.g., "zircon", "whole rock").
#' @param column_id \code{integer}. Filter measurements to those within one or more column(s) as specified by their unique identification number(s).
#' @param section_id \code{integer}. Filter measurements to those within one or more section(s) as specified by their unique identification number(s).
#' @param unit_id \code{integer}. Filter measurements to those within one or more unit(s) as specified by their unique identification number(s).
#' @param interval_name \code{character}. Filter measurements to those from units within or touching a named interval(s) (e.g., Permian).
#' @param lithology_id \code{integer}. Filter measurements to those of one or more lithology(ies) as specified by their unique identification number(s).
#' @param lithology_type \code{character}. Filter measurements to those of one or more lithology type(s) (e.g., "carbonate", "silicilcastic").
#' @param lithology_class \code{character}. Filter measurements to those of one or more lithology class(es) (e.g., "sedimentary", "igneous", "metamorphic"), Default: NULL
#' @param project_id \code{integer}. Filter measurements by the unique identification number(s) of the Macrostrat project(s).
#' @param sf \code{logical}. Should the results be returned as an `sf` object? Defaults to `FALSE`.
#' @return OUTPUT_DESCRIPTION
#' @author AUTHOR [AUTHOR_2]
#' @details DETAILS
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # EXAMPLE1
#' }
#' }
#' @export

get_measurements <- function(
    measure_id = NULL,
    measurement_id = NULL,
    measurement = NULL,
    measurement_type = NULL,
    measurement_class = NULL,
    measuremeta_id = NULL,
    measure_phase = NULL,
    column_id = NULL,
    section_id = NULL,
    unit_id = NULL,
    interval_name = NULL,
    lithology_id = NULL,
    lithology_type = NULL,
    lithology_class = NULL,
    project_id = NULL,
    sf = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    measure_id = "integer",
    measurement_id = "integer",
    measurement = "character",
    measurement_type = "character",
    measurement_class = "character",
    measuremeta_id = "integer",
    measure_phase = "character",
    column_id = "integer",
    section_id = "integer",
    unit_id = "integer",
    interval_name = "character",
    lithology_id = "integer",
    lithology_type = "character",
    lithology_class = "character",
    project_id = "integer",
    sf = "logical"
  )
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- "json"
  # Get request
  dat <- GET_macrostrat(endpoint = "INSERT ENDPOINT", query = args, format = format)

  # Return data
  return(dat)
}
