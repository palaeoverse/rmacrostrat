#' @param latSpacing \code{numeric}. The size of latitudinal bins in degrees to generate. Defaults to `5`.
#' @param cellArea \code{numeric}. The desired cell area (km^2^) of cells within the grid. This is strictly a target value and will depend on values specified to `latSpacing`. Defaults to `500000`.
#' @param sf \code{logical}. Should the results be returned as an `sf` object (defaults to `TRUE`)? If `FALSE`, a `data.frame` is returned.
