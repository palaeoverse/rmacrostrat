#' @title Retrieve collections from the Paleobiology Database
#'
#' @description A function to retrieve collections from the [Paleobiology
#' Database](https://paleobiodb.org/#/) (PBDB), matched to Macrostrat units.
#'
#' @param unit_id \code{integer}. Filter PBDB collections to those within one or
#'   more unit(s) as specified by their unique identification number(s).
#' @param column_id \code{integer}. Filter PBDB collections to those within one
#'   or more column(s) as specified by their unique identification number(s).
#' @param interval_name \code{character}. Filter PBDB collections to those that
#'   overlap with a named chronostratigraphic time interval (e.g., "Permian").
#' @param age \code{numeric}. Filter PBDB collections to those that overlap with
#'   the specified numerical age, in millions of years before present.
#' @param age_top \code{numeric}. Filter PBDB collections to those that overlap
#'   with the age range between the specified numerical age and `age_bottom`.
#'   Should be in millions of years before present. `age_bottom` must also be
#'   specified, and this must be older than `age_top`.
#' @param age_bottom \code{numeric}. Filter PBDB collections to those that
#'   overlap with the age range between the specified numerical age and
#'   `age_top`. Should be in millions of years before present. `age_top` must
#'   also be specified, and this must be younger than `age_bottom`.
#' @param lithology \code{character}. Filter PBDB collections to those
#'   containing a named lithology (e.g., "shale", "sandstone").
#' @param lithology_id \code{integer}. Filter PBDB collections to those
#'   containing one or more lithology(ies) identified by their unique
#'   identification number(s).
#' @param lithology_type \code{character}. Filter PBDB collections to those
#'   containing a named lithology type (e.g., "carbonate", "siliciclastic").
#' @param lithology_class \code{character}. Filter PBDB collections to those
#'   containing a named lithology class (e.g., "sedimentary", "igneous",
#'   "metamorphic").
#' @param environ \code{character}. Filter PBDB collections to those containing
#'   a named environment (e.g., "delta plain", "pond").
#' @param environ_id \code{integer}. Filter PBDB collections to those containing
#'   one or more environment(s) as specified by their unique identification
#'   number(s).
#' @param environ_type \code{character}. Filter PBDB collections to those
#'   containing a named environment type (e.g., "fluvial", "eolian", "glacial").
#' @param environ_class \code{character}. Filter PBDB collections to those
#'   containing a named environment class (e.g., "marine", "non-marine").
#' @param econ \code{character}. Filter PBDB collections to those containing a
#'   named economic attribute (e.g., "brick", "ground water", "gold").
#' @param econ_id \code{integer}. Filter PBDB collections to those containing
#'   one or more economic attribute(s) as specified by their unique
#'   identification number(s).
#' @param econ_type \code{character}. Filter PBDB collections to those
#'   containing a named economic attribute type (e.g., "construction",
#'   "aquifer", "mineral").
#' @param econ_class \code{character}. Filter PBDB collections to those
#'   containing a named economic attribute class (e.g., "material", "water",
#'   "precious commodity").
#' @param project_id \code{integer}. Filter sections to those contained within a
#'   Macrostrat project as specified by its unique identification number.
#' @param strat_name_id \code{integer}. Filter PBDB collections to those
#'   containing a unit that matches one or more stratigraphic name(s) as
#'   specified by their unique identification number(s).
#' @param sf \code{logical}. Should the results be returned as an `sf` object?
#'   Defaults to `FALSE`.
#' @return A \code{dataframe} containing the following columns:
#' \itemize{
#'   \item \code{collection_no}: The unique identification number of the
#'   collection, as assigned in the PBDB.
#'   \item \code{collection_name}: The unique name of the collection, as
#'   assigned in the PBDB.
#'   \item \code{t_age}: The top age of the unit containing the collection,
#'   estimated using the continuous time age model, in millions of years before
#'   present.
#'   \item \code{b_age}: The bottom age of the unit containing the collection,
#'   estimated using the continuous time age model, in millions of years before
#'   present.
#'   \item \code{pbdb_occs}: The count of PBDB occurrences in the specified
#'   PBDB collection.
#'   \item \code{genus_no}: A vector containing the unique identification number
#'   for each genus that appears in the collection, corresponding to the
#'   genus_no column in the Paleobiology Database.
#'   \item \code{taxon_no}: The count of unique taxa in the specified PBDB
#'   collection.
#'   \item \code{unit_id}: The unique identification number of the Macrostrat
#'   unit containing the specified PBDB collection.
#'   \item \code{col_id}: The unique identification number of the Macrostrat
#'   column containing the specified PBDB collection.
#'   \item \code{refs}: Reference for the source of the data.
#'   \item \code{strat_name_concept_id}: The unique identification number of the
#'   stratigraphic name concept containing the specified PBDB collection.
#'   }
#'   If \code{sf = TRUE}, an `sf` object is returned instead.
#' @section Developer(s):
#'  Christopher D. Dean
#' @section Reviewer(s):
#'  Lewis A. Jones
#'
#' @details More information can be found for the inputs for this function
#' using the definition functions (beginning with \code{def_}). Terminology
#' related to the PBDB can be found at \url{https://paleobiodb.org/#/} or in
#' the suggested references below.
#'
#' @section References:
#' Peters, S.E. and McClennen, M. (2016). The Paleobiology Database
#' application programming interface. *Paleobiology*, 42(1), pp. 1--7.
#' \doi{10.1017/pab.2015.39}.
#'
#' Uhen, M.D., Allen, B., Behboudi, N., Clapham, M.E., Dunne, E., Hendy, A.,
#' Holroyd, P.A., Hopkins, M., Mannion, P., Novack-Gottshall, P. and Pimiento,
#' C. (2023). Paleobiology Database User Guide Version 1.0. *PaleoBios*,
#' 40(11), pp. 1--56. \doi{10.5070/P9401160531}.
#'
#' @examples
#' \donttest{
#'  # Get fossils by Macrostrat column ID
#'  ex1 <- get_fossils(column_id = 10)
#'  # Get fossils by Macrostrat unit ID
#'  ex2 <- get_fossils(unit_id = 6279)
#'  # Get fossils by lithology and age
#'  ex3 <- get_fossils(lithology = "sandstone", age_top = 66, age_bottom = 73)
#'  # Get fossils by environment type and age
#'  ex4 <- get_fossils(environ_type = "fluvial", age =  253)
#' }
#' @export
#' @family external
get_fossils <- function(unit_id = NULL, column_id = NULL,
                        interval_name = NULL, age = NULL,
                        age_top = NULL, age_bottom = NULL,
                        lithology = NULL, lithology_id = NULL,
                        lithology_type = NULL, lithology_class = NULL,
                        environ = NULL, environ_id = NULL,
                        environ_type = NULL, environ_class = NULL,
                        econ = NULL, econ_id = NULL,
                        econ_type = NULL, econ_class = NULL,
                        project_id = NULL, strat_name_id = NULL,
                        sf = FALSE) {
  # Error handling
  # Collect input arguments as a list
  args <- as.list(environment())
  # Check whether class of arguments is valid
  ref <- list(
    unit_id = "integer",
    column_id = "integer",
    interval_name = "character",
    age = "numeric",
    age_top = "numeric",
    age_bottom = "numeric",
    lithology = "character",
    lithology_id = "integer",
    lithology_type = "character",
    lithology_class = "character",
    environ = "character",
    environ_id = "integer",
    environ_type = "character",
    environ_class = "character",
    econ = "character",
    econ_id = "integer",
    econ_type = "character",
    econ_class = "character",
    project_id = "integer",
    strat_name_id = "integer",
    sf = "logical"
  )
  check_arguments(x = args, ref = ref)
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
  # Recode names
  api_names <- list(column_id = "col_id",
                    lithology = "lith",
                    lithology_class = "lith_class",
                    lithology_id = "lith_id",
                    lithology_type = "lith_type")
  # Match names
  rpl <- match(x = names(api_names), table = names(args))
  # Replace names
  names(args)[rpl] <- as.vector(unlist(api_names))
  # Set default for format
  if (sf == TRUE) { format <- "geojson"} else { format <- "json" }
  # Get request
  dat <- GET_macrostrat(endpoint = "fossils", query = args, format = format)
  # Change column names to match PBDB
  names(dat)[names(dat) == "cltn_id"] <- "collection_no"
  names(dat)[names(dat) == "cltn_name"] <- "collection_name"
  # Return data
  return(dat)
}
