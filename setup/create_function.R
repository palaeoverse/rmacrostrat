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
    # Refs
    ref <- toString(paste0("\n    ", names(rmacrostrat:::params[[endpoint]]),
                           " = ",
                           paste0("'", rmacrostrat:::params[[endpoint]], "'")))
    # Create function
    func <- paste0(name, " <- function (\n   ",
                   args,
                   " = NULL) {\n\n",
                   "  # Error handling\n",
                   "  # Collect input arguments as a list\n",
                   "  args <- as.list(environment())\n",
                   "  # Check whether class of arguments is valid\n",
                   "  ref <- list(", ref, ")\n",
                   "  check_arguments(x = args, ref = ref)\n",
                   "  # Set default for format\n",
                   "  format <- 'json'\n",
                   "  # Get request\n",
                   "  dat <- GET_macrostrat(endpoint = 'INSERT ENDPOINT', query = args, format = format)\n\n",
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
