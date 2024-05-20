#' @param unit_id \code{integer}. The unique identification number(s) of the unit(s) to return.
#' @param map_id \code{integer}. The unique identification number(s) of the map polygon(s) to return. Ignored if `unit_id` is supplied.
#' @param lat \code{numeric}. A valid latitude in decimal degrees. Returns the unit(s) located at the specified coordinate. Requires `lng`. Ignored if `unit_id` or `map_id` is supplied.
#' @param lng \code{numeric}. A valid longitude in decimal degrees. Returns the unit(s) located at the specified coordinate. Requires `lat`. Ignored if `unit_id` or `map_id` is supplied.
#' @param strat_name_id \code{integer}. The unique identification number(s) of the strat name(s) to filter the results by. Ignored if `unit_id` or `map_id` is supplied.
#' @param scale \code{character}. The Macrostrat map scale to use. Options are "small" (regional), "medium" (continental), or "large" (global). Ignored if `unit_id` or `map_id` is supplied.
#' @param sf \code{logical}. Should the results be returned as an `sf` object (defaults to `TRUE`)? If `FALSE`, a `data.frame` is returned.
