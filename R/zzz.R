#' API root (base URL)
#' @keywords internal
root <- function() "https://macrostrat.org/"

#' Get API version
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET content
#' @keywords internal
api_version <- function() {
  res <- GET(url = root(), path = "api")
  cont <- content(res, as = "text", encoding = "UTF-8")
  ver <- fromJSON(cont)$success$v
  return(ver)
}

#' Fetch data from Macrostrat
#'
#' This function fetches data from [Macrostrat](https://macrostrat.org) via the
#' Application Programming Interface (API). This is the core function for
#' handling user requests.
#'
#' @param endpoint \code{character}. The API endpoint to retrieve data from
#'   Macrostrat.
#' @param query \code{character}. The API query to retrieve data from
#'   Macrostrat.
#' @param format \code{character}. The format that data should be downloaded in.
#'   Either: "csv", "json" (the default), or "geojson".
#' @param output \code{character}. If \code{format} is "json", what format
#'   should the output be in? Valid options are "list" (the default) or "df"
#'   (data.frame). If "df" is chosen, all metadata will be lost.
#'
#' @return A \code{data.frame} (if \code{format} is "csv" or "json" and \code{output} is "df"), a \code{list} (if \code{format} is "json" and \code{output} is "list"), or
#'   \code{sf} object (if \code{format} is "geojson").
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET content http_error
#' @importFrom curl nslookup
#' @importFrom geojsonsf geojson_sf
#' @importFrom sf st_sf
#' @importFrom utils read.csv
#' @keywords internal
GET_macrostrat <- function(endpoint, query = list(), format = "json",
                           output = "df") {
  # Remove NULL arguments
  query_clean <- filter_args(query)
  # Is Macrostrat and the user online?
  tryCatch(
    {
      nslookup("macrostrat.org")
    },
    error = function(e) {
      stop("Macrostrat is unavailable or you have no internet connection.",
           call. = FALSE)
    }
  )
  if (format == "geojson") format <- "geojson_bare"
  # Update query
  full_query <- c(query_clean, format = format)
  full_query$response <- "long"
  # Switch vectors to comma-separated strings and booleans to strings
  full_query <- lapply(full_query, function(x) {
    if (length(x) > 1) {
      return(paste0(x, collapse = ","))
    } else if (is.logical(x)) {
      return(tolower(x))
    }
    return(x)
  })
  # Build path route
  path <- paste0("api/v2/", endpoint)
  # Fetch data
  res <- GET(url = root(), path = path, query = full_query)
  # Check for error
  e <- http_error(res)
  if (e) {
    stop("Content not found. Check your request.")
  }
  # Extract content
  cont <- content(res, as = "text", encoding = "UTF-8")
  if (format == "csv") {
    suppressWarnings(dat <- read.csv(text = cont))
    if (ncol(dat) == 1) {
      stop("Error when trying query. Check your request.", call. = FALSE)
    }
  } else if (format == "json") {
    lst <- fromJSON(cont)
    if ("error" %in% names(lst)) {
      stop(paste("Error when trying query. Error message from the Macrostrat",
                 "API:", lst$error$message),
           call. = FALSE)
    }
    if (output == "df") {
      dat <- lst$success$data
    } else {
      dat <- lst$success
    }
  } else if (format == "geojson_bare") {
    lst <- fromJSON(cont)
    if ("error" %in% names(lst)) {
      stop(paste("Error when trying query. Error message from the Macrostrat",
                 "API:", lst$error$message),
           call. = FALSE)
    }
    dat <- lst$features$properties
    dat$geometry <- geojson_sf(cont)$geometry
    dat <- st_sf(dat)
  }
  if ((is.list(dat) && length(dat) == 0) ||
      (is.data.frame(dat) && nrow(dat) == 0)) {
    warning("No results returned for query.", call. = FALSE)
  }
  # Return data
  return(dat)
}
