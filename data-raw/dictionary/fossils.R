#' @param interval_name \code{NA}. string, chronostratigraphic time interval name
#' @param age \code{NA}. numerical age in millions of years before present
#' @param age_top \code{NA}. numerical age (Ma) - must be used with age_bottom and be less than age_bottom
#' @param age_bottom \code{NA}. numerical age (Ma) - must be used with age_top and be greater than age_top
#' @param lith_id \code{NA}. integer, ID of a lithology from /defs/lithologies
#' @param lith \code{NA}. string, specific lithology name (e.g., shale, sandstone)
#' @param lith_type \code{NA}. string, groups of lithologies (e.g., carbonate, siliciclastic)
#' @param lith_class \code{NA}. string, general lithologies (sedimentary, igneous, metamorphic)
#' @param environ_id \code{NA}. integer, specific environment ID from /defs/environments
#' @param environ \code{NA}. string, specific environment
#' @param environ_type \code{NA}. string, groups of environments
#' @param environ_class \code{NA}. string, general environments
#' @param econ_id \code{NA}. integer, ID of an economic attribute from /defs/econs
#' @param econ \code{NA}. string, name of an economic attribute
#' @param econ_type \code{NA}. string, name of an economic attribute type
#' @param econ_class \code{NA}. string, name of an economic attribute class
#' @param unit_id \code{NA}. One or more comma-separated valid unit IDs
#' @param col_id \code{NA}. One or more comma-separated valid column IDs
#' @param project_id \code{NA}. One or more comma-separated valid project IDs
#' @param strat_name_id \code{NA}. One or more comma-separted valid strat_name_ids from /defs/strat_names
#' @param strat_name_concept_id \code{NA}. One or more stratigraphic name concepts from /defs/strat_name_concepts
#' @param sf \code{NA}. Should the results be returned as an `sf` object (defaults to TRUE)?If `FALSE`, a `data.frame` is returned.
