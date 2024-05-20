#' @param measurement_type \code{character}. Filter results to those of one or more measurement definition type(s).
#' @param measurement_class \code{character}. Filter results to those of one or more measurement definition class(es).
#' @param measure_id \code{integer}. The unique identification number(s) of the measurement(s) to return.
#' @param lith_class \code{character}. Filter results to those of one or more lithology class(es).
#' @param section_id \code{integer}. The unique identification number(s) of the section(s) to filter the results by.
#' @param col_id \code{integer}. The unique identification number(s) of the column(s) to filter the results by.
#' @param project_id \code{integer}. The unique identification number(s) of the project(s) to filter the results by.
#' @param sf \code{logical}. Should the results be returned as an `sf` object (defaults to `TRUE`)? If `FALSE`, a `data.frame` is returned.
#' @param measuremeta_id \code{integer}. The unique identification number(s) of the measurement metadata(s) (usually refers to a sample) to filter the results to.
#' @param measurement \code{character}. Filter results to those of one or more measurement definition name(s) (e.g., "Pb" or "transport direction").
#' @param measurement_id \code{integer}. The unique identification number(s) of the measurement definition(s) to filter the results by.
#' @param measure_phase \code{character}. Filter by the phase from which measurement was taken (e.g., "zircon" or "whole rock").
#' @param unit_id \code{integer}. The unique identification number(s) of the unit(s) containing measurements to filter the results by.
#' @param interval_name \code{character}. Filter results to those from units from within or touching a named interval(s).
#' @param lith_id \code{integer}. The unique identification number(s) of the lithology(ies) to filter the results by.
#' @param lith_type \code{character}. Filter results to those of one or more lithology type(s).
#' @param response \code{character}. How much metadata should be returned? Options (in increasing amount of metadata) are "light", "short", and "long".
#' @param sample \code{logical}. if present, show a subset of the data
#' @param show_values \code{logical}. if present, show measurements as arrays, grouped by measuremeta_id and measurement_id
