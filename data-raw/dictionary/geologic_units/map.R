#' @param map_id \code{integer}. The unique identification number(s) of the map polygon(s) to return. Ignored if `unit_id` is supplied.
#' @param unit_id \code{integer}. Filter unit(s) by their unique identification number(s).
#' @param strat_name_id \code{integer}. Filter units to those that match one or more stratigraphic name(s) as specified by their unique identification number(s). Ignored if `unit_id` or `map_id` is supplied.
#' @param lat \code{numeric}. Return the units at the specified decimal degree latitude. Must also specify `lng`. Ignored if `unit_id` or `map_id` is supplied.
#' @param lng \code{numeric}. Return the units at the specified decimal degree longitude. Must also specify `lat`. Ignored if `unit_id` or `map_id` is supplied.
#' @param scale \code{character}. The Macrostrat map scale to use. Options are "tiny" (global), "small" (continental), "medium" (regional), or "large" (local). Ignored if `unit_id` or `map_id` is supplied.
#' @param sf \code{logical}. Should the results be returned as an `sf` object? Defaults to `TRUE`. If `FALSE`, a `data.frame` is returned.
