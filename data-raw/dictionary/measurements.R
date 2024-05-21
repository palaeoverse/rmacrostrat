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
#' @param lithology_class \code{character}. Filter measurements to those of one or more lithology class(es) (e.g., "sedimentary", "igneous", "metamorphic")
#' @param project_id \code{integer}. Filter measurements by the unique identification number(s) of the Macrostrat project(s).
#' @param sf \code{logical}. Should the results be returned as an `sf` object? Defaults to `FALSE`.
