#' @title Retrieve metadata associated with eODP
#' @description Obtain metadata for variables associated with the
#' [Extending Ocean Drilling Pursuits (eODP)](https://eodp.github.io) project.
#' By default, data for all drilling sites are returned.
#'
#' @param program \code{character}. The name of a drilling program (i.e.,
#'   "DSDP", "ODP", or "IODP") to return a definition for.
#' @param leg \code{character}. The unique identification number(s) of drilling
#'   leg(s) to return a definition for.
#' @param site \code{character}. The unique identification number(s) of drilling
#'   site(s) to return a definition for.
#' @param sf \code{logical}. Should the results be returned as an `sf` object
#'   (defaults to `TRUE`)? If `FALSE`, a `data.frame` is returned.
#'
#' @return An `sf` object containing, for each retrieved core:
#' \describe{
#'  \item{epoch}{The name of the drilling program}
#'  \item{leg}{The name of the leg/expedition}
#'  \item{site}{The name of the drilling site}
#'  \item{hole}{The name of the drilling hole}
#'  \item{lat}{Decimal degree latitude of the core}
#'  \item{lng}{Decimal degree longitude of the core}
#'  \item{col_id}{The unique identifier of the Macrostrat column}
#'  \item{col_group_id}{The unique identifier of the group to which the
#'  Macrostrat column belongs}
#'  \item{penetration}{The depth of the hole}
#'  \item{cored}{}
#'  \item{recovered}{}
#'  \item{recovery}{}
#'  \item{drilled_interval}{}
#'  \item{drilled_intervals}{}
#'  \item{cores}{}
#'  \item{date_started}{The date on which drilling commenced}
#'  \item{comments}{Written notes assigned to the core}
#'  \item{ref_id}{The unique identifier of the reference}
#'  }
#'  If sf = FALSE, a \code{dataframe} is outputted instead.
#'
#' @author Bethany Allen [AUTHOR_2]
#' @section References:
#' Sessa JA, Fraass AJ, LeVay LJ, Jamson KM, and Peters SE. (2023). The
#' Extending Ocean Drilling Pursuits (eODP) Project: Synthesizing Scientific
#' Ocean Drilling Data. Geochemistry, Geophysics, Geosystems, 24 (3)
#' e2022GC010655. \doi{10.1029/2022GC010655}.
#'
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # core_info <- def_drilling_sites(site = "U1547")
#'   # core_info <- def_drilling_sites(leg = "385")
#' }
#' }
#' @export

def_drilling_sites <- function(
    program = NULL,
    leg = NULL,
    site = NULL,
    sf = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    program = "character",
    leg = "character",
    site = "character",
    sf = "logical"
  )
  check_arguments(x = args, ref = ref)
  # Check whether provided program fits categories
  if (!is.null(program) && (program != "DSDP" && program != "IODP" &&
                            program != "ODP")) {
    stop("program must either be 'DSDP', 'IODP', or 'ODP'")
  }

  # Recode names
  api_names <- list(program = "epoch")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))

  # Set default for format
  format <- "geojson"

  # Get request
  dat <- GET_macrostrat(endpoint = "defs/drilling_sites", query = args,
                        format = format)

  # Return data
  return(dat)
}
