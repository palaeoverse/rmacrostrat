#' @title Retrieve Macrostrat unit data
#'
#' @description A function to retrieve Macrostrat unit data matching a
#'   user-specific search criteria.
#'
#' @param unit_id \code{integer}. Filter units by their unique identification
#'   number(s).
#' @param section_id \code{integer}. Filter units to those contained within
#'   section(s) as specified by their unique identification number(s).
#' @param column_id \code{integer}. Filter units to those contained within
#'   column(s) as specified by their unique identification number(s).
#' @param strat_name \code{character}. Filter units to those containing a unit
#'   that matches a stratigraphic name (e.g., "Hell Creek").
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
#'   and this must be younger than `age_bottom`.
#' @param age_bottom \code{numeric}. Filter units to those that overlap with
#'   the age range between the specified numerical age and `age_top`. Should
#'   be in millions of years before present. `age_top` must also be specified,
#'   and this must be older than `age_top`.
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
#' @param adjacents \code{logical}. If `column_id` or `lat`/`lng` is
#'   specified, should all units that touch the specified column be returned?
#'   Defaults to `FALSE`.
#' @param project_id \code{integer}. Filter units to those contained within
#'   one or more Macrostrat project(s) as specified by their unique
#'   identification number(s).
#' @param sf \code{logical}. Should the results be returned as an `sf` object?
#'   Defaults to `FALSE`.
#'
#' @return A \code{data.frame} containing, for each retrieved core:
#' \describe{
#'  \item{unit_id}{}
#'  \item{section_id}{}
#'  \item{col_id}{}
#'  \item{project_id}{}
#'  \item{col_area}{}
#'  \item{unit_name}{}
#'  \item{strat_name_id}{}
#'  \item{Mbr}{}
#'  \item{Fm}{}
#'  \item{Gp}{}
#'  \item{SGp}{}
#'  \item{t_age}{}
#'  \item{b_age}{}
#'  \item{max_thick}{}
#'  \item{min_thick}{}
#'  \item{outcrop}{}
#'  \item{pbdb_collections}{}
#'  \item{pbdb_occurrences}{}
#'  \item{lith}{}
#'  \item{environ}{}
#'  \item{econ}{}
#'  \item{measure}{}
#'  \item{notes}{}
#'  \item{color}{}
#'  \item{text_color}{}
#'  \item{t_int_id}{}
#'  \item{t_int_name}{}
#'  \item{t_int_age}{}
#'  \item{t_prop}{}
#'  \item{units_above}{}
#'  \item{b_int_id}{}
#'  \item{b_int_name}{}
#'  \item{b_int_age}{}
#'  \item{b_prop}{}
#'  \item{units_below}{}
#'  \item{clat}{}
#'  \item{clng}{}
#'  \item{t_plat}{}
#'  \item{t_plng}{}
#'  \item{b_plat}{}
#'  \item{b_plng}{}
#'  \item{t_pos}{}
#'  \item{b_pos}{}
#'  }
#'  If sf = TRUE, an `sf` object is returned instead.
#'
#' @author Lewis A. Jones
#'
#' @reviewer NA
#'
#' @details DETAILS
#'
#' @examples
#' \dontrun{
#' # Get units by stratigraphic name
#' hell_creek <- get_units(strat_name = "Hell Creek")
#' # Get units by geographic coordinates
#' units <- get_units(lng = -110.9, lat = 48.4)
#' }
#' @export
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
                      econ_class = NULL, adjacents = NULL, project_id = NULL,
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
              econ_class = "character", adjacents = "logical",
              project_id = "integer", sf = "logical")
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
  if (sf) { format <- "geojson"} else { format <- "json" }
  # Get request
  dat <- GET_macrostrat(endpoint = "units",
                        query = args, format = format)
  # Return data
  return(dat)
}
