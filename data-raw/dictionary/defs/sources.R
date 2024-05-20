#' @param lat \code{numeric}. A valid latitude in decimal degrees (WGS84).
#' @param lng \code{numeric}. A valid longitude in decimal degrees (WGS84).
#' @param shape \code{character}. A valid well-known text (WKT) representation of geometry, such as "POINT(30 10)" or "POLYGON((30 10, 40 40, 20 40, 10 20))".
#' @param buffer \code{integer}. The geographic buffer (in metres) that should be applied to the provide `shape`.
#' @param sf \code{logical}. Should the results be returned as an `sf` object (defaults to `TRUE`)? If `FALSE`, a `data.frame` is returned.
#' @param scale \code{character}. The desired Burwell scale, either: "tiny" (global), "small" (continental), "medium" (state/province), or "large" (county/quad).
#' @param source_id \code{integer}. The unique identification number(s) of the desired sources.
#' @param all \code{logical}. return all source definitions
