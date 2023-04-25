#' API root (base URL)
root <- function() "https://macrostrat.org/"

#' Get API version
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET content
api_ver <- function() {
  ver <- GET(url = root(), path = "api")
  ver <- content(ver, as = "text", encoding = "UTF-8")
  ver <- fromJSON(ver)$success$v
  ver <- paste0("/api/v", ver, "/")
  return(ver)
}

#' Fetch data from Macrostrat
#'
#' This function fetches data from [Macrostrat](https://macrostrat.org)
#' via the Application Programming Interface (API). This is the core
#' function for handling user requests.
#'
#' @param path \code{character}. The API path to retrieve data from
#' Macrostrat.
#' @param query \code{character}. The API query to retreive data from
#' Macrostrat.
#'
#' @return A \code{data.frame} of user-requested data.
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET content http_error
#' @importFrom curl nslookup
#' @importFrom readr read_csv
GET_macrostrat <- function(path, query = list()) {
  # Is Macrostrat and the user online?
  tryCatch(
    {
      nslookup("macrostrat.org")
    },
    error = function(e) {
      stop("Macrostrat is unavailable or you have no internet connection.")
    }
  )
  # Build path route
  path <- paste0(api_ver(), path)
  # Fetch data
  dat <- GET(
    url = root(), path = path,
    query = query
  )
  # Check for error
  e <- http_error(dat)
  if (e) {
    stop("Content not found. Check your request.")
  }
  # Extract content
  if (query["format"] == "csv") {
    dat <- data.frame(content(dat,
      as = "parsed", encoding = "UTF-8",
      show_col_types = FALSE
    ))
  } else if (query["format"] == "json") {
    dat <- content(dat, as = "text", encoding = "UTF-8")
    dat <- fromJSON(dat)
  }
  # Return data
  return(dat)
}