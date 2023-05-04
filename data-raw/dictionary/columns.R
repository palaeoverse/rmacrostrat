#' @param unit_id \code{integer}. integer, a valid unit id
#' @param section_id \code{integer}. integer, a valid section id
#' @param col_id \code{integer}. integer, a valid column id
#' @param col_type \code{character}. string, a column type
#' @param interval_name \code{character}. string, chronostratigraphic time interval name
#' @param int_id \code{integer}. integer, a chronostratigraphic time interval ID from /defs/intervals
#' @param age \code{numeric}. numerical age in millions of years before present
#' @param age_top \code{numeric}. numerical age (Ma) - must be used with age_bottom and be less than age_bottom
#' @param age_bottom \code{numeric}. numerical age (Ma) - must be used with age_top and be greater than age_top
#' @param lith_id \code{integer}. integer, ID of a lithology from /defs/lithologies
#' @param lith \code{character}. string, specific lithology name (e.g., shale, sandstone)
#' @param lith_type \code{character}. string, groups of lithologies (e.g., carbonate, siliciclastic)
#' @param lith_class \code{character}. string, general lithologies (sedimentary, igneous, metamorphic)
#' @param lith_att_id \code{integer}. integer, ID of a lithology attribute from /defs/lithology_attributes
#' @param lith_att \code{character}. string, specific lithology attribute name (e.g. fine, olivine, poorly washed)
#' @param lith_att_type \code{character}. string, specific category of lithology attribute (e.g. grains, lithology, bedform)
#' @param environ_id \code{integer}. integer, specific environment ID from /defs/environments
#' @param environ \code{character}. string, specific environment
#' @param environ_type \code{character}. string, groups of environments
#' @param environ_class \code{character}. string, general environments
#' @param econ_id \code{integer}. integer, ID of an economic attribute from /defs/econs
#' @param econ \code{character}. string, name of an economic attribute
#' @param econ_type \code{character}. string, name of an economic attribute type
#' @param econ_class \code{character}. string, name of an economic attribute class
#' @param cltn_id \code{integer}. integer, one or more Paleobiology Database collection IDs
#' @param strat_name \code{character}. a fuzzy stratigraphic name to match units to
#' @param strat_name_id \code{integer}. integer, a single or comma-separated list of stratigraphic IDs from /defs/strat_names
#' @param lat \code{numeric}. number, decimal degree latitude, WGS84
#' @param lng \code{numeric}. number, decimal degree longitude, WGS84
#' @param adjacents \code{logical}. boolean, if lat/lng or col_id is specified, optionally return all units in columns that touch the polygon containing the supplied lat/lng
#' @param project_id \code{integer}. a Macrostrat project ID
#' @param response \code{character}. Any available response_type. Default is short.
#' @param sf \code{logical}. Should the results be returned as an `sf` object (defaults to TRUE)?If `FALSE`, a `data.frame` is returned.
