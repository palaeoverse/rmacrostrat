#' @title Retrieve geologic map legend data
#'
#' @description A function to retrieve legend components from various geological
#'   maps.
#'
#' @param source_id \code{integer}. Filter legend components to those in sources
#'   specified by their unique identification number(s).
#' @param lithology_id \code{integer}. Filter legend components to those
#'   containing one or more lithology(ies) as specified by their unique
#'   identification number(s).
#' @param lithology_type \code{character}. Filter legend components to those
#'   containing one or more named lithology type(s) (e.g., "carbonate",
#'   "siliciclastic").
#' @param lithology_class \code{character}. Filter legend components to those
#'   containing one or more named lithology class(es) (e.g., "sedimentary",
#'   "igneous", "metamorphic").
#' @param description \code{character}. Filter legend components to those
#'   containing the given character string in the map unit description field.
#' @param comments \code{character}. Filter legend components to those
#'   containing the given character string in the map unit comments field.
#' @param scale \code{character}. Filter legend components to those from maps of
#'   specific scale(s) in Macrostrat's system. Options are "tiny" (global),
#'   "small" (continental), "medium" (regional), or "large" (local).
#' @param carto \code{character}. Filter legend components to those of specific
#'   scale(s) in Macrostrat's system. Options are "tiny" (global), "small"
#'   (continental), "medium" (regional), or "large" (local).
#' @return A \code{dataframe} containing the following columns:
#' \itemize{
#'   \item \code{legend_id}: The unique identification number of the
#'     map legend.
#'   \item \code{source_id}: The identification number of the source geologic
#'     map (see [def_sources()]).
#'   \item \code{scale}: The associated Macrostrat map scale for the legend.
#'   \item \code{map_unit_name}:The name of the outcrop shape element as defined
#'     in the geologic map source.
#'   \item \code{strat_name}: The geologic name(s) of the outcrop shape element.
#'   \item \code{age}: The chronostratigraphic bin assigned to the outcrop shape
#'     element, as defined in the geologic map source in plain text.
#'   \item \code{lith}: The lithology of the outcrop shape element as defined in
#'     the geologic map source in plain text.
#'   \item \code{descrip}: Description of the outcrop shape element in plain
#'     text.
#'   \item \code{comments}: Notes assigned to the outcrop shape element.
#'   \item \code{t_age}: The estimated top age of the outcrop shape element, in
#'     millions of years before present.
#'   \item \code{b_age}: The estimated bottom age of the outcrop shape element,
#'     in millions of years before present.
#'   \item \code{b_interval}: The unique identification number of the bottom
#'     time interval matched to the outcrop shape element.
#'   \item \code{t_interval}: The unique identification number of the top time
#'     interval matched to the outcrop shape element.
#'   \item \code{strat_name_id}: A vector containing the unique identification
#'     number(s) for known stratigraphic unit name(s) matched to the outcrop
#'     shape element (see [def_strat_names()]).
#'   \item \code{unit_id}: A vector containing the unique identification
#'     number(s) for known Macrostrat unit(s) matched to the outcrop shape
#'     element.
#'   \item \code{lith_classes}: A vector containing the named lithology
#'     class(es) (e.g., "sedimentary") matched to the outcrop shape element.
#'   \item \code{lith_types}: A vector containing the named lithology type(s)
#'     (e.g., "siliciclastic") matched to the outcrop shape element.
#'   \item \code{lith_id}: A vector containing the unique identification
#'     number(s) for known lithology(ies) represented within the outcrop shape
#'     element (see [def_lithologies()]).
#'   \item \code{color}: Recommended color for plotting the outcrop shape
#'     element based on the dominant lithology.
#'   \item \code{area}: The area of the outcrop shape element in
#'     km\ifelse{html}{\out{<sup>2</sup>}}{\eqn{^2}}.
#'   \item \code{tiny_area}: The area of the outcrop shape element in
#'     km\ifelse{html}{\out{<sup>2</sup>}}{\eqn{^2}} at "tiny" Macrostrat map
#'     scale.
#'   \item \code{small_area}: The area of the outcrop shape element in
#'     km\ifelse{html}{\out{<sup>2</sup>}}{\eqn{^2}} at "small" Macrostrat map
#'     scale.
#'   \item \code{medium_area}: The area of the outcrop shape element in
#'     km\ifelse{html}{\out{<sup>2</sup>}}{\eqn{^2}} at "medium" Macrostrat map
#'     scale.
#'   \item \code{large_area}: The area of the outcrop shape element in
#'     km\ifelse{html}{\out{<sup>2</sup>}}{\eqn{^2}} at "large" Macrostrat map
#'     scale.
#'   }
#'
#' @section Developer(s):
#'   Christopher D. Dean
#' @section Reviewer(s):
#'   William Gearty
#'
#' @details Potential Macrostrat map scales are "tiny" (global), "small"
#'   (continental), "medium" (regional), or "large" (local).
#'
#' @examples
#' \donttest{
#'  # Get legend components by ID of the original source map
#'  ex1 <- get_map_legends(source_id = 1)
#'  # Get legend components for any sedimentary lithologies
#'  ex2 <- get_map_legends(lithology_type = "sedimentary")
#'  # Get any legend components that have comments with the word 'breccia'
#'  ex3 <- get_map_legends(comments = "breccia")
#' }
#' @export
#' @family maps
get_map_legends <- function(source_id = NULL,
    lithology_id = NULL, lithology_type = NULL, lithology_class = NULL,
    description = NULL, comments = NULL, scale = NULL, carto = NULL) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(source_id = "integer",
    lithology_id = "integer", lithology_type = "character",
    lithology_class = "character",
    description = "character", comments = "character", scale = "character",
    carto = "character"
  )
  check_arguments(x = args, ref = ref)
  if (!is.null(scale)) {
    if (! scale %in% c("tiny", "small", "medium", "large")) {
      stop(paste("Invalid value for `scale`. Only \"tiny\", \"small\",",
                 "\"medium\", or \"large\" is allowed."))
    }
  }
  if (!is.null(carto)) {
    if (! carto %in% c("tiny", "small", "medium", "large")) {
      stop(paste("Invalid value for `carto`. Only \"tiny\", \"small\",",
                 "\"medium\", or \"large\" is allowed."))
    }
  }

  # Recode names
  api_names <- list(lithology_class = "lith_class",
                    lithology_id = "lith_id",
                    lithology_type = "lith_type")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))

  # Get request
  dat <- GET_macrostrat(endpoint = "geologic_units/map/legend", query = args,
                        format = "json")

  # Return data
  return(dat)
}
