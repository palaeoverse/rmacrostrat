#' @title Retrieve Macrostrat column data
#'
#' @description A function to retrieve independent, hexagonal, vertical columns
#'   which contain chronostratigraphically organised Macrostrat units.
#'
#' @param column_id \code{integer}. Filter columns by their unique
#'   identification number(s).
#' @param section_id \code{integer}. Filter columns to those containing
#'   section(s) as specified by their unique identification number(s).
#' @param unit_id \code{integer}. Filter columns to those containing unit(s) as
#'   specified by their unique identification number(s).
#' @param strat_name \code{character}. Filter columns to those containing a unit
#'   that fuzzy matches a stratigraphic name (e.g., "Hell Creek").
#' @param strat_name_id \code{integer}. Filter columns to those containing a
#'   unit that matches one or more stratigraphic name(s) as specified by their
#'   unique identification number(s).
#' @param interval_name \code{character}. Filter columns to those that overlap
#'   with a named chronostratigraphic time interval (e.g., "Permian").
#' @param interval_id \code{integer}. Filter columns to those that overlap with
#'   a chronostratigraphic time interval as specified by their unique
#'   identification number(s).
#' @param age \code{numeric}. Filter columns to those that overlap with the
#'   specified numerical age, in millions of years before present.
#' @param age_top \code{numeric}. Filter columns to those that overlap with the
#'   age range between the specified numerical age and `age_bottom`. Should be
#'   in millions of years before present. `age_bottom` must also be specified,
#'   and this must be younger than `age_bottom`.
#' @param age_bottom \code{numeric}. Filter columns to those that overlap with
#'   the age range between the specified numerical age and `age_top`. Should be
#'   in millions of years before present. `age_top` must also be specified, and
#'   this must be older than `age_top`.
#' @param lat \code{numeric}. Return the column at the specified decimal degree
#'   latitude. Must also specify `lng`.
#' @param lng \code{numeric}. Return the column at the specified decimal degree
#'   longitude. Must also specify `lat`.
#' @param lithology \code{character}. Filter columns to those containing a named
#'   lithology (e.g., "shale", "sandstone").
#' @param lithology_id \code{integer}. Filter columns to those containing one or
#'   more lithology(ies) identified by their unique identification number(s).
#' @param lithology_type \code{character}. Filter columns to those containing a
#'   named lithology type (e.g., "carbonate", "siliciclastic").
#' @param lithology_class \code{character}. Filter columns to those containing a
#'   named lithology class (e.g., "sedimentary", "igneous", "metamorphic").
#' @param lithology_att \code{character}. Filter columns to those containing a
#'   named lithology attribute (e.g., "fine", "olivine", "poorly washed").
#' @param lithology_att_id \code{integer}. Filter columns to those containing
#'   one or more lithology attribute(s) as specified by their unique
#'   identification number(s).
#' @param lithology_att_type \code{character}. Filter columns to those
#'   containing a named category of lithology attribute (e.g., "grains",
#'   "lithology", "bedform").
#' @param environ \code{character}. Filter columns to those containing a named
#'   environment (e.g., "delta plain", "pond").
#' @param environ_id \code{integer}. Filter columns to those containing one or
#'   more environment(s) as specified by their unique identification number(s).
#' @param environ_type \code{character}. Filter columns to those containing a
#'   named environment type (e.g., "fluvial", "eolian", "glacial").
#' @param environ_class \code{character}. Filter columns to those containing a
#'   named environment class (e.g., "marine", "non-marine").
#' @param pbdb_collection_no \code{integer}. Filter columns to those containing
#'   one or more Paleobiology Database collection(s) as specified by their
#'   unique identification number(s).
#' @param econ \code{character}. Filter columns to those containing a named
#'   economic attribute (e.g., "brick", "ground water", "gold").
#' @param econ_id \code{integer}. Filter columns to those containing one or more
#'   economic attribute(s) as specified by their unique identification
#'   number(s).
#' @param econ_type \code{character}. Filter columns to those containing a named
#'   economic attribute type (e.g., "construction", "aquifer", "mineral").
#' @param econ_class \code{character}. Filter columns to those containing a
#'   named economic attribute class (e.g., "material", "water", "precious
#'   commodity").
#' @param project_id \code{integer}. Filter columns to those contained within a
#'   Macrostrat project as specified by its unique identification number.
#' @param adjacents \code{logical}. If `column_id` or `lat`/`lng` is specified,
#'   should all columns that touch the specified column be returned? Defaults to
#'   `FALSE`.
#' @param sf \code{logical}. Should the results be returned as an `sf` object?
#'   Defaults to `FALSE`.
#' @return A \code{data.frame} containing the following columns:
#' \itemize{
#'   \item \code{col_id}: The unique identification number of the Macrostrat
#'     column.
#'   \item \code{col_name}: The name of the Macrostrat column.
#'   \item \code{col_group}: Name of the group the column belongs to. Generally
#'     corresponds to geologic provinces.
#'   \item \code{col_group_id}: The unique identification number of the group to
#'     which the column belongs.
#'   \item \code{group_col_id}: The original column ID assigned to the column
#'     (used in the original source).
#'   \item \code{lat}: Decimal degree latitude of the column centroid.
#'   \item \code{lng}: Decimal degree longitude of the column centroid.
#'   \item \code{col_area}: The area of the Macrostrat column in
#'     km\ifelse{html}{\out{<sup>2</sup>}}{\eqn{^2}}.
#'   \item \code{project_id}: The unique identification number for project.
#'     Corresponds to general geographic region.
#'   \item \code{col_type}: The type of column.
#'   \item \code{refs}: The unique identification number(s) for the reference(s)
#'     associated with the column.
#'   \item \code{max_thick}: The maximum unit thickness in meters.
#'   \item \code{max_min_thick}: The maximum possible minimum thickness in
#'     meters.
#'   \item \code{min_min_thick}: The minimum possible minimum thickness in
#'     meters.
#'   \item \code{b_age}: The age of the bottom of the column, estimated using
#'     the continuous time age model, in millions of years before present.
#'   \item \code{t_age}: The age of the top of the column, estimated using the
#'     continuous time age model, in millions of years before present.
#'   \item \code{b_int_name}: The name of the time interval represented at the
#'     bottom of the column.
#'   \item \code{t_int_name}: The name of the time interval represented at the
#'     top of the column.
#'   \item \code{pbdb_collections}: The number of PBDB collections contained
#'     within the column.
#'   \item \code{lith}: a \code{data.frame} containing the lithologies present
#'     within the column, with the following columns:
#'   \itemize{
#'      \item \code{name}: The named lithology (e.g., "sandstone").
#'      \item \code{type}: The named lithology type (e.g., "siliciclastic").
#'      \item \code{class}: The named lithology class (e.g., "sedimentary").
#'      \item \code{prop}: The proportion of the lithology within the column,
#'        calculated from the individual Macrostrat units within the column.
#'      \item \code{lith_id}: The unique identification number of the lithology.
#'   }}
#'   \itemize{
#'   \item \code{environ}: a \code{data.frame} containing the environments
#'     present within the column, with the following columns:
#'   \itemize{
#'      \item \code{name}: The named environment (e.g., "delta plain").
#'      \item \code{type}: The named environment type (e.g., "siliciclastic").
#'      \item \code{class}: The named environment class (e.g., "marine").
#'      \item \code{prop}: The proportion of the environment within the column,
#'        calculated from the individual Macrostrat units within the column.
#'      \item \code{environ_id}: The unique identification number of the
#'        environment.
#'   }}
#'   \itemize{
#'   \item \code{econ}: a \code{data.frame} containing the economic attributes
#'     present within the column, with the following columns:
#'   \itemize{
#'      \item \code{name}: The named economic attribute (e.g., "gold").
#'      \item \code{type}: The named economic attribute type (e.g., "mineral").
#'      \item \code{class}: The named economic attribute class (e.g., "precious
#'        commodity").
#'      \item \code{prop}: The proportion of the economic attribute out of
#'        all economic attributes contained within the column, calculated
#'        from the individual Macrostrat units within the column.
#'      \item \code{econ_id}: The unique identification number of the economic
#'        attribute.
#'   }
#'   \item \code{t_units}: The total number of units contained within the
#'     column.
#'   \item \code{t_sections}: The total number of sections contained within the
#'     column.
#' }
#'   If `sf` is `TRUE`, an `sf` object is returned instead, with the same
#'   columns plus a "geometry" column that contains the spatial data.
#' @section Developer(s):
#'   William Gearty
#' @section Reviewer(s):
#'   Christopher D. Dean
#' @details More information can be found for the inputs for this function using
#'   the definition functions (beginning with \code{def_}).
#' @examples
#' \donttest{
#' # Return columns that overlap with a named chronostratigraphic interval
#' ex1 <- get_columns(interval_name = "Permian")
#' # Return columns that overlap with a specified age range
#' ex2 <- get_columns(age_top = 200, age_bottom = 250)
#' # Return columns that contain a specific stratigraphic unit, in `sf` format
#' ex3 <- get_columns(strat_name = "mancos", sf = TRUE)
#' # Return the columns at a specific geographic coordinate
#' ex4 <- get_columns(lat = 43, lng = -89, adjacents = TRUE)
#' }
#' @export
#' @family macrostrat
get_columns <- function(
    column_id = NULL, section_id = NULL, unit_id = NULL,
    strat_name = NULL, strat_name_id = NULL,
    interval_name = NULL, interval_id = NULL,
    age = NULL, age_top = NULL, age_bottom = NULL, lat = NULL, lng = NULL,
    lithology = NULL, lithology_id = NULL, lithology_type = NULL,
    lithology_class = NULL,
    lithology_att = NULL, lithology_att_id = NULL, lithology_att_type = NULL,
    environ = NULL, environ_id = NULL,
    environ_type = NULL, environ_class = NULL, pbdb_collection_no = NULL,
    econ = NULL, econ_id = NULL, econ_type = NULL, econ_class = NULL,
    project_id = NULL, adjacents = FALSE, sf = FALSE) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    column_id = "integer", section_id = "integer", unit_id = "integer",
    strat_name = "character", strat_name_id = "integer",
    interval_name = "character", interval_id = "integer",
    age = "numeric", age_top = "numeric", age_bottom = "numeric",
    lat = "numeric", lng = "numeric",
    lithology = "character", lithology_id = "integer",
    lithology_type = "character", lithology_class = "character",
    lithology_att = "character", lithology_att_id = "integer",
    lithology_att_type = "character",
    environ = "character", environ_id = "integer", environ_type = "character",
    environ_class = "character", pbdb_collection_no = "integer",
    econ = "character", econ_id = "integer", econ_type = "character",
    econ_class = "character", project_id = "integer", adjacents = "logical",
    sf = "logical"
  )
  check_arguments(x = args, ref = ref)
  # Set default for format
  if (sf) format <- "geojson" else format <- "json"
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
  if (!is.null(lat) || !is.null(lng)) {
    if (is.null(lat) || is.null(lng)) {
      stop("`lat` and `lng` must both be specified to filter by an
           age range.")
    }
    if (lng >= 180 || lng <= -180) {
      stop("`lng` should be less than 180 and more than -180.")
    }
    if (lat >= 90 || lat <= -90) {
      stop("`lat` should be less than 90 and more than -90.")
    }
  }
  # Change arguments to default api names
  api_names <- c(column_id	= "col_id", interval_id = "int_id",
                 lithology = "lith", lithology_att = "lith_att",
                 lithology_att_id = "lith_att_id",
                 lithology_att_type = "lith_att_type",
                 lithology_class = "lith_class",
                 lithology_id = "lith_id", lithology_type = "lith_type",
                 pbdb_collection_no = "cltn_id")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))
  # Get request
  dat <- GET_macrostrat(endpoint = "columns", query = args, format = format)
  # Return data
  return(dat)
}
