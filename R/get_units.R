#' @title Retrieve Macrostrat unit data
#'
#' @description A function to retrieve Macrostrat unit data matching a
#'   user-specified search criteria.
#'
#' @param unit_id \code{integer}. Filter units by their unique identification
#'   number(s).
#' @param section_id \code{integer}. Filter units to those contained within
#'   section(s) as specified by their unique identification number(s).
#' @param column_id \code{integer}. Filter units to those contained within
#'   column(s) as specified by their unique identification number(s).
#' @param strat_name \code{character}. Filter units to those containing a unit
#'   that fuzzy matches a stratigraphic name (e.g., "Hell Creek").
#' @param strat_name_id \code{integer}. Filter units to those that match one
#'   or more stratigraphic name(s) as specified by their unique identification
#'   number(s).
#' @param interval_name \code{character}. Filter units to those that overlap
#'   with a named chronostratigraphic time interval (e.g., "Permian").
#' @param interval_id \code{integer}. Filter units to those that overlap with
#'   one or more chronostratigraphic time interval(s) as specified by their
#'   unique identification number(s).
#' @param age \code{numeric}. Filter units to those that overlap with the
#'   specified numerical age, in millions of years before present.
#' @param age_top \code{numeric}. Filter units to those that overlap with the
#'   age range between the specified numerical age and `age_bottom`. Should be
#'   in millions of years before present. `age_bottom` must also be specified,
#'   and `age_top` must be younger than `age_bottom`.
#' @param age_bottom \code{numeric}. Filter units to those that overlap with
#'   the age range between the specified numerical age and `age_top`. Should
#'   be in millions of years before present. `age_top` must also be specified,
#'   and `age_bottom` must be older than `age_top`.
#' @param lat \code{numeric}. Return the units at the specified decimal degree
#'   latitude. Must also specify `lng`.
#' @param lng \code{numeric}. Return the units at the specified decimal degree
#'   longitude. Must also specify `lat`.
#' @param lithology \code{character}. Filter units to those containing a named
#'   lithology (e.g., "shale", "sandstone").
#' @param lithology_id \code{integer}. Filter units to those containing one or
#'   more lithology(ies) as specified by their unique identification
#'   number(s).
#' @param lithology_group \code{character}. Filter units to those containing a
#'   named lithology group (e.g., "sandstones", "mudrocks", "unconsolidated").
#' @param lithology_type \code{character}. Filter units to those containing a
#'   named lithology type (e.g., "carbonate", "siliciclastic").
#' @param lithology_class \code{character}. Filter units to those containing a
#'   named lithology class (e.g., "sedimentary", "igneous", "metamorphic").
#' @param lithology_att \code{character}. Filter units to those containing a
#'   named lithology attribute (e.g., "fine", "olivine", "poorly washed").
#' @param lithology_att_id \code{integer}. Filter units to those containing
#'   one or more lithology attribute(s) as specified by their unique
#'   identification number(s).
#' @param lithology_att_type \code{character}. Filter units to those
#'   containing a named category of lithology attribute (e.g., "grains",
#'   "lithology", "bedform").
#' @param environ \code{character}. Filter units to those containing a named
#'   environment (e.g., "delta plain", "pond").
#' @param environ_id \code{integer}. Filter units to those containing one or
#'   more environment(s) as specified by their unique identification
#'   number(s).
#' @param environ_type \code{character}. Filter units to those containing a
#'   named environment type (e.g., "fluvial", "eolian", "glacial").
#' @param environ_class \code{character}. Filter units to those containing a
#'   named environment class (e.g., "marine", "non-marine").
#' @param pbdb_collection_no \code{integer}. Filter units to those containing
#'   one or more Paleobiology Database collection(s) as specified by their
#'   unique identification number(s).
#' @param econ \code{character}. Filter units to those containing a named
#'   economic attribute (e.g., "brick", "ground water", "gold").
#' @param econ_id \code{integer}. Filter units to those containing one or more
#'   economic attribute(s) as specified by their unique identification
#'   number(s).
#' @param econ_type \code{character}. Filter units to those containing a named
#'   economic attribute type (e.g., "construction", "aquifer", "mineral").
#' @param econ_class \code{character}. Filter units to those containing a
#'   named economic attribute class (e.g., "material", "water", "precious
#'   commodity").
#' @param project_id \code{integer}. Filter units to those contained within
#'   one or more Macrostrat project(s) as specified by their unique
#'   identification number(s).
#' @param adjacents \code{logical}. If `column_id` or `lat`/`lng` is
#'   specified, should all units that touch the specified column be returned?
#'   Defaults to `FALSE`.
#' @param sf \code{logical}. Should the results be returned as an `sf` object?
#'   Defaults to `FALSE`.
#'
#' @return A \code{data.frame} containing the following columns:
#' \itemize{
#'    \item \code{unit_id}: The unique identification number of the Macrostrat
#'      unit.
#'    \item \code{section_id}: The unique identification number of the
#'      Macrostrat section containing the unit.
#'    \item \code{col_id}: The unique identification number of the Macrostrat
#'      column containing the unit.
#'    \item \code{project_id}: The unique identification number of the
#'      Macrostrat project.
#'    \item \code{col_area}: The area of the associated Macrostrat column in
#'      km\ifelse{html}{\out{<sup>2</sup>}}{\eqn{^2}}.
#'    \item \code{unit_name}: The name of the Macrostrat unit.
#'    \item \code{strat_name_id}: The unique Macrostrat stratigraphic name ID.
#'    \item \code{Mbr}: The lithostratigraphic member.
#'    \item \code{Fm}: The lithostratigraphic formation.
#'    \item \code{Gp}: The lithostratigraphic group.
#'    \item \code{SGp}: The lithostratigraphic supergroup.
#'    \item \code{t_age}: The age of the top of the unit, estimated using the
#'      continuous time age model, in millions of years before present.
#'    \item \code{b_age}: The age of the bottom of the unit, estimated using the
#'      continuous time age model, in millions of years before present.
#'    \item \code{max_thick}: The maximum thickness of the unit, in meters.
#'    \item \code{min_thick}: The minimum thickness of the unit, in meters.
#'    \item \code{outcrop}: Type of exposure ("outcrop", "subsurface", or
#'      "both").
#'    \item \code{pbdb_collections}: The number of Paleobiology Database
#'      collections contained within the unit.
#'    \item \code{pbdb_occurrences}: The number of Paleobiology Database
#'      occurrences contained within the unit.
#'    \item \code{lith}: a \code{dataframe} containing the lithologies present
#'      within the unit, with the following columns:
#'      \itemize{
#'        \item \code{name}: The named lithology (e.g., "sandstone").
#'        \item \code{prop}: The proportion of the lithology within the unit,
#'          calculated from the individual Macrostrat sub-units within the unit.
#'        \item \code{lith_id}: The unique identification number of the
#'          lithology.
#'        \item \code{type}: The named lithology type (e.g., "siliciclastic").
#'        \item \code{class}: The named lithology class (e.g., "sedimentary").
#'      }
#'    \item \code{environ}: a \code{dataframe} containing the environments
#'      present within the unit, with the following columns:
#'      \itemize{
#'        \item \code{class}: The named environment class (e.g., "marine").
#'        \item \code{type}: The named environment type (e.g., "siliciclastic").
#'        \item \code{name}: The named environment (e.g., "delta plain").
#'        \item \code{environ_id}: The unique identification number of the
#'          environment.
#'      }
#'    \item \code{econ}: a \code{dataframe} containing the economic
#'      attributes present within the unit, with the following columns:
#'      \itemize{
#'        \item \code{type}: The named economic attribute type (e.g.,
#'          "mineral").
#'        \item \code{name}: The named economic attribute (e.g., "gold").
#'        \item \code{econ_id}: The unique identification number of the economic
#'          attribute.
#'        \item \code{class}: The named economic attribute class (e.g.,
#'          "precious commodity").
#'      }
#'    \item \code{measure}: a \code{dataframe} containing the measure
#'      attributes present within the unit, with the following columns:
#'      \itemize{
#'        \item \code{measure_class}: The class of measures (e.g.,
#'          "geochemical").
#'        \item \code{measure_type}: the type of measures (e.g., "minor
#'          elements").
#'      }
#'    \item \code{notes}: Unit specific notes.
#'    \item \code{color}: Recommended coloring for units based on dominant
#'      lithology.
#'    \item \code{text_color}: Recommended coloring for text based on color.
#'    \item \code{t_int_id}: The ID of the chronostratigraphic interval
#'      containing the top boundary of the unit.
#'    \item \code{t_int_name}: The name of the time interval represented at
#'      the top of the unit.
#'    \item \code{t_int_age}: The age of the chronostratigraphic interval
#'      containing the top boundary of the unit.
#'    \item \code{t_prop}: Position of continuous time age model top boundary,
#'      proportional to reference time interval (t_int_name).
#'    \item \code{units_above}: The unit_ids of the units contacting the top
#'      of the unit.
#'    \item \code{b_int_id}: The ID of the chronostratigraphic interval
#'      containing the bottom boundary of the unit.
#'    \item \code{b_int_name}: The name of the time interval represented at
#'      the bottom of the unit.
#'    \item \code{b_int_age}: The age of the chronostratigraphic interval
#'      containing the bottom boundary of the unit.
#'    \item \code{b_prop}: Position of continuous time age model bottom
#'      boundary, proportional to reference time interval (b_interval).
#'    \item \code{units_below}: The unit_ids of the units contacting the
#'      bottom of the unit.
#'    \item \code{strat_name_long}: The stratigraphic name associated with
#'      the unit (e.g., "Coal Valley Formation").
#'    \item \code{refs}: The unique identification number(s) of the reference(s)
#'      associated with the unit.
#'    \item \code{clat}: The present day latitude of the centroid of the
#'      column to which the unit belongs.
#'    \item \code{clng}: The present day longitude of the centroid of the
#'      column to which the unit belongs.
#'    \item \code{t_plat}: The paleolatitude of the centroid of the column
#'      which the unit belongs to at top age (`clat` rotated to `t_age`).
#'    \item \code{t_plng}: The paleolongitude of the centroid of the column
#'      which the unit belongs to at top age (`clng` rotated to `t_age`) .
#'    \item \code{b_plat}: The paleolatitude of the centroid of the column
#'      which the unit belongs to at bottom age (`clat` rotated to `b_age`).
#'    \item \code{b_plng}: The paleolongitude of the the centroid of the
#'      column which the unit belongs to at bottom age (`clng` rotated to
#'      `b_age`).
#' }
#'   If `sf` is `TRUE`, an `sf` object is returned instead, with a "geometry"
#'   column that contains the spatial data instead of the `clat`/`clng` columns.
#'
#' @section Developer(s):
#'   Lewis A. Jones
#' @section Reviewer(s):
#'   William Gearty
#'
#' @details More information can be found for the inputs for this function
#' using the definition functions (beginning with \code{def_}).
#'
#' @examples
#' \donttest{
#' # Get units with a specific stratigraphic name
#' ex1 <- get_units(strat_name = "Hell Creek")
#' # Get units at a specific geographic coordinate
#' ex2 <- get_units(lng = -110.9, lat = 48.4)
#' }
#' @export
#' @family macrostrat
get_units <- function(unit_id = NULL, section_id = NULL, column_id = NULL,
                      strat_name = NULL, strat_name_id = NULL,
                      interval_name = NULL, interval_id = NULL,
                      age = NULL, age_top = NULL, age_bottom = NULL,
                      lat = NULL, lng = NULL,
                      lithology = NULL, lithology_id = NULL,
                      lithology_group = NULL, lithology_type = NULL,
                      lithology_class = NULL, lithology_att = NULL,
                      lithology_att_id = NULL, lithology_att_type = NULL,
                      environ = NULL, environ_id = NULL, environ_type = NULL,
                      environ_class = NULL, pbdb_collection_no = NULL,
                      econ = NULL, econ_id = NULL, econ_type = NULL,
                      econ_class = NULL, project_id = NULL, adjacents = FALSE,
                      sf = FALSE) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(unit_id = "integer", section_id = "integer",
              column_id = "integer", strat_name = "character",
              strat_name_id = "integer", interval_name = "character",
              interval_id = "integer", age = "numeric", age_top = "numeric",
              age_bottom = "numeric", lat = "numeric", lng = "numeric",
              lithology = "character", lithology_id = "integer",
              lithology_group = "character", lithology_type = "character",
              lithology_class = "character", lithology_att = "character",
              lithology_att_id = "integer", lithology_att_type = "character",
              environ = "character", environ_id = "integer",
              environ_type = "character", environ_class = "character",
              pbdb_collection_no = "integer", econ = "character",
              econ_id = "integer", econ_type = "character",
              econ_class = "character", project_id = "integer",
              adjacents = "logical", sf = "logical")
  # Check arguments
  check_arguments(x = args, ref = ref)
  # Check specific argument constraints
  if (!is.null(age_top) || !is.null(age_bottom)) {
    if (is.null(age_top) || is.null(age_bottom)) {
      stop("`age_top` and `age_bottom` must both be specified to filter by an
           age range.")
    }
    if (age_top > age_bottom) {
      stop("`age_top` must be younger/less than `age_bottom`.")
    }
  }
  # Check lng/lat arguments
  if (!is.null(lng) && is.null(lat)) {
    stop("`lat` required if `lng` specified.")
  }
  if (is.null(lng) && !is.null(lat)) {
    stop("`lng` required if `lat` specified.")
  }
  if (!is.null(lng)) {
    if (lng >= 180 || lng <= -180) {
      stop("`lng` should be less than 180 and more than -180.")
    }
  }
  if (!is.null(lat)) {
    if (lat >= 90 || lat <= -90) {
      stop("`lat` should be less than 90 and more than -90.")
    }
  }
  # Recode names
  api_names <- list(column_id = "col_id", interval_id = "int_id",
                    lithology = "lith", lithology_att = "lith_att",
                    lithology_att_id = "lith_att_id",
                    lithology_att_type = "lith_att_type",
                    lithology_class = "lith_class",
                    lithology_group = "lith_group", lithology_id = "lith_id",
                    lithology_type = "lith_type",
                    pbdb_collection_no = "cltn_id")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))
  # Set default for format
  if (sf) format <- "geojson" else format <- "json"
  # Get request
  dat <- GET_macrostrat(endpoint = "units",
                        query = args, format = format)
  # Return data
  return(dat)
}
