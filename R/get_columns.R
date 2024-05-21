#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param column_id \code{integer}. Filter columns by their unique identification number(s).
#' @param section_id \code{integer}. Filter columns to those containing section(s) as specified by their unique identification number(s).
#' @param unit_id \code{integer}. Filter columns to those containing unit(s) as specified by their unique identification number(s).
#' @param strat_name \code{character}. Filter columns to those containing a unit that fuzzy matches a stratigraphic name (e.g., "Hell Creek").
#' @param strat_name_id \code{integer}. Filter columns to those containing a unit that matches one or more stratigraphic name(s) as specified by their unique identification number(s).
#' @param interval_name \code{character}. Filter columns to those that overlap with a named chronostratigraphic time interval (e.g., "Permian").
#' @param interval_id \code{integer}. Filter columns to those that overlap with a chronostratigraphic time interval as specified by their unique identification number(s).
#' @param age \code{numeric}. Filter columns to those that overlap with the specified numerical age, in millions of years before present.
#' @param age_top \code{numeric}. Filter columns to those that overlap with the age range between the specified numerical age and `age_bottom`. Should be in millions of years before present. `age_bottom` must also be specified, and this must be younger than `age_bottom`.
#' @param age_bottom \code{numeric}. Filter columns to those that overlap with the age range between the specified numerical age and `age_top`. Should be in millions of years before present. `age_top` must also be specified, and this must be older than `age_top`.
#' @param lat \code{numeric}. Return the column at the specified decimal degree latitude. Must also specify `lng`.
#' @param lng \code{numeric}. Return the column at the specified decimal degree longitude. Must also specify `lat`.
#' @param lithology \code{character}. Filter columns to those containing a named lithology (e.g., "shale", "sandstone").
#' @param lithology_id \code{integer}. Filter columns to those containing one or more lithology(ies) identified by their unique identification number(s).
#' @param lithology_type \code{character}. Filter columns to those containing a named lithology type (e.g., "carbonate", "siliciclastic").
#' @param lithology_class \code{character}. Filter columns to those containing a named lithology class (e.g., "sedimentary", "igneous", "metamorphic").
#' @param lithology_att \code{character}. Filter columns to those containing a named lithology attribute (e.g., "fine", "olivine", "poorly washed").
#' @param lithology_att_id \code{integer}. Filter columns to those containing one or more lithology attribute(s) as specified by their unique identification number(s).
#' @param lithology_att_type \code{character}. Filter columns to those containing a named category of lithology attribute (e.g., "grains", "lithology", "bedform").
#' @param environ \code{character}. Filter columns to those containing a named environment (e.g., "delta plain", "pond").
#' @param environ_id \code{integer}. Filter columns to those containing one or more environment(s) as specified by their unique identification number(s).
#' @param environ_type \code{character}. Filter columns to those containing a named environment type (e.g., "fluvial", "eolian", "glacial").
#' @param environ_class \code{character}. Filter columns to those containing a named environment class (e.g., "marine", "non-marine").
#' @param pbdb_collection_no \code{integer}. Filter columns to those containing one or more Paleobiology Database collection(s) as specified by their unique identification number(s).
#' @param econ \code{character}. Filter columns to those containing a named economic attribute (e.g., "brick", "ground water", "gold").
#' @param econ_id \code{integer}. Filter columns to those containing one or more economic attribute(s) as specified by their unique identification number(s).
#' @param econ_type \code{character}. Filter columns to those containing a named economic attribute type (e.g., "construction", "aquifer", "mineral").
#' @param econ_class \code{character}. Filter columns to those containing a named economic attribute class (e.g., "material", "water", "precious commodity").
#' @param project_id \code{integer}. Filter columns to those contained within a Macrostrat project as specified by its unique identification number.
#' @param adjacents \code{logical}. If `column_id` or `lat`/`lng` is specified, should all columns that touch the specified column be returned? Defaults to `FALSE`.
#' @param sf \code{logical}. Should the results be returned as an `sf` object? Defaults to `FALSE`.
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

get_columns <- function (
   column_id = NULL,
   section_id = NULL,
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
   lithology_type = NULL,
   lithology_class = NULL,
   lithology_att = NULL,
   lithology_att_id = NULL,
   lithology_att_type = NULL,
   environ = NULL,
   environ_id = NULL,
   environ_type = NULL,
   environ_class = NULL,
   pbdb_collection_no = NULL,
   econ = NULL,
   econ_id = NULL,
   econ_type = NULL,
   econ_class = NULL,
   project_id = NULL,
   adjacents = NULL,
   sf = NULL) {

  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    column_id = 'integer', 
    section_id = 'integer', 
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
    lithology_type = 'character', 
    lithology_class = 'character', 
    lithology_att = 'character', 
    lithology_att_id = 'integer', 
    lithology_att_type = 'character', 
    environ = 'character', 
    environ_id = 'integer', 
    environ_type = 'character', 
    environ_class = 'character', 
    pbdb_collection_no = 'integer', 
    econ = 'character', 
    econ_id = 'integer', 
    econ_type = 'character', 
    econ_class = 'character', 
    project_id = 'integer', 
    adjacents = 'logical', 
    sf = 'logical')
  check_arguments(x = args, ref = ref)
  # Set default for format
  format <- 'json'
  # Get request
  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)

  # Return data
  return(dat)
}

