#' Fetch data from Macrostrat
#' 
#' This function fetches data from [Macrostrat](https://macrostrat.org)
#' via the Application Programming Interface (API). This is the core
#' function for handling user requests.
#' 
#' @return User requested data, either a:
#'    \item{data.frame}{}
#'    \item{rast}{}
#' 
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET content
#' @importFrom curl nslookup
#' 
#' @examples
#' path <- "defs/intervals?format=csv&timescale="
#' query <- "International Periods"
#' fetch_macrostrat(path = path, query = query, format = "csv")
#' @export
fetch_macrostrat <- function(path, query = NULL, format = "csv", ...) {
  # Define root of API
  root <- "https://macrostrat.org/api/"
  # Is Macrostrat and user online?
  tryCatch(
    {
      nslookup("macrostrat.org")
    },
    error = function(e) {
      stop("Macrostrat is unavailable or you have no internet connection.")
    })
  # Build url
  request <- paste0(root, path, query)
  request <- gsub(" ", "%20", request)
  # Fetch data
  dat <- GET(url = request)
  # Extract content
  if (format == "csv") {
    dat <- data.frame(content(dat, as = "parsed", encoding = "UTF-8",
                              show_col_types = FALSE))
  }
  else if (format == "json") {
    dat <- content(dat, as = "text", encoding = "UTF-8")
    dat <- fromJSON(dat)
  }
  # Return data
  return(dat)
}
