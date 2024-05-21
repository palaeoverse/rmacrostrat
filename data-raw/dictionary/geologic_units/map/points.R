#' @param point_id \code{integer}. The unique identification number(s) of the point(s) to return.
#' @param point_type \code{character}. Filter points to those of one or more point type(s). Options are "cleavage", "bedding", "axial plane", "fault plane", "foliation", and "joint". Ignored if `point_id` is supplied.
#' @param min_lat \code{integer}. A minimum latitude that represents the southwest corner of a bounding box of the points to return. Requires `min_lng`, `max_lat`, and `max_lng`. Ignored if `point_id` is supplied.
#' @param min_lng \code{integer}. A minimum longitude that represents the southwest corner of a bounding box of the points to return. Requires `min_lat`, `max_lat`, and `max_lng`. Ignored if `point_id` is supplied.
#' @param max_lat \code{integer}. A maximum latitude that represents the northeast corner of a bounding box of the points to return. Requires `min_lat`, `min_lng`, and `max_lng`. Ignored if `point_id` is supplied.
#' @param max_lng \code{integer}. A maximum longitude that represents the northeast corner of a bounding box of the points to return. Requires `min_lat`, `min_lng`, and `max_lat`. Ignored if `point_id` is supplied.
#' @param source_id \code{integer}. The unique identification number(s) of the source(s) to filter the points by. Ignored if `point_id` is supplied.
#' @param sf \code{logical}. Should the results be returned as an `sf` object? Defaults to `TRUE`. If `FALSE`, a `data.frame` is returned.
