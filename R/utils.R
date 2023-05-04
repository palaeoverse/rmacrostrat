#' Create functions (internal function)
#'
#' This function can be used to automatically setup functions for Macrostrat
#' endpoints.
#'
#' @param name \code{character}. The name of the function to be created (this
#'   will also be the file name).
#' @param args \code{character}. The names of the arguments to include in the
#'   function.
#' @param endpoint \code{character}. The API endpoint to fetch arguments from
#'   to include in the function.
#' @param fields \code{character}. The fields to include in the roxygen2
#'   documentation.
#' @param overwrite \code{logical}. Should pre-existing files of the same name
#' be overwritten? Defaults to `FALSE` (strongly advised).
#' @details Files are generated in the `./R/` directory using the provided
#' `name` as the file name.
#'
#' @return Nothing. Writes files of functions with desired arguments and
#'   roxygen2 fields as a side effect.
#' @importFrom utils file.edit
#' @importFrom sinew makeOxygen
#'
create_function <- function(name,
                            args = NULL,
                            endpoint = NULL,
                            fields = c("author", "details",
                                       "examples", "export"),
                            overwrite = FALSE) {
  # Set path for file generation
  path <- paste0("./R/", name, ".R")
  # Define arguments
  if (!is.null(args)) {
    # Use user-defined arguments
    args <- toString(args)
  } else if (!is.null(endpoint))  {
    # Get arguments from endpoint
    args <- params[[endpoint]]
    # Extract arguments
    args <- unlist(names(args))
    # Convert to string for writing lines
    args <- toString(args)
    # Replace text
    args <- gsub(pattern = ",", replacement = " = NULL,\n  ", x = args)
  } else {
    stop("Neither `endpoint` or `args` provided.")
  }
  # Check if file already exists
  if (file.exists(path) && !overwrite) {
    stop(paste0("'", path, "'", " already exists! ",
                "Change name, remove file or use `overwrite`."))
  } else {
    # Create file
    file.create(paste0("./R/", name, ".R"))
    # Create function
    func <- paste0(name, " <- function (\n   ",
                   args,
                   " = NULL) {\n\n",
                   "  # Error handling\n",
                   "  # Collect input arguments as a list\n",
                   "  args <- as.list(environment())\n",
                   "  # Check whether class of arguments is valid\n",
                   "  check_arguments(x = args, ref = 'INSERT ENDPOINT')\n\n",
                   "  # Get request\n",
                   "  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = 'INSERT FORMAT')\n\n",
                   "  # Return data\n",
                   "  return(dat)\n",
                   "}")
    # Write lines
    writeLines(text = func, con = path)
    # Source function
    source(path)
  }
  # Generate documentation
  writeLines(text = c(makeOxygen(
    obj = name,
    use_dictionary = paste0("./data-raw/dictionary", endpoint, ".R"),
    add_fields = fields,
    print = FALSE), func),
   con = path)
  # Message user
  message(paste0(name, " has been created!"))
  # Open file
  file.edit(path)
}

#' Check available options
#'
#' This function checks which options are available.
#'
#' @param x \code{character}. Which options should be checked? Choose from
#' "parameters", "output_formats", "examples", or "fields". If this argument
#' is set to `NULL` (default), all options are returned.
#' @param endpoint \code{character}. The endpoint that should be checked
#' such as "defs/timescales" or "columns".
#'
#' @return A \code{list} of available "parameters", "output_formats",
#' "examples", or "fields". If `x` and `endpoint` are set to `NULL`,
#' the base routes are returned.
get_options <- function(x = NULL, endpoint = NULL) {
  # Generate list
  args <- list(endpoint)
  # Remove NULL arguments
  args <- args[!sapply(args, is.null)]
  # Set path
  path <- do.call(paste, args)
  # Get content
  cont <- GET_macrostrat(endpoint = path)
  cont <- httr::content(cont)
  # Extract x if exists
  if (!is.null(x)) {
    dat <- cont$success$options[x]
  } else {
    dat <- cont$success$options
  }
  # Return routes if no matched content
  if (is.null(dat)) {
    dat <- cont$success$routes
  }
  return(dat)
}

#' Get available content
#'
#' This function checks whether the requested content is available. It can be
#' used to either return all available content for the requested variable or
#' to standardise the requested content.
#'
#' @param x \code{character}. The requested content value (e.g. "international
#'   ages").
#' @param endpoint \code{character}. The relevant Macrostrat API endpoint.
#' @param query \code{list}. The variable to extract from the returned
#'   object to check \code{x} against.
#' @param var \code{character}. The variable to filter the content by.
#' @param available \code{logical}. Should all available content be returned
#'   for the desired \code{query}?
#'
#' @details This function checks whether the requested content is available
#'   via Macrostrat. It can also be used to return a vector of all available
#'   content for the desired \code{query}.
#'
#' @return A \code{vector} of the available content or the matched \code{x}
#'   value.
get_available_content <- function(x = NULL, endpoint = NULL, query = NULL,
                                  var = NULL, available = TRUE) {
  # Is data available?
  content <- GET_macrostrat(endpoint = endpoint, query = query)
  content <- content[, var]
  # Return available content if requested
  if (available) {
    content <- unique(content)
    return(content)
  }
  # Match available content
  mch <- charmatch(x = x, table = content)
  # No match
  if (is.na(mch)) {
    stop(paste(
      x, "not found.",
      "Set `available` to TRUE to return available content."
    ))
  }
  # Use matched scale
  if (mch != 0) {
    x <- content[mch]
  }
  # Return content
  return(x)
}

#' Filters NULL arguments from a list
#'
#' This function checks whether any elements in a list are
#' NULL and removes them.
#'
#' @param x \code{list}. The user-query list
#'
#' @return A `NULL` filtered list of `x`.
filter_null <- function(x) {
  x <- x[!unlist(lapply(x, is.null))]
  return(x)
}

#' Check if arguments are valid (internal)
#'
#' This function checks whether user arguments are valid
#' in terms of being an available argument or of the correct
#' class.
#'
#' @param x \code{list}. The user-query list to compare against `ref`.
#' @param ref \code{list}. The reference list to compare `x` against.
#'
#' @return Error messages or \code{TRUE} if all arguments are valid.
check_arguments <- function(x, ref) {
  chk <- names(x) %in% names(ref)
  if (!all(chk)) {
    invalid <- toString(names(x)[!chk])
    stop("The following are not valid argument(s): ", invalid,
         ". \nSee function documentation.")
  }
  # Filter ref by matched arguments
  ref <- ref[names(ref) %in% names(x)]
  # reorder by ref
  x <- x[names(ref)]
  # Evaluate class
  chk <- unlist(lapply(x, class)) == unlist(ref)
  if (!all(chk)) {
    invalid <- toString(names(x)[!chk])
    invalid <- sapply(invalid, function(x) {
      message(paste0("`", x, "` should be of class ",
                     unlist(ref[x]), "."))
    })
    stop("Invalid class of argument(s).")
  }
  # Return TRUE if valid arguments
  return(TRUE)
}
