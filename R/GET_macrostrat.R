#' Fetch data from Macrostrat
#'
#' This function fetches data from [Macrostrat](https://macrostrat.org)
#' via the Application Programming Interface (API). This is the core
#' function for handling user requests.
#'
#' @return User requested data, either a \code{data.frame} or...
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET content
#' @importFrom curl nslookup
#' @importFrom geojsonsf geojson_sf
GET_macrostrat <- function(path, query = NULL, format = "csv", ...) {
  # Is Macrostrat and user online?
  tryCatch(
    {
      nslookup("macrostrat.org")
    },
    error = function(e) {
      stop("Macrostrat is unavailable or you have no internet connection.")
    })
  # Build url
  request <- paste0(root(), api_ver(), path, query)
  request <- gsub(" ", "%20", request)
  # Fetch data
  dat <- GET(url = request)
  # Extract content
  if (format == "csv") {
    dat <- data.frame(content(dat, as = "parsed", encoding = "UTF-8",
                              show_col_types = FALSE))
  } else if (format == "json") {
    dat <- content(dat, as = "text", encoding = "UTF-8")
    dat <- fromJSON(dat)
  } else if (format == "geojson") {
    dat <- content(dat, as = "parsed", encoding = "UTF-8")
    dat <- geojson_sf(dat)
  }
  # Return data
  return(dat)
}
