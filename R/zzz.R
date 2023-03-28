# API root
root <- function() "https://macrostrat.org/api/"

# API version
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET content
api_ver <- function() {
  ver <- GET(url = root())
  ver <- content(ver, as = "text", encoding = "UTF-8")
  ver <- fromJSON(ver)$success$v
  ver <- paste0("v", ver, "/")
  return(ver)
}
