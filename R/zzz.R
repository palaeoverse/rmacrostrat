#' API root (base URL)
root <- function() "https://macrostrat.org/"

#' Get API version
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET content
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
#' @importFrom readr read_csv
GET_macrostrat <- function(endpoint, query = list(), format = "json",
                           output = "df") {
  # Is Macrostrat and the user online?
  tryCatch(
    {
      nslookup("macrostrat.org")
    },
    error = function(e) {
      stop("Macrostrat is unavailable or you have no internet connection.")
    }
  )
  if (format == "geojson") format <- "geojson_bare"
  # Update query
  full_query <- c(query, format = format)
  full_query$response <- "long"
  # Build path route
  path <- paste0("api/", endpoint)
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
    suppressWarnings(dat <- read_csv(cont, show_col_types = FALSE))
    if (ncol(dat) == 1) {
      stop("Error when trying query. Check your request.")
    }
  } else if (format == "json") {
    lst <- fromJSON(cont)
    if ("error" %in% names(lst)) {
      stop("Error when trying query. Check your request.")
    }
    if (output == "df") {
      dat <- lst$success$data
    } else {
      dat <- lst$success
    }
  } else if (format == "geojson_bare") {
    lst <- fromJSON(cont)
    if ("error" %in% names(lst)) {
      stop("Error when trying query. Check your request.")
    }
    dat <- lst$features$properties
    dat$geometry <- geojson_sf(cont)$geometry
    dat <- st_sf(dat)
  }
  # Return data
  return(dat)
}
