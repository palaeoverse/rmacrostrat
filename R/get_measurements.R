#' @title Obtain geological measurements
#' @description Retrieve a range of measurements relevant to making geological
#'  inferences.
#'
#' @param measure_id \code{integer}. Filter measurements to those of one or more
#'   unique identification number(s).
#' @param measurement_id \code{integer}. Filter measurements to those of one or
#'   more measurement definition(s) as specified by their unique identification
#'   number(s).
#' @param measurement \code{character}. Filter measurements to those of one or
#'   more measurement definition(s) as specified by their name (e.g., "Pb" or
#'   "transport direction").
#' @param measurement_type \code{character}. Filter measurements to those of one
#'   or more measurement definition type(s) (e.g., "major elements",
#'   "geochronological").
#' @param measurement_class \code{character}. Filter measurements to those of
#'   one or more measurement definition class(es) (e.g., "geochemical",
#'   "geophysical").
#' @param measuremeta_id \code{integer}. Filter measurements to those of one or
#'   more measurement metadata(s) (usually refers to a sample) as specified by
#'   their unique identification number(s).
#' @param measure_phase \code{character}. Filter measurements by the phase from
#'   which the measurement was taken (e.g., "zircon", "whole rock").
#' @param column_id \code{integer}. Filter measurements to those within one or
#'   more column(s) as specified by their unique identification number(s).
#' @param section_id \code{integer}. Filter measurements to those within one or
#'   more section(s) as specified by their unique identification number(s).
#' @param unit_id \code{integer}. Filter measurements to those within one or
#'   more unit(s) as specified by their unique identification number(s).
#' @param interval_name \code{character}. Filter measurements to those from
#'   units within or touching a named interval(s) (e.g., "Permian").
#' @param lithology_id \code{integer}. Filter measurements to those of one or
#'   more lithology(ies) as specified by their unique identification number(s).
#' @param lithology_type \code{character}. Filter measurements to those of one
#'   or more lithology type(s) (e.g., "carbonate", "siliciclastic").
#' @param lithology_class \code{character}. Filter measurements to those of one
#'   or more lithology class(es) (e.g., "sedimentary", "igneous",
#'   "metamorphic").
#' @param project_id \code{integer}. Filter measurements by the unique
#'   identification number(s) of the Macrostrat project(s).
#' @param sf \code{logical}. Should the results be returned as an `sf` object?
#'   Defaults to `FALSE`.
#'
#' @return A \code{dataframe} containing, for each retrieved measurement:
#' \describe{
#'  \item{measurement_id}{The unique identifier of the set of measurements}
#'  \item{measuremeta_id}{The unique identifier (sample number) of the
#'  measurement}
#'  \item{measurement}{The name of the type of measurement obtained}
#'  \item{measure_units}{The units of the measurement}
#'  \item{measure_phase}{The phase from which the measurement was taken}
#'  \item{method}{The method used to generate the measurement}
#'  \item{n}{The number of observations or measurements}
#'  \item{measure_value}{The value of the measurement}
#'  \item{measure_error}{The reported error on the measurement value}
#'  \item{measure_position}{The position of the measurement in the Macrostrat
#'  column}
#'  \item{measure_n}{The number of measurements used to generate the
#'  measure_value; if greater than one, usually used to produce the
#'  measure_error}
#'  \item{error_units}{The units of the error}
#'  \item{lat}{Decimal degree latitude of the measurement}
#'  \item{lng}{Decimal degree longitude of the measurement}
#'  \item{samp_geo_unit}{The Macrostrat unit from which the measurement was
#'  taken}
#'  \item{samp_lith}{A lithological description of the rock from which the
#'  measurement was taken}
#'  \item{samp_desc}{A description of the sample used to generate the
#'  measurement}
#'  \item{samp_age}{The geological time interval assigned to the measurement}
#'  \item{ref_id}{The unique identifier of the reference}
#'  \item{unit_id}{The unique identifier of the Macrostrat unit from which the
#'  measurement was taken}
#'  \item{col_id}{The unique identifier of the Macrostrat column from which the
#'  measurement was taken}
#'  \item{strat_name_id}{The unique identifier of the stratigraphic name}
#'  \item{match_basis}{A terse descriptor of how the measuremeta data was linked
#'  to the Macrostrat unit}
#'  \item{ref}{The name of the reference}
#'  }
#'  If sf = TRUE, an `sf` object is outputted instead.
#'
#' @author Bethany Allen [AUTHOR_2]
#' @details More information can be found about the inputs and outputs for this
#'  function by using [def_measurements()].
#'
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # age_model <- get_measurements(measure_id = c(353, 354))
#'   # age_model <- get_measurements(measurement_id = 42)
#'   # age_model <- get_measurements(column_id = 84, measurement = "SiO2")
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

  # Recode names
  api_names <- list(column_id = "col_id", lithology_id = "lith_id",
                    lithology_class = "lith_class", lithology_type = "lith_type")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))

  # Set default for format
  format <- "json"

  # Get request
  dat <- GET_macrostrat(endpoint = "measurements", query = args, format = format)

  # Return data
  return(dat)
}
