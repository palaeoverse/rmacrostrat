#' @param measurement \code{NA}. string, measurement definition name
#' @param measurement_type \code{NA}. string, measurement definition type
#' @param measurement_class \code{NA}. string, measurement definition class
#' @param measurement_id \code{NA}. integer, measurement definition unique identifier
#' @param measure_id \code{NA}. integer, specific measurement id
#' @param measuremeta_id \code{NA}. integer, specific id for measurment metadata (generally a sample)
#' @param unit_id \code{NA}. integer, one or more ids for unit containing measurements
#' @param interval_name \code{NA}. string, an interval name to restrict measurements matched to units touching given age
#' @param lith_id \code{NA}. integer, one or more ids for lith (see /defs/lithologies)
#' @param lith_type \code{NA}. string, one or more lithology types
#' @param lith_class \code{NA}. string, one or more lithology classes
#' @param section_id \code{NA}. integer, id for section containing measurements
#' @param col_id \code{NA}. integer, id for column containing measurements
#' @param project_id \code{NA}. integer, id for project
#' @param measure_phase \code{NA}. string, phase from which measurement was taken (e.g., 'zircon')
#' @param response \code{NA}. Any available response_type. Default is short. Use 'light' for effecient return of measurements with little metadata
#' @param sample \code{NA}. if present, show a subset of the data
#' @param show_values \code{NA}. if present, show measurements as arrays, grouped by measuremeta_id and measurement_id
#' @param sf \code{NA}. Should the results be returned as an `sf` object (defaults to TRUE)?If `FALSE`, a `data.frame` is returned.
