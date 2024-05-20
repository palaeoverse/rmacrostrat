#' @param timescale \code{character}. The name of the desired timescale. Available timescales can be retrieved via [get_timescales].
#' @param name \code{character}. The name of the desired interval. If set to NULL (default), all interval data for the respective timescale is returned.
#' @param age \code{numeric}. Age in millions of years before present. All intervals overlapping with this age will be returned.
#' @param t_age \code{numeric}. Minimum age in millions of years before present. The minimum age bound interval data should be returned for. If set to NULL (default), all interval data for the respective timescale is returned.
#' @param b_age \code{numeric}. Maximum age in millions of years before present. The maximum age bound interval data should be returned for. If set to NULL (default), all interval data for the respective timescale is returned.
#' @param rule \code{character}. How should intervals be returned for the given `t_age` and `b_age`? Use "contains" to return all intervals that fall entirely within `t_age` and `b_age`. Use "exact" to return all intervals within boundaries equal to `t_age` and `b_age`. Use "loose" to return all intervals touching the range of `t_age` and `b_age`. If `t_age` and `b_age` are not provided, this argument is ignored.
#' @param all \code{logical}. Should all available interval definitions be returned? Defaults to TRUE.
#' @param true_colors \code{logical}. Should the original international time scale colors be returned? Defaults to TRUE.
#' @param int_id \code{integer}. The identification number of the desired interval.
#' @param timescale_id \code{integer}. The identification number of the desired timescale. Available timescale identification numbers can be retrieved via [get_timescales].
