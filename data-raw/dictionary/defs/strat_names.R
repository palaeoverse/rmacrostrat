#' @param strat_name_id \code{NA}. unique id
#' @param strat_name \code{NA}. lithostratigraphic name, exact match
#' @param strat_name_like \code{NA}. lithostratigraphic name, with open-ended string matching
#' @param concept_id \code{NA}. uniqe id for stratigraphic concepts
#' @param rank \code{NA}. lithostratigraphic rank
#' @param rule \code{NA}. Can be 'all' or 'down'. Down will return any children of the requested stratigraphic name, and all will return the entire stratigraphic name hierarchy that the request name belongs to
#' @param interval_name \code{NA}. chronostratigrpahic interval name (see /defs/intervals); this will return only strat_names with a declared age in Macrostrat
#' @param ref_id \code{NA}. retrieve only stratigraphic names linked the specified reference_id (see /defs/refs)
#' @param all \code{NA}. return all lithostratigraphic names
