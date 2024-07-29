#' @title Retrieve a complete set of definitions
#'
#' @description A function to retrieve all definitions and/or metadata for a
#'   given definition set. Caution: some datasets are large and may take time
#'   to retrieve.
#'
#' @param type \code{character}. The name of a definition set to retrieve. See
#'   Definitions section below for options.
#'
#' @section Definitions:
#'
#' \itemize{
#'  \item{columns}: Definitions of Macrostrat columns. See also
#'    [def_columns()].
#'  \item{drilling_sites}: Definitions of eODP drilling cores. See also
#'    [def_drilling_sites()].
#'  \item{econs}: Definitions of economic resources. See also [def_econs()].
#'  \item{environments}: Definitions of environments. See also
#'    [def_environments()].
#'  \item{grain_sizes}: Definitions of grain sizes. See also
#'    [def_grain_sizes()].
#'  \item{intervals}: Definitions of temporal intervals. See also
#'    [def_intervals()].
#'  \item{lithologies}: Definitions of lithologies. See also
#'    [def_lithologies()].
#'  \item{lithology_att}: Definitions of lithology attributes. See also
#'    [def_lithology_att()].
#'  \item{measurements}: Definitions of measurements. See also
#'    [def_measurements()].
#'  \item{minerals}: Defintions of minerals. See also [def_minerals()].
#'  \item{plates}: Definitions of tectonic plates. See also [def_plates()].
#'  \item{projects}: Definitions of Macrostrat projects. See also
#'    [def_projects()].
#'  \item{references}: Definitions of references. See also [def_references()].
#'  \item{sources}: Definitions of geological maps. See also [def_sources()].
#'  \item{strat_name_concepts}: Definitions of stratigraphic name concepts.
#'    See also [def_strat_name_concepts()].
#'  \item{strat_names}: Definitions of stratigraphic names. See also
#'    [def_strat_names()].
#'  \item{structures}: Definitions of geological structures. See also
#'    [def_structures()].
#'  \item{timescales}: Definitions of timescales. See also [def_timescales()].
#'  }
#'
#' @return A \code{data.frame} containing an exhaustive list of the
#'   definitions and/or metadata retrievable for the given definition set. The
#'   variables in the \code{data.frame} will match those described in the
#'   documentation for that definition set.
#'
#' @section Developer(s):
#'  Bethany Allen & Lewis A. Jones
#'
#' @section Reviewer(s):
#'  Lewis A. Jones
#'
#' @examples
#' \donttest{
#'   # Get mineral definitions
#'   ex1 <- catalog(type = "minerals")
#'   # Get grain size definitions
#'   ex2 <- catalog(type = "grain_sizes")
#' }
#' @export
#' @family defs
catalog <- function(type = NULL) {
  if (is.null(type)) stop("No `type` provided.")
  if (!is.character(type)) stop("`type` must be of class character.")
  dat <- get(paste0("def_", type))()
  return(dat)
}
