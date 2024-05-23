#' @title Retrieve core data from ocean drilling programs
#' @description Call data from the
#' [Extending Ocean Drilling Pursuits (eODP)](https://eodp.github.io)
#' project, a collation of sedimentary description data
#' from ocean drilling cores. This includes cores from the Deep Sea Drilling
#' Project (DSDP), Integrated Ocean Drilling Program (IODP), and Ocean Drilling
#' Program (ODP).
#'
#' @param column_id \code{integer}. Filter cores by their unique identification
#'   number(s).
#' @param site \code{character}. Filter cores to those from a particular
#'   drilling site (e.g., "U1351").
#' @param leg \code{character}. Filter cores to those from a particular drilling
#'   leg or expedition (e.g., "317").
#' @param program \code{character}. Filter cores to those from a particular
#'   drilling program ("DSDP", "IODP", or "ODP").
#' @param sf \code{logical}. Should the results be returned as an `sf` object?
#'   Defaults to `FALSE`.
#'
#' @return A \code{dataframe} containing, for each retrieved core:
#' \describe{
#'  \item{col_group}{The name of the drilling program and leg/expedition}
#'  \item{site_hole}{The name of the drilling site and hole}
#'  \item{date_started}{The date on which drilling commenced}
#'  \item{ref_id}{The unique identifier of the reference}
#'  \item{col_id}{The unique identifier of the Macrostrat column}
#'  \item{lat}{Decimal degree latitude of the core}
#'  \item{lng}{Decimal degree longitude of the core}
#'  \item{top_depth}{A vector describing the height of the top of each unit}
#'  \item{bottom_depth}{A vector describing the height of the bottom of each
#'    unit}
#'  \item{primary_lith}{A vector giving the name of the primary lithology of
#'    each unit}
#'  \item{lith_id}{A vector giving the unique identifier of the primary
#'    lithology of each unit}
#'  \item{minor_lith}{A vector giving the name of the primary lithology of
#'    each unit}
#'  }
#'  If sf = TRUE, an `sf` object is outputted instead.
#' @author Bethany Allen
#' @details More information can be found about the inputs for this function by
#'  using [def_drilling_sites()].
#' @section References:
#' Sessa JA, Fraass AJ, LeVay LJ, Jamson KM, and Peters SE. (2023). The
#' Extending Ocean Drilling Pursuits (eODP) Project: Synthesizing Scientific
#' Ocean Drilling Data. Geochemistry, Geophysics, Geosystems, 24 (3)
#' e2022GC010655. \doi{10.1029/2022GC010655}.
#'
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # cores <- get_eodp(column_id = c(5081, 5082))
#'   # cores <- get_eodp(site = "U1351")
#'   # cores <- get_eodp(leg = "317")
#'   # cores <- get_eodp(program = "IODP")
#' }
#' }
#' @export
#' @family external
get_eodp <- function(
    column_id = NULL,
    site = NULL,
    leg = NULL,
    program = NULL,
    sf = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    column_id = "integer",
    site = "character",
    leg = "character",
    program = "character",
    sf = "logical"
  )
  check_arguments(x = args, ref = ref)
  # Check whether provided program fits categories
  if (!is.null(program) && (program != "DSDP" && program != "IODP" &&
                            program != "ODP")) {
    stop("program must either be 'DSDP', 'IODP', or 'ODP'")
  }

  # Recode names
  api_names <- list(column_id = "col_id", program = "epoch")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))

  # Set default for format
  format <- "json"

  # Get request
  dat <- GET_macrostrat(endpoint = "eodp", query = args, format = format)

  # Return data
  return(dat)
}
