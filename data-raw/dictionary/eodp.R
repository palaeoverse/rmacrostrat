#' @param col_id \code{integer}. The unique identification number(s) of the column(s) to return.
#' @param site \code{character}. Filter results to those of a particular drilling site (e.g., "U1351").
#' @param leg \code{character}. Filter results to those of a particular drilling leg (or expedition for IODP, e.g., "317").
#' @param epoch \code{character}. Filter results to those of a particular drilling 'epoch' ("DSDP", "ODP", or "IODP").
#' @param col_group_id \code{integer}. The unique identification number(s) of the column group(s) to filter the results by. Corresponds to legs/expeditions.
#' @param sf \code{logical}. Should the results be returned as an `sf` object (defaults to `TRUE`)? If `FALSE`, a `data.frame` is returned.
#' @param all \code{logical}. return all drilling expeditions and sites
#' @param sample \code{logical}. if present, get a selection of data
