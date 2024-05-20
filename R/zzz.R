#' API root (base URL)
root <- function() "https://macrostrat.org/"

#' Get API version
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET content
api_ver <- function() {
  res <- GET(url = root(), path = "api")
  cont <- content(res, as = "text", encoding = "UTF-8")
  ver <- fromJSON(cont)$success$v
  ver <- paste0("/api/v", ver, "/")
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
#'   Either: "csv", "json", or "geojson".
#' @param output \code{character}. If \code{format} is "json", what format
#'   should the output be in? Valid options are "list" (the default) or "df"
#'   (data.frame). If "df" is chosen, all metadata will be lost.
#'
#' @return A \code{data.frame} (if \code{format} is "csv" or "json") or
#'   \code{sf} object (if \code{format} is "geo) of user-requested data.
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET content http_error
#' @importFrom curl nslookup
#' @importFrom readr read_csv
#' @importFrom geojsonsf geojson_sf
GET_macrostrat <- function(endpoint, query = list(), format = "csv",
                           output = "list") {
  # Is Macrostrat and the user online?
  tryCatch(
    {
      nslookup("macrostrat.org")
    },
    error = function(e) {
      stop("Macrostrat is unavailable or you have no internet connection.")
    }
  )
  # Add format to query
  query <- c(query, format = format)
  # Build path route
  path <- paste0("api/", endpoint)
  # Fetch data
  res <- GET(url = root(), path = path, query = query)
  # Check for error
  e <- http_error(res)
  if (e) {
    stop("Content not found. Check your request.")
  }
  # Extract content
  if (query["format"] == "csv") {
    dat <- data.frame(content(res,
      as = "parsed", encoding = "UTF-8",
      show_col_types = FALSE
    ))
  } else if (query["format"] == "json") {
    cont <- content(res, as = "text", encoding = "UTF-8")
    dat <- fromJSON(cont)$success
    if (output == "df") {
      dat <- as.data.frame(dat$success$data)
    }
  } else if (query["format"] == "geojson") {
    cont <- content(res, as = "text", encoding = "UTF-8")
    dat <- geojson_sf(cont)
  }
  # Return data
  return(dat)
}
