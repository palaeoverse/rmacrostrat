#' @param strat_name \code{character}. The name(s) of the desired stratigraphic unit(s).
#' @param concept_id \code{integer}. The unique identification number(s) of stratigraphic concepts (grouped `strat_name`s which represent the same entity).
#' @param rank \code{character}. The formal stratigraphic rank abbreviation of the desired unit(s) (e.g. Gp, Fm, Mbr).
#' @param interval_name \code{character}. The chronostratigraphic interval name (i.e. intervals returned by `macrostrat_intervals`). This returns only `strat_names` with an age declared in Macrostrat.
#' @param rule \code{character}. The hierarchical rule for returning stratigraphic names (either 'all' or 'down'). The 'all' option will return the entire stratigraphic name hierachy that the specified request belongs to. The 'down' option will return any children of the requested stratigraphic name.
#' @param strat_name_id \code{integer}. The unique identification number(s) of the desired stratigraphic name.
#' @param ref_id \code{character}. The unique identification number(s) of the desired reference(s). Only stratigraphic names linked to the specified `ref_id` will be returned.
#' @param strat_name_like \code{character}. The name(s) of the desired stratigraphic unit(s), with open-ended string matching.
#' @param all \code{logical}. Return all lithostratigraphic names
