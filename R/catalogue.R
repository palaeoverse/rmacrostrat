#' @title Retrieve a complete set of definitions
#' @description A function to retrieve all definitions and/or metadata for a
#' given definition set. Caution: some datasets are large and may take time to
#' retrieve.
#'
#' @param type \code{character}. The name of a definition set to retrieve.
#' Options are:
#' \describe{
#'  \item{columns}{Definitions of Macrostrat columns. See also
#'  [def_columns()].}
#'  \item{drilling_sites}{Metadata on eODP drilling cores. See also
#'  [def_drilling_sites()].}
#'  \item{econs}{Definitions of economic resources. See also [def_econs()].}
#'  \item{environments}{Definitions of environments. See also
#'  [def_environments()].}
#'  \item{grain_sizes}{Definitions of grain sizes. See also
#'  [def_grain_sizes()].}
#'  \item{intervals}{Definitions of temporal intervals. See also
#'  [def_intervals()].}
#'  \item{lithologies}{Definitions of lithologies. See also
#'  [def_lithologies()].}
#'  \item{lithology_att}{Definitions of lithology attributes. See also
#'  [def_lithology_att()].}
#'  \item{measurements}{Definitions of measurements. See also
#'  [def_measurements()].}
#'  \item{minerals}{Defintions of minerals. See also [def_minerals()].}
#'  \item{plates}{Definitions of tectonic plates. See also [def_plates()].}
#'  \item{projects}{Metadata on Macrostrat projects. See also [def_projects()].}
#'  \item{references}{Metadata on references. See also [def_references()].}
#'  \item{sources}{Metadata on geological maps. See also [def_sources()].}
#'  \item{strat_name_concepts}{Metadata on stratigraphic name concepts. See also
#'  [def_strat_name_concepts()].}
#'  \item{strat_names}{Metadata on stratigraphic names. See also
#'  [def_strat_name()].}
#'  \item{structures}{Definitions of geological structures. See also
#'  [def_structures()].}
#'  \item{timescales}{Metadata on timescales. See also [def_timescales()].}
#'  }
#'
#' @return A \code{dataframe} containing an exhaustive list of the definitions
#' and/or metadata retrievable for the given definition set. The variables in
#' the \code{dataframe} will match those described in the documentation for
#' that definition set.
#'
#' @author Bethany Allen [AUTHOR_2]
#'
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # mineral_definitions <- catalogue(type = "minerals")
#' }
#' }
#' @export

catalogue <- function(
    type = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    type = "character"
  )
  check_arguments(x = args, ref = ref)

  # Set default for format
  format <- "json"

  # Get request
  dat <- GET_macrostrat(endpoint = "defs/econs", query = args, format = format)

  # Return data
  return(dat)
}
