get_grid <- function() {
  # Error handling

  # Get user request
  path <- "grids/"
  query <- c("latitude?lngSpacing=5&latSpacing=12&format=geojson_bare")
  dat <- fetch_macrostrat(path = path, query = scale, format = "geojson")
}
query <- c("latitude?lngSpacing=5&latSpacing=12&format=geojson_bare")
