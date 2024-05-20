#' @param point_id \code{integer}. The unique identification number(s) of the point(s) to return.
#' @param minlat \code{integer}. A minimum latitude that represents the southwest corner of a bounding box of the points to return (requires `minlng`, `maxlat`, and `maxlng`). Ignored if `point_id` is supplied.
#' @param minlng \code{integer}. A minimum longitude that represents the southwest corner of a bounding box of the points to return (requires `minlat`, `maxlat`, and `maxlng`). Ignored if `point_id` is supplied.
#' @param maxlat \code{integer}. A maximum latitude that represents the northeast corner of a bounding box of the points to return (requires `minlat`, `minlng`, and `maxlng`). Ignored if `point_id` is supplied.
#' @param maxlng \code{integer}. A maximum longitude that represents the northeast corner of a bounding box of the points to return (requires `minlat`, `minlng`, and `maxlat`). Ignored if `point_id` is supplied.
#' @param source_id \code{integer}. The unique identification number(s) of the source(s) to filter the results by. Ignored if `point_id` is supplied.
#' @param point_type \code{character}. Filter results to those of one or more point type(s). Ignored if `point_id` is supplied. Examples include "cleavage", "bedding", "axial plane", "fault plane", "foliation", and "joint".
#' @param certainty \code{character}. Filter results by a fuzzy match to the certainty field. Ignored if `point_id` is supplied.
#' @param comments \code{character}. Filter results by a fuzzy match to the comments field. Ignored if `point_id` is supplied.
#' @param sf \code{logical}. Should the results be returned as an `sf` object (defaults to `TRUE`)? If `FALSE`, a `data.frame` is returned.
#' @param sample \code{logical}. Return a sample of data.
