#' @param source_id \code{integer}. The unique identification number(s) of the source(s) to filter the results by.
#' @param lith_id \code{integer}. The unique identification number(s) of the lithology(ies) to filter the results by.
#' @param lith_type \code{character}. Filter results to those of one or more lithology type(s).
#' @param lith_class \code{character}. Filter results to those of one or more lithology class(es).
#' @param description \code{character}. Filter results by a match to the map unit description field.
#' @param comments \code{character}. Filter results by a match to the map unit comments field.
#' @param scale \code{character}. Restrict results to maps of a specific scale(s) in Macrostrat's system. Options are "tiny" (locality), "small" (regional), "medium" (continental), or "large" (global).
#' @param carto \code{character}. Restrict results to map components present in one of Macrostrat's map harmonized scales. Options are "tiny" (locality), "small" (regional), "medium" (continental), or "large" (global).
#' @param sample \code{logical}. Return a sample of data.
