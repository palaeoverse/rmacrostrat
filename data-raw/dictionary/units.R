#' @param unit_id \code{integer}. Filter units by their unique identification number(s).
#' @param section_id \code{integer}. Filter units to those contained within section(s) as specified by their unique identification number(s).
#' @param column_id \code{integer}. Filter units to those contained within column(s) as specified by their unique identification number(s).
#' @param strat_name \code{character}. Filter units to those containing a unit that fuzzy matches a stratigraphic name (e.g., "Hell Creek").
#' @param strat_name_id \code{integer}. Filter units to those that match one or more stratigraphic name(s) as specified by their unique identification number(s).
#' @param interval_name \code{character}. Filter units to those that overlap with a named chronostratigraphic time interval (e.g., "Permian").
#' @param interval_id \code{integer}. Filter units to those that overlap with one or more chronostratigraphic time interval(s) as specified by their unique identification number(s).
#' @param age \code{numeric}. Filter units to those that overlap with the specified numerical age, in millions of years before present.
#' @param age_top \code{numeric}. Filter units to those that overlap with the age range between the specified numerical age and `age_bottom`. Should be in millions of years before present. `age_bottom` must also be specified, and this must be younger than `age_bottom`.
#' @param age_bottom \code{numeric}. Filter units to those that overlap with the age range between the specified numerical age and `age_top`. Should be in millions of years before present. `age_top` must also be specified, and this must be older than `age_top`.
#' @param lat \code{numeric}. Return the units at the specified decimal degree latitude. Must also specify `lng`.
#' @param lng \code{numeric}. Return the units at the specified decimal degree longitude. Must also specify `lat`.
#' @param lithology \code{character}. Filter units to those containing a named lithology (e.g., "shale", "sandstone").
#' @param lithology_id \code{integer}. Filter units to those containing one or more lithology(ies) as specified by their unique identification number(s).
#' @param lithology_group \code{character}. Filter units to those containing a named lithology group (e.g., "sandstones", "mudrocks", "unconsolidated").
#' @param lithology_type \code{character}. Filter units to those containing a named lithology type (e.g., "carbonate", "siliciclastic").
#' @param lithology_class \code{character}. Filter units to those containing a named lithology class (e.g., "sedimentary", "igneous", "metamorphic").
#' @param lithology_att \code{character}. Filter units to those containing a named lithology attribute (e.g., "fine", "olivine", "poorly washed").
#' @param lithology_att_id \code{integer}. Filter units to those containing a one or more lithology attribute(s) as specified by their unique identification number(s).
#' @param lithology_att_type \code{character}. Filter units to those containing a named category of lithology attribute (e.g., "grains", "lithology", "bedform").
#' @param environ \code{character}. Filter units to those containing a named environment (e.g., "delta plain", "pond").
#' @param environ_id \code{integer}. Filter units to those containing one or more environment(s) as specified by their unique identification number(s).
#' @param environ_type \code{character}. Filter units to those containing a named environment type (e.g., "fluvial", "eolian", "glacial").
#' @param environ_class \code{character}. Filter units to those containing a named environment class (e.g., "marine", "non-marine").
#' @param pbdb_collection_no \code{integer}. Filter units to those containing one or more Paleobiology Database collection(s) as specified by their unique identification number(s).
#' @param econ \code{character}. Filter units to those containing a named economic attribute (e.g., "brick", "ground water", "gold").
#' @param econ_id \code{integer}. Filter units to those containing one or more economic attribute(s) as specified by their unique identification number(s).
#' @param econ_type \code{character}. Filter units to those containing a named economic attribute type (e.g., "construction", "aquifer", "mineral").
#' @param econ_class \code{character}. Filter units to those containing a named economic attribute class (e.g., "material", "water", "precious commodity").
#' @param adjacents \code{logical}. If `column_id` or `lat`/`lng` is specified, should all units that touch the specified column be returned? Defaults to `FALSE`.
#' @param project_id \code{integer}. Filter units to those contained within one or more Macrostrat project(s) as specified by their unique identification number(s).
#' @param sf \code{logical}. Should the results be returned as an `sf` object? Defaults to `FALSE`.
