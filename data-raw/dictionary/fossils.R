#' @param unit_id \code{integer}. The unique identification number(s) of the unit(s) to filter PBDB collections by.
#' @param col_id \code{integer}. The unique identification number(s) of the columns(s) to filter PBDB collections by.
#' @param interval_name \code{character}. Return PBDB collections matching a chronostratigraphic time interval name (i.e. intervals returned by `macrostrat_intervals`).
#' @param age \code{numeric}. Return PBDB collections that overlap this numerical age in millions of years before present.
#' @param age_top \code{numeric}. Return PBDB collections that overlap with the age range between this and age_bottom. Should be in millions of years before present and less than age_bottom.
#' @param age_bottom \code{numeric}. Return PBDB collections that overlap with the age range between this and age_top. Should be in millions of years before present and greater than age_top.
#' @param lith \code{character}. Return PBDB collections associated with a named lithology (e.g., shale, sandstone).
#' @param lith_id \code{integer}. Return PBDB collections associated with a lithology identified by its unique identification number.
#' @param lith_type \code{character}. Return PBDB collections associated with a named lithology type (e.g., carbonate, siliciclastic).
#' @param lith_class \code{character}. Return PBDB collections associated with a named lithology class (e.g., sedimentary, igneous, metamorphic).
#' @param environ \code{character}. Return PBDB collections associated with a named environment.
#' @param environ_id \code{integer}. Return PBDB collections associated with an environment identified by its unique identification number.
#' @param environ_type \code{character}. Return PBDB collections associated with a named type of environment.
#' @param environ_class \code{character}. Return PBDB collections associated with a named class of environment.
#' @param econ \code{character}. Return PBDB collections associated with a named economic attribute.
#' @param econ_id \code{integer}. Return PBDB collections associated with an economic attribute identified by its unique identification number.
#' @param econ_type \code{character}. Return PBDB collections associated with a named economic attribute type.
#' @param econ_class \code{character}. Return PBDB collections associated with a named economic attribute class.
#' @param project_id \code{integer}. Return PBDB collections associated with a Macrostrat project identified by its unique identification number.
#' @param strat_name_id \code{integer}. Return PBDB collections associated with a single or comma-separated list of stratigraphic IDs.
#' @param strat_name_concept_id \code{integer}. Return PBDB collections associated with a single or comma-separated list of stratigraphic name concept IDs.
#' @param sf \code{logical}. Should the results be returned as an `sf` object (defaults to `TRUE`)? If `FALSE`, a `data.frame` is returned.
