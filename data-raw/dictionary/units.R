#' @param col_type \code{character}. The type of column(s) to return. Currently, "column" appears to be the only valid value.
#' @param summarize_measures \code{logical}. Returns summary statistics about the measurements associated with each unit.
#' @param show_position \code{logical}. If present, return the unit top and bottom position in section
#' @param unit_id \code{integer}. The unique identification number(s) of the unit(s) to return.
#' @param lith_id \code{integer}. Filter units to those containing a lithology identified by its unique identification number.
#' @param lith_group \code{character}. Filter units to those containing a named lithology group (e.g., sandstones, mudrocks, unconsolidated)
#' @param lith_type \code{character}. Filter units to those containing a named lithology type (e.g., carbonate, siliciclastic).
#' @param lith_class \code{character}. Filter units to those containing a named lithology class (e.g., sedimentary, igneous, metamorphic).
#' @param lith_att \code{character}. Filter units to those containing a named lithology attribute (e.g. fine, olivine, poorly washed).
#' @param lith_att_id \code{integer}. Filter units to those containing a lithology attribute identified by its unique identification number.
#' @param lith_att_type \code{character}. Filter units to those containing a named category of lithology attribute (e.g. grains, lithology, bedform).
#' @param environ \code{character}. Filter units to those containing a named environment.
#' @param environ_id \code{integer}. Filter units to those containing an environment identified by its unique identification number.
#' @param environ_type \code{character}. Filter units to those containing a named type of environments.
#' @param section_id \code{integer}. The unique identification number(s) of the section(s) to return.
#' @param environ_class \code{character}. Filter units to those containing a named class of environments.
#' @param econ \code{character}. Filter units to those containing a named economic attribute.
#' @param econ_id \code{integer}. Filter units to those containing an economic attribute identified by its unique identification number.
#' @param econ_type \code{character}. Filter units to those containing a named economic attribute type.
#' @param econ_class \code{character}. Filter units to those containing a named economic attribute class.
#' @param cltn_id \code{integer}. Filter units to those containing one or more Paleobiology Database collections identified by their unique identification numbers.
#' @param strat_name \code{character}. Filter units to those that fuzzy match a stratigraphic name.
#' @param strat_name_id \code{integer}. Filter units by a single or comma-separated list of stratigraphic IDs.
#' @param lat \code{numeric}. Return the unit at a particular decimal degree latitude (WGS84). Must also specify `lng`.
#' @param lng \code{numeric}. Return the unit at a particular decimal degree longitude (WGS84). Must also specify `lat`.
#' @param col_id \code{integer}. The unique identification number(s) of the columns(s) to return.
#' @param adjacents \code{logical}. If lat/lng or unit_id is specified, should all columns that touch the specified column be returned?
#' @param project_id \code{integer}. Filter units to those contained within a Macrostrat project identified by its unique identification number.
#' @param geom_age \code{character}. If requesting a geographic format, specifies which age to use for the primary coordinates. Accepted parameters are 'modern' (clat, clng), 'top' (t_plat, t_plng) and 'bottom' (b_plat, b_plng). Default is 'modern'
#' @param sf \code{logical}. Should the results be returned as an `sf` object (defaults to `TRUE`)? If `FALSE`, a `data.frame` is returned.
#' @param interval_name \code{character}. Filter by the chronostratigraphic interval name (i.e. intervals returned by `macrostrat_intervals`). Used to return all units with age ranges within interval age range.
#' @param int_id \code{integer}. The unique identification number(s) of a chronostratigraphic time interval to filter the results by.
#' @param age \code{numeric}. Filter units to those that overlap this numerical age in millions of years before present.
#' @param age_top \code{numeric}. Filter units to those that overlap with the age range between this and age_bottom. Should be in millions of years before present and less than age_bottom.
#' @param age_bottom \code{numeric}. Filter units to those that overlap with the age range between this and age_top. Should be in millions of years before present and greater than age_top.
#' @param lith \code{character}. Filter units to those containing a named lithology (e.g., shale, sandstone).
#' @param response \code{character}. How much metadata should be returned? Options (in increasing amount of metadata) are "short" and "long".
