#' @title Retrieve Macrostrat section data
#'
#' @description A function to retrieve Macrostrat units contained within
#'   gap-bound packages (sections).
#'
#' @param section_id \code{integer}. Filter sections by their unique
#'   identification number(s).
#' @param column_id \code{integer}. Filter sections to those contained within
#'   column(s) as specified by their unique identification number(s).
#' @param unit_id \code{integer}. Filter sections to those containing unit(s) as
#'   specified by their unique identification number(s).
#' @param strat_name \code{character}. Filter sections to those containing a
#'   unit that fuzzy matches a stratigraphic name (e.g., "Hell Creek").
#' @param strat_name_id \code{integer}. Filter sections to those containing a
#'   unit that matches one or more stratigraphic name(s) as specified by their
#'   unique identification number(s).
#' @param interval_name \code{character}. Filter sections to those that overlap
#'   with a named chronostratigraphic time interval (e.g., "Permian").
#' @param interval_id \code{integer}. Filter sections to those that overlap with
#'   a chronostratigraphic time interval as specified by their unique
#'   identification number(s).
#' @param age \code{numeric}. Filter sections to those that overlap with the
#'   specified numerical age, in millions of years before present.
#' @param age_top \code{numeric}. Filter sections to those that overlap with the
#'   age range between the specified numerical age and `age_bottom`. Should be
#'   in millions of years before present. `age_bottom` must also be specified,
#'   and this must be younger than `age_bottom`.
#' @param age_bottom \code{numeric}. Filter sections to those that overlap with
#'   the age range between the specified numerical age and `age_top`. Should be
#'   in millions of years before present. `age_top` must also be specified, and
#'   this must be older than `age_top`.
#' @param lat \code{numeric}. Return the sections at the specified decimal
#'   degree latitude. Must also specify `lng`.
#' @param lng \code{numeric}. Return the sections at the specified decimal
#'   degree longitude. Must also specify `lat`.
#' @param lithology \code{character}. Filter sections to those containing a
#'   named lithology (e.g., "shale", "sandstone").
#' @param lithology_id \code{integer}. Filter sections to those containing one
#'   or more lithology(ies) as specified by their unique identification
#'   number(s).
#' @param lithology_group \code{character}. Filter sections to those containing
#'   a named lithology group (e.g., "sandstones", "mudrocks", "unconsolidated").
#' @param lithology_type \code{character}. Filter sections to those containing a
#'   named lithology type (e.g., "carbonate", "siliciclastic").
#' @param lithology_class \code{character}. Filter sections to those containing
#'   a named lithology class (e.g., "sedimentary", "igneous", "metamorphic").
#' @param lithology_att \code{character}. Filter sections to those containing a
#'   named lithology attribute (e.g., "fine", "olivine", "poorly washed").
#' @param lithology_att_id \code{integer}. Filter sections to those containing
#'   one or more lithology attribute(s) as specified by their unique
#'   identification number(s).
#' @param lithology_att_type \code{character}. Filter sections to those
#'   containing a named category of lithology attribute (e.g., "grains",
#'   "lithology", "bedform").
#' @param environ \code{character}. Filter sections to those containing a named
#'   environment (e.g., "delta plain", "pond").
#' @param environ_id \code{integer}. Filter sections to those containing one or
#'   more environment(s) as specified by their unique identification number(s).
#' @param environ_type \code{character}. Filter sections to those containing a
#'   named environment type (e.g., "fluvial", "eolian", "glacial").
#' @param environ_class \code{character}. Filter sections to those containing a
#'   named environment class (e.g., "marine", "non-marine").
#' @param pbdb_collection_no \code{integer}. Filter sections to those containing
#'   one or more Paleobiology Database collection(s) as specified by their
#'   unique identification number(s).
#' @param econ \code{character}. Filter sections to those containing a named
#'   economic attribute (e.g., "brick", "ground water", "gold").
#' @param econ_id \code{integer}. Filter sections to those containing one or
#'   more economic attribute(s) as specified by their unique identification
#'   number(s).
#' @param econ_type \code{character}. Filter sections to those containing a
#'   named economic attribute type (e.g., "construction", "aquifer", "mineral").
#' @param econ_class \code{character}. Filter sections to those containing a
#'   named economic attribute class (e.g., "material", "water", "precious
#'   commodity").
#' @param project_id \code{integer}. Filter sections to those contained within
#'   one or more Macrostrat project(s) as specified by their unique
#'   identification number(s).
#' @param adjacents \code{logical}. If `column_id` or `lat`/`lng` is specified,
#'   should all sections that touch the specified column be returned? Defaults
#'   to `FALSE`.
#'
#' @return A \code{dataframe} containing the following columns:
#' \itemize{
#'   \item \code{col_id}: The unique identification number of the Macrostrat
#'     column containing the section.
#'   \item \code{col_area}: The area of the associated Macrostrat column in
#'     km\ifelse{html}{\out{<sup>2</sup>}}{\eqn{^2}}.
#'   \item \code{section_id}: The unique identification number of the Macrostrat
#'     section.
#'   \item \code{project_id}: The unique identification number of the Macrostrat
#'     project.
#'   \item \code{max_thick}: The maximum thickness of the section, in meters.
#'   \item \code{min_thick}: The minimum thickness of the section, in meters.
#'   \item \code{t_age}: The age of the top of the section, estimated using the
#'     continuous time age model, in millions of years before present.
#'   \item \code{b_age}: The age of the bottom of the section, estimated using
#'     the continuous time age model, in millions of years before present.
#'   \item \code{pbdb_collections}: The number of PBDB collections contained
#'     within the section.
#'   \item \code{lith}: a \code{dataframe} containing the lithologies present
#'     within the section, with the following columns:
#'   \itemize{
#'      \item \code{name}: The named lithology (e.g., "sandstone").
#'      \item \code{type}: The named lithology type (e.g., "siliciclastic").
#'      \item \code{class}: The named lithology class (e.g., "sedimentary").
#'      \item \code{prop}: The proportion of the lithology within the section,
#'        calculated from the individual Macrostrat units within the section.
#'      \item \code{lith_id}: The unique identification number of the lithology.
#'   }}
#'   \itemize{
#'   \item \code{environ}: a \code{dataframe} containing the environments
#'     present within the section, with the following columns:
#'   \itemize{
#'      \item \code{name}: The named environment (e.g., "delta plain").
#'      \item \code{type}: The named environment type (e.g., "siliciclastic").
#'      \item \code{class}: The named environment class (e.g., "marine").
#'      \item \code{prop}: The proportion of the environment within the section,
#'        calculated from the individual Macrostrat units within the section.
#'      \item \code{environ_id}: The unique identification number of the
#'        environment.
#'   }}
#'   \itemize{
#'   \item \code{econ}: a \code{dataframe} containing the economic attributes
#'     present within the section, with the following columns:
#'   \itemize{
#'      \item \code{name}: The named economic attribute (e.g., "gold").
#'      \item \code{type}: The named economic attribute type (e.g., "mineral").
#'      \item \code{class}: The named economic attribute class (e.g., "precious
#'        commodity").
#'      \item \code{prop}: The proportion of the economic attribute out of
#'        all economic attributes contained within the section, calculated
#'        from the individual Macrostrat units within the section.
#'      \item \code{econ_id}: The unique identification number of the economic
#'        attribute.
#'   }
#' }
#'
#' @section Developer(s):
#'   Christopher D. Dean
#' @section Reviewer(s):
#'   Bethany Allen
#'
#' @details More information can be found for the inputs for this function
#' using the definition functions (beginning with \code{defs_}).
#'
#' @examples
#' \donttest{
#' # Get sections within a specified column
#' ex1 <- get_sections(column_id = 10)
#' # Get sections at a specific geographic coordinate
#' ex2 <- get_sections(lng = -110.9, lat = 48.4)
#' }
#' @export
#' @family macrostrat
get_sections <- function(section_id = NULL, column_id = NULL, unit_id = NULL,
    strat_name = NULL, strat_name_id = NULL,
    interval_name = NULL, interval_id = NULL,
    age = NULL, age_top = NULL, age_bottom = NULL,
    lat = NULL, lng = NULL,
    lithology = NULL, lithology_id = NULL, lithology_group = NULL,
    lithology_type = NULL, lithology_class = NULL, lithology_att = NULL,
    lithology_att_id = NULL, lithology_att_type = NULL,
    environ = NULL, environ_id = NULL, environ_type = NULL,
    environ_class = NULL,
    pbdb_collection_no = NULL,
    econ = NULL, econ_id = NULL, econ_type = NULL, econ_class = NULL,
    project_id = NULL, adjacents = FALSE) {

  # Error handling
  # Check specific argument constraints
  if (!is.null(age_top) || !is.null(age_bottom)) {
    if (is.null(age_top) || is.null(age_bottom)) {
      stop("`age_top` and `age_bottom` must both be specified to filter by an
           age range.")
    }
    if (age_top > age_bottom) {
      stop("`age_top` must be younger/less than `age_bottom`.")
    }
  }
  # Check lng/lat arguments
  if (!is.null(lng) && is.null(lat)) {
    stop("`lat` required if `lng` specified.")
  }
  if (is.null(lng) && !is.null(lat)) {
    stop("`lng` required if `lat` specified.")
  }
  if (!is.null(lng) && !is.null(lat)) {
    if (lng >= 180 || lng <= -180) {
      stop("`lng` should be less than 180 and more than -180.")
    }
    if (lat >= 90 || lat <= -90) {
      stop("`lat` should be less than 90 and more than -90.")
    }
  }

  # Collect input arguments as a list
  args <- as.list(environment())

  # Check whether class of arguments is valid
  ref <- list(section_id = "integer", column_id = "integer",
              unit_id = "integer", strat_name = "character",
              strat_name_id = "integer", interval_name = "character",
              interval_id = "integer", age = "numeric", age_top = "numeric",
              age_bottom = "numeric", lat = "numeric", lng = "numeric",
              lithology = "character", lithology_id = "integer",
              lithology_group = "character", lithology_type = "character",
              lithology_class = "character", lithology_att = "character",
              lithology_att_id = "integer", lithology_att_type = "character",
              environ = "character", environ_id = "integer",
              environ_type = "character", environ_class = "character",
              pbdb_collection_no = "integer", econ = "character",
              econ_id = "integer", econ_type = "character",
              econ_class = "character", project_id = "integer",
              adjacents = "logical"
  )
  check_arguments(x = args, ref = ref)

  # Set default for format
  format <- "json"

  # Recode names
  api_names <- list(column_id = "col_id", interval_id = "int_id",
                    lithology = "lith", lithology_att = "lith_att",
                    lithology_att_id = "lith_att_id",
                    lithology_att_type = "lith_att_type",
                    lithology_class = "lith_class",
                    lithology_group = "lith_group", lithology_id = "lith_id",
                    lithology_type = "lith_type",
                    pbdb_collection_no = "cltn_id")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))

  # Get request
  dat <- GET_macrostrat(endpoint = "sections", query = args, format = format)

  # Return data
  return(dat)
}
