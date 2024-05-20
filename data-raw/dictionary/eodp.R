#' @param epoch \code{NA}. string, drilling 'epoch'; only three valid values (DSDP, ODP and IODP), but note that Baggage Stipper limited to IODP
#' @param leg \code{NA}. string, drilling leg (or expedition for IODP, e.g., leg=317)
#' @param site \code{NA}. string, drilling site (e.g., U1351)
#' @param col_id \code{NA}. integer, one or more Macrostrat column ids
#' @param col_group_id \code{NA}. integer, one or more Macrostrat column group ids; corresponds to legs/expeditions
#' @param all \code{NA}. return all drilling expeditions and sites
#' @param sample \code{NA}. if present, get a selection of data
#' @param sf \code{NA}. Should the results be returned as an `sf` object (defaults to TRUE)?If `FALSE`, a `data.frame` is returned.
