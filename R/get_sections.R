#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param section_id \code{integer}. Filter sections by their unique identification number(s)., Default: NULL
#' @param column_id \code{integer}. Filter sections to those contained within column(s) as specified by their unique identification number(s)., Default: NULL
#' @param unit_id \code{integer}. Filter sections to those containing unit(s) as specified by their unique identification number(s)., Default: NULL
#' @param strat_name \code{character}. Filter sections to those containing a unit that fuzzy matches a stratigraphic name (e.g., "Hell Creek")., Default: NULL
#' @param strat_name_id \code{integer}. Filter sections to those containing a unit that matches one or more stratigraphic name(s) as specified by their unique identification number(s)., Default: NULL
#' @param interval_name \code{character}. Filter sections to those that overlap with a named chronostratigraphic time interval (e.g., "Permian")., Default: NULL
#' @param interval_id \code{integer}. Filter sections to those that overlap with a chronostratigraphic time interval as specified by their unique identification number(s)., Default: NULL
#' @param age \code{numeric}. Filter sections to those that overlap with the specified numerical age, in millions of years before present., Default: NULL
#' @param age_top \code{numeric}. Filter sections to those that overlap with the age range between the specified numerical age and `age_bottom`. Should be in millions of years before present. `age_bottom` must also be specified, and this must be younger than `age_bottom`., Default: NULL
#' @param age_bottom \code{numeric}. Filter sections to those that overlap with the age range between the specified numerical age and `age_top`. Should be in millions of years before present. `age_top` must also be specified, and this must be older than `age_top`., Default: NULL
#' @param lat \code{numeric}. Return the sections at the specified decimal degree latitude. Must also specify `lng`., Default: NULL
#' @param lng \code{numeric}. Return the sections at the specified decimal degree longitude. Must also specify `lat`., Default: NULL
#' @param lithology \code{character}. Filter sections to those containing one or more lithology(ies) (e.g., "shale", "sandstone")., Default: NULL
#' @param lithology_id \code{integer}. Filter sections to those containing one or more lithology(ies) identified by their unique identification number(s)., Default: NULL
#' @param lithology_group \code{character}. Filter sections to those containing a named lithology group (e.g., "sandstones", "mudrocks", "unconsolidated")., Default: NULL
#' @param lithology_type \code{character}. Filter sections to those containing a named lithology type (e.g., "carbonate", "siliciclastic")., Default: NULL
#' @param lithology_class \code{character}. Filter sections to those containing a named lithology class (e.g., "sedimentary", "igneous", "metamorphic")., Default: NULL
#' @param lithology_att \code{character}. Filter sections to those containing a named lithology attribute (e.g., "fine", "olivine", "poorly washed")., Default: NULL
#' @param lithology_att_id \code{integer}. Filter sections to those containing one or more lithology attribute(s) as specified by their unique identification number(s)., Default: NULL
#' @param lithology_att_type \code{character}. Filter sections to those containing a named category of lithology attribute (e.g., "grains", "lithology", "bedform")., Default: NULL
#' @param environ \code{character}. Filter sections to those containing a named environment (e.g., "delta plain", "pond")., Default: NULL
#' @param environ_id \code{integer}. Filter sections to those containing one or more environment(s) as specified by their unique identification number(s)., Default: NULL
#' @param environ_type \code{character}. Filter sections to those containing a named environment type (e.g., "fluvial", "eolian", "glacial")., Default: NULL
#' @param environ_class \code{character}. Filter sections to those containing a named environment class (e.g., "marine", "non-marine")., Default: NULL
#' @param econ \code{character}. Filter sections to those containing a named economic attribute (e.g., "brick", "ground water", "gold")., Default: NULL
#' @param econ_id \code{integer}. Filter sections to those containing one or more economic attribute(s) as specified by their unique identification number(s)., Default: NULL
#' @param econ_type \code{character}. Filter sections to those containing a named economic attribute type (e.g., "construction", "aquifer", "mineral")., Default: NULL
#' @param econ_class \code{character}. Filter sections to those containing a named economic attribute class (e.g., "material", "water", "precious commodity")., Default: NULL
#' @param pbdb_collection_no \code{integer}. Filter sections to those containing one or more Paleobiology Database collection(s) as specified by their unique identification number(s)., Default: NULL
#' @param project_id \code{integer}. Filter sections to those contained within a Macrostrat project as specified by its unique identification number., Default: NULL
#' @param adjacents \code{logical}. If `column_id` or `lat`/`lng` is specified, should all sections that touch the specified column be returned? Defaults to `FALSE`., Default: NULL
#' @return OUTPUT_DESCRIPTION
#' @author AUTHOR [AUTHOR_2]
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @export 

get_sections <- function (
   section_id = NULL,
   column_id = NULL,
   unit_id = NULL,
   strat_name = NULL,
   strat_name_id = NULL,
   interval_name = NULL,
   interval_id = NULL,
   age = NULL,
   age_top = NULL,
   age_bottom = NULL,
   lat = NULL,
   lng = NULL,
   lithology = NULL,
   lithology_id = NULL,
   lithology_group = NULL,
   lithology_type = NULL,
   lithology_class = NULL,
   lithology_att = NULL,
   lithology_att_id = NULL,
   lithology_att_type = NULL,
   environ = NULL,
   environ_id = NULL,
   environ_type = NULL,
   environ_class = NULL,
   econ = NULL,
   econ_id = NULL,
   econ_type = NULL,
   econ_class = NULL,
   pbdb_collection_no = NULL,
   project_id = NULL,
   adjacents = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    section_id = 'integer', 
    column_id = 'integer', 
    unit_id = 'integer', 
    strat_name = 'character', 
    strat_name_id = 'integer', 
    interval_name = 'character', 
    interval_id = 'integer', 
    age = 'numeric', 
    age_top = 'numeric', 
    age_bottom = 'numeric', 
    lat = 'numeric', 
    lng = 'numeric', 
    lithology = 'character', 
    lithology_id = 'integer', 
    lithology_group = 'character', 
    lithology_type = 'character', 
    lithology_class = 'character', 
    lithology_att = 'character', 
    lithology_att_id = 'integer', 
    lithology_att_type = 'character', 
    environ = 'character', 
    environ_id = 'integer', 
    environ_type = 'character', 
    environ_class = 'character', 
    econ = 'character', 
    econ_id = 'integer', 
    econ_type = 'character', 
    econ_class = 'character', 
    pbdb_collection_no = 'integer', 
    project_id = 'integer', 
    adjacents = 'logical')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- c('json')
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

