#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param col_id \code{integer}. The unique identification number(s) of the columns(s) to return.
#' @param unit_id \code{integer}. The unique identification number(s) of the unit(s) to filter the results by.
#' @param section_id \code{integer}. The unique identification number(s) of the section(s) to filter the results by.
#' @param interval_name \code{character}. The name of a chronostratigraphic time interval to filter the results by.
#' @param int_id \code{integer}. The unique identification number(s) of a chronostratigraphic time interval to filter the results by.
#' @param age \code{numeric}. Filter sections to those that overlap this numerical age in millions of years before present.
#' @param age_top \code{numeric}. Filter sections to those that overlap with the age range between this and age_bottom. Should be in millions of years before present and less than age_bottom.
#' @param age_bottom \code{numeric}. Filter sections to those that overlap with the age range between this and age_top. Should be in millions of years before present and greater than age_top.
#' @param lith \code{character}. Filter sections to those containing a named lithology (e.g., shale, sandstone).
#' @param lith_id \code{integer}. Filter sections to those containing a lithology identified by its unique identification number.
#' @param lith_group \code{character}. Filter sections to those containing a named lithology group (e.g., sandstones, mudrocks, unconsolidated)
#' @param lith_type \code{character}. Filter sections to those containing a named lithology type (e.g., carbonate, siliciclastic).
#' @param lith_class \code{character}. Filter sections to those containing a named general lithology (sedimentary, igneous, metamorphic).
#' @param lith_att \code{character}. Filter sections to those containing a named lithology attribute (e.g. fine, olivine, poorly washed).
#' @param lith_att_id \code{integer}. Filter sections to those containing a lithology attribute identified by its unique identification number.
#' @param lith_att_type \code{character}. Filter sections to those containing a named category of lithology attribute (e.g. grains, lithology, bedform).
#' @param environ \code{character}. Filter sections to those containing a named environment.
#' @param environ_id \code{integer}. Filter sections to those containing an environment identified by its unique identification number.
#' @param environ_type \code{character}. Filter sections to those containing a named group of environments.
#' @param environ_class \code{character}. Filter sections to those containing a named general environment.
#' @param econ \code{character}. Filter sections to those containing a named economic attribute.
#' @param econ_id \code{integer}. Filter sections to those containing an economic attribute identified by its unique identification number.
#' @param econ_type \code{character}. Filter sections to those containing a named economic attribute type.
#' @param econ_class \code{character}. Filter sections to those containing a named economic attribute class.
#' @param cltn_id \code{integer}. Filter sections to those containing one or more Paleobiology Database collections identified by their unique identification numbers.
#' @param strat_name \code{character}. Filter sections to those containing a unit that fuzzy matches a stratigraphic name.
#' @param strat_name_id \code{integer}. Filter sections by a single or comma-separated list of stratigraphic IDs.
#' @param lat \code{numeric}. Return the section at a particular decimal degree latitude (WGS84). Must also specify `lng`.
#' @param lng \code{numeric}. Return the section at a particular decimal degree longitude (WGS84). Must also specify `lat`.
#' @param adjacents \code{logical}. If lat/lng or col_id is specified, should all sections that touch the specified column be returned?
#' @param project_id \code{integer}. Filter sections to those contained within a Macrostrat project identified by its unique identification number.
#' @param response \code{character}. How much metadata should be returned? Options (in increasing amount of metadata) are "short" and "long"., Default: NULL
#' @return OUTPUT_DESCRIPTION
#' @author AUTHOR [AUTHOR_2]
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @export 

get_sections <- function (
   col_id, unit_id, section_id, interval_name, int_id, age, age_top, age_bottom, lith, lith_id, lith_group, lith_type, lith_class, lith_att, lith_att_id, lith_att_type, environ, environ_id, environ_type, environ_class, econ, econ_id, econ_type, econ_class, cltn_id, strat_name, strat_name_id, lat, lng, adjacents, project_id, response = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  check_arguments(x = args, ref = 'INSERT ENDPOINT')

  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = 'INSERT FORMAT')

  # Return data
  return(dat)
}

