#' @title Define objects associated with eODP
#'
#' @description Obtain metadata for variables associated with the
#' [Extending Ocean Drilling Pursuits (eODP)](https://eodp.github.io) project.
#' By default, data for all drilling sites are returned.
#'
#' @param program \code{character}. The name of a drilling program (i.e.,
#'   "DSDP", "ODP", or "IODP") to return a definition for.
#' @param exp \code{character}. The unique identification number(s) of drilling
#'   expedition(s) to return a definition for (formerly known as 'leg(s)').
#' @param site \code{character}. The unique identification number(s) of drilling
#'   site(s) to return a definition for.
#' @param sf \code{logical}. Should the results be returned as an `sf` object?
#'   Defaults to `FALSE`.
#'
#' @return A \code{data.frame} object containing, for each retrieved core:
#' \itemize{
#'  \item \code{epoch}: The name of the drilling program.
#'  \item \code{leg}: The name of the expedition (formerly known as a 'leg').
#'  \item \code{site}: The name of the drilling site.
#'  \item \code{hole}: The name of the drilling hole.
#'  \item \code{lat}: The decimal degree latitude of the drilling hole.
#'  \item \code{lng}: The decimal degree longitude of the drilling hole.
#'  \item \code{col_id}: The unique identification number of the eODP column.
#'  \item \code{col_group_id}: The unique identification number of the group to
#'    which the eODP column belongs.
#'  \item \code{penetration}: The depth of the hole drilled, in meters.
#'  \item \code{cored}: The amount of rock cored from the drill hole, in meters.
#'  \item \code{recovered}: The amount of rock recovered from the core, in
#'    meters.
#'  \item \code{recovery}: The proportion of rock recovered from the core.
#'  \item \code{drilled_interval}: The interval drilled.
#'  \item \code{drilled_intervals}: The number of drilled intervals.
#'  \item \code{cores}: The total number of cores drilled at the hole.
#'  \item \code{date_started}: The date on which drilling commenced.
#'  \item \code{date_finished}: The date on which drilling concluded.
#'  \item \code{comments}: Written notes assigned to the core.
#'  \item \code{ref_id}: The unique identification number of the reference.
#'  }
#'  If `sf` is `TRUE`, an `sf` object is returned instead, with a "geometry"
#'   column that contains the spatial data instead of the `lat`/`lng` columns.
#' @section Developer(s):
#'   Bethany Allen
#' @section Reviewer(s):
#'   Christopher D. Dean
#' @section References:
#' Sessa JA, Fraass AJ, LeVay LJ, Jamson KM, and Peters SE. (2023). The
#' Extending Ocean Drilling Pursuits (eODP) Project: Synthesizing Scientific
#' Ocean Drilling Data. Geochemistry, Geophysics, Geosystems, 24 (3)
#' e2022GC010655. \doi{10.1029/2022GC010655}.
#'
#' @examples
#' \donttest{
#' # Return all core information for a specific site
#' core_info <- def_drilling_sites(site = "U1547")
#' }
#' @export
#' @family external
def_drilling_sites <- function(program = NULL, exp = NULL, site = NULL,
                               sf = FALSE) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(program = "character", exp = "character", site = "character",
              sf = "logical"
  )
  check_arguments(x = args, ref = ref)
  # Recode names
  api_names <- list(program = "epoch")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))
  # Set default for format
  if (sf) format <- "geojson" else format <- "json"
  # Get request
  dat <- GET_macrostrat(endpoint = "defs/drilling_sites", query = args,
                        format = format)
  # Return data
  return(dat)
}
