#' @title Define stratigraphic name concepts
#'
#' @description A function to retrieve the definitions for stratigraphic name
#' concepts. By default, all stratigraphic name concept definitions
#' are returned.
#'
#' @param strat_concept_name \code{character}. The name(s) of the desired
#'   stratigraphic name concept(s) to return a definition for (e.g., "Hell
#'   Creek").
#' @param strat_concept_id \code{integer}. The unique identification number(s)
#'   of the desired stratigraphic name concept(s) to return a definition for.
#'
#' @return A `data.frame` containing the following columns:
#' \itemize{
#'   \item \code{concept_id}: The unique identification number for the
#'     stratigraphic name concept, which groups variant `strat_name`s for same
#'     geologic entity.
#'   \item \code{name}: The name of the stratigraphic name concept.
#'   \item \code{geologic_age}: The geologic age information assigned to the
#'     stratigraphic name concept, as defined in the original reference in plain
#'     text.
#'   \item \code{int_id}: The unique identification number of the
#'     chronostratigraphic interval associated with the stratigraphic name
#'     concept (see [def_intervals()]).
#'   \item \code{b_int_id}: The unique identification number of the bottom
#'     (oldest) chronostratigraphic interval associated with the stratigraphic
#'     name concept (see [def_intervals()]).
#'   \item \code{t_int_id}: The unique identification number of the top
#'     (youngest) chronostratigraphic interval associated with the stratigraphic
#'     name concept (see [def_intervals()]).
#'   \item \code{usage_notes}: Notes on the current validity of the
#'     stratigraphic name concept, in plain text.
#'   \item \code{other}: Other associated notes on the stratigraphic name
#'     concept, in plain text.
#'   \item \code{province}: The provinces where the stratigraphic name concept
#'     appears, in plain text.
#'   \item \code{refs}: The unique identification number of the reference from
#'     which the stratigraphic name concept was sourced (see
#'     [def_references()]).
#'   \item \code{url}: The URL associated with the stratigraphic name concept,
#'     where additional information, the source or contributing publication can
#'     be found.
#'   \item \code{author}: The authors of the source reference.
#'   }
#' @section Developer(s):
#'   Christopher D. Dean
#' @section Reviewer(s):
#'   William Gearty
#'
#' @details Stratigraphic name concepts consist of grouped `strat_name`s which
#' represent the same geologic entity. This may be due to stratigraphic names
#' appearing in multiple reference maps or at multiple lithostratigraphic
#' ranks.
#'
#' @examples
#' \donttest{
#' # Return a stratigraphic name concept based on a string
#' ex1 <- def_strat_name_concepts(strat_concept_name = "Dakota")
#' # Return a stratigraphic name concept based on an ID
#' ex1 <- def_strat_name_concepts(strat_concept_id = 8212)
#' }
#' @export
#' @family defs_strat
def_strat_name_concepts <- function(strat_concept_name = NULL,
                                    strat_concept_id = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(strat_concept_name = "character", strat_concept_id = "integer")
  check_arguments(x = args, ref = ref)
  # Recode names
  api_names <- list(strat_concept_id = "concept_id",
                    strat_concept_name = "concept_name")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/strat_name_concepts", query = args,
                        format = "json")
  # Return data
  return(dat)
}
