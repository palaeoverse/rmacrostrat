#' @title Retrieve stratigraphic name definitions
#' @description A function to retrieve the definitions for one or more
#'   stratigraphic names in the Macrostrat database. By default, all
#'   stratigraphic name definitions are returned.
#' @param strat_name \code{character}. The name(s) of the desired stratigraphic
#'   unit(s) to return a definition for.
#' @param interval_name \code{character}. The chronostratigraphic interval name
#'   for which to return stratigraphic name definitions with any temporal
#'   overlap (e.g., "Campanian"). This returns only `strat_names` with an age
#'   declared in Macrostrat.
#' @param rank \code{character}. The formal stratigraphic rank abbreviation of
#'   the desired unit(s) (i.e., "SGp", "Gp", "SubGp", "Fm", "Mbr", or "Bed") to
#'   return a definition for.
#' @param concept_id \code{integer}. The unique identification number(s) of
#'   stratigraphic concepts (grouped `strat_name`s which represent the same
#'   entity) to return a definition for.
#' @param ref_id \code{character}. The unique identification number(s) of the
#'   desired reference(s). Only stratigraphic names linked to the specified
#'   `ref_id` will be returned.
#' @param strat_name_id \code{integer}. The unique identification number(s) of
#'   the desired stratigraphic name to return a definition for.
#' @param rule \code{character}. The hierarchical rule for returning
#'   stratigraphic name definitions (either "all" or "down"). The "all" option
#'   will return the entire stratigraphic name hierarchy (parents and children
#'   of all levels) that the specified request belongs to. The "down" option
#'   will return any direct children of the requested stratigraphic name. Can
#'   only be used with `strat_name_id`.
#' @return A `data.frame` containing the following columns:
#' \itemize{
#'   \item \code{strat_name}: The short-form stratigraphic name (e.g. "Hell
#'   Creek").
#'   \item \code{strat_name_long}: The long-form stratigraphic name, including
#'   the lithostratigraphic rank of the stratigraphic name (e.g., "Hell Creek
#'   Formation").
#'   \item \code{rank}: The lithostratigraphic rank of the stratigraphic name
#'   (e.g., "Formation"), in short form (e.g., "Fm").
#'   \item \code{concept_id}: The unique identification number of the associated
#'   stratigraphic name concept, which groups variant strat_names for the same
#'   geologic entity (see [def_strat_name_concepts()]).
#'   \item \code{bed}: The stratigraphic name of the bed associated with the
#'   specified stratigraphic name.
#'   \item \code{bed_id}: The unique identification number (strat_name_id) of
#'   the bed associated with the specified stratigraphic name associated with
#'   the specified stratigraphic name.
#'   \item \code{mbr}: The stratigraphic name of the member associated with the
#'   specified stratigraphic name.
#'   \item \code{mbr_id}: The unique identification number (strat_name_id) of
#'   the member associated with the specified stratigraphic name.
#'   \item \code{fm}: The stratigraphic name of the formation associated with
#'   the specified stratigraphic name.
#'   \item \code{fm_id}: The unique identification number (strat_name_id) of
#'   the formation associated with the specified stratigraphic name.
#'   \item \code{subgp}: The stratigraphic name of the subgroup associated with
#'   the specified stratigraphic name.
#'   \item \code{subgp_id}: The unique identification number (strat_name_id) of
#'   the subgroup associated with the specified stratigraphic name.
#'   \item \code{gp}: The stratigraphic name of the group associated with the
#'   specified stratigraphic name.
#'   \item \code{gp_id}: The unique identification number (strat_name_id) of
#'   the group associated with the specified stratigraphic name.
#'   \item \code{sgp}: The stratigraphic name of the supergroup associated with
#'   the specified stratigraphic name.
#'   \item \code{sgp_id}: The unique identification number (strat_name_id) of
#'   the supergroup associated with the specified stratigraphic name.
#'   \item \code{b_age}: The bottom age (maximum age) associated with the
#'   stratigraphic name, in millions of years before present.
#'   \item \code{t_age}: The top age (minimum age) associated with the
#'   stratigraphic name, in millions of years before present.
#'   \item \code{b_period}: The name of the bottom geologic time period (oldest
#'   period) associated with the stratigraphic name (see [def_intervals()]).
#'   \item \code{t_period}:The name of the top geologic time period (youngest
#'   period) associated with the stratigraphic name (see [def_intervals()]).
#'   \item \code{c_interval}: The name of the central interval associated with
#'   the stratigraphic name (see [def_intervals()]).
#'   \item \code{t_units}: The total number of Macrostrat units that are
#'   associated with the stratigraphic name.
#'   \item \code{ref_id}: The unique identification number of the reference from
#'   which the stratigraphic name was sourced (see [def_references()]).
#' }
#' @author Christopher D. Dean
#' @section Reviewer: N/A
#' @examples
#' \dontrun{
#' # Return all stratigraphic names
#' ex1 <- head(def_strat_names())
#' # Return all stratigraphic names associated with a particular stratigraphic
#' # name
#' ex2 <- def_strat_names(strat_name = "Hell Creek")
#' # Return all stratigraphic names that intersect with a chosen time interval
#' and lithostratigraphic rank
#' ex3 <- head(def_strat_names(interval_name = "Campanian", rank = "Fm"))
#' }
#' @export

def_strat_names <- function(strat_name = NULL, interval_name = NULL,
    rank = NULL, concept_id = NULL, ref_id = NULL, strat_name_id = NULL,
    rule = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(strat_name = "character", interval_name = "character",
    rank = "character", concept_id = "integer", ref_id = "character",
    strat_name_id = "integer", rule = "character"
  )
  check_arguments(x = args, ref = ref)
  # Recode names
  api_names <- list(strat_name = "strat_name_like")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))

  # Set default for format
  format <- "json"
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/strat_names", query = args,
                        format = format)
  # Return data
  return(dat)
}
