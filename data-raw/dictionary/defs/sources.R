#' @param source_id \code{integer}. The unique identification number(s) of the desired source(s) to return a definition for.
#' @param lat \code{numeric}. A valid latitude in decimal degrees to return a source definition for. Must also supply a valid longitude.
#' @param lng \code{numeric}. A valid longitude in decimal degrees to return a source definition for. Must also supply a valid latitude.
#' @param shape \code{character}. A valid well-known text (WKT) representation of geometry, such as "POINT(30 10)" or "POLYGON((30 10, 40 40, 20 40, 10 20))", to return a source definition for.
#' @param buffer \code{integer}. The geographic buffer (in metres) that should be applied to the specified `shape`.
#' @param scale \code{character}. The desired Burwell scale, either: "tiny" (global), "small" (continental), "medium" (regional), or "large" (local).
