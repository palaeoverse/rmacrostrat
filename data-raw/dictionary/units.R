#' @param unit_id \code{NA}. integer, a valid unit id
#' @param section_id \code{NA}. integer, a valid section id
#' @param col_id \code{NA}. integer, a valid column id
#' @param col_type \code{NA}. string, a column type
#' @param interval_name \code{NA}. string, chronostratigraphic time interval name
#' @param int_id \code{NA}. integer, a chronostratigraphic time interval ID from /defs/intervals
#' @param age \code{NA}. numerical age in millions of years before present
#' @param age_top \code{NA}. numerical age (Ma) - must be used with age_bottom and be less than age_bottom
#' @param age_bottom \code{NA}. numerical age (Ma) - must be used with age_top and be greater than age_top; note that returned units may not be entirely contained by age_top and age_bottom, but they will intersect that age range in whole or in part
#' @param lith_id \code{NA}. integer, ID of a lithology from /defs/lithologies
#' @param lith \code{NA}. string, specific lithology name (e.g., shale, sandstone)
#' @param lith_group \code{NA}. string, groups of lithologies (e.g., sandstones, mudrocks, unconsolidated)
#' @param lith_type \code{NA}. string, types of lithologies (e.g., carbonate, siliciclastic)
#' @param lith_class \code{NA}. string, general lithologies (sedimentary, igneous, metamorphic)
#' @param lith_att_id \code{NA}. integer, ID of a lithology attribute from /defs/lithology_attributes
#' @param lith_att \code{NA}. string, specific lithology attribute name (e.g. fine, olivine, poorly washed)
#' @param lith_att_type \code{NA}. string, specific category of lithology attribute (e.g. grains, lithology, bedform)
#' @param environ_id \code{NA}. integer, specific environment ID from /defs/environments
#' @param environ \code{NA}. string, specific environment
#' @param environ_type \code{NA}. string, groups of environments
#' @param environ_class \code{NA}. string, general environments
#' @param econ_id \code{NA}. integer, ID of an economic attribute from /defs/econs
#' @param econ \code{NA}. string, name of an economic attribute
#' @param econ_type \code{NA}. string, name of an economic attribute type
#' @param econ_class \code{NA}. string, name of an economic attribute class
#' @param cltn_id \code{NA}. integer, one or more Paleobiology Database collection IDs
#' @param strat_name \code{NA}. a fuzzy stratigraphic name to match units to
#' @param strat_name_id \code{NA}. integer, a single or comma-separated list of stratigraphic IDs from /defs/strat_names
#' @param lat \code{NA}. number, decimal degree latitude, WGS84
#' @param lng \code{NA}. number, decimal degree longitude, WGS84
#' @param adjacents \code{NA}. boolean, if lat/lng or col_id is specified, optionally return all units in columns that touch the polygon containing the supplied lat/lng
#' @param project_id \code{NA}. a Macrostrat project ID
#' @param response \code{NA}. Any available response_type. Default is short.
#' @param geom_age \code{NA}. If requesting a geographic format, specifies which age to use for the primary coordinates. Accepted parameters are 'modern' (clat, clng), 'top' (t_plat, t_plng) and 'bottom' (b_plat, b_plng). Default is 'modern'
#' @param summarize_measures \code{NA}. If present, returns summary statistics about the measurements associated with each unit
#' @param show_position \code{NA}. If present, return the unit top and bottom position in section
#' @param sf \code{NA}. Should the results be returned as an `sf` object (defaults to TRUE)?If `FALSE`, a `data.frame` is returned.
