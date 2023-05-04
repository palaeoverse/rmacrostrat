# This script is for scraping the API for all arguments (parameters)
# in order to make a dictionary of available parameters
library(devtools)
load_all()
# Get all first-level routes
routes <- names(get_options())
params <- lapply(routes, function(x) get_options(x = "parameters", endpoint = x))
# Add names
names(params) <- routes
# Remove routes without parameters
sub_routes <- unlist(lapply(params, function(x) unique(names(x) == "parameters")))
# Retain first-level routes with parameters
params <- params[sub_routes]
routes <- names(params)
# Extract arguments
params <- lapply(routes, function(x) {
  sub_list <- params[[x]]
  endpoint <- x
  argument <- names(unlist(sub_list[[1]]))
  definition <- as.character(unlist(sub_list[[1]]))
  formats <- unlist(get_options(x = "output_formats", endpoint = x))
  # Check if sf required
  if ("geojson" %in% formats) {
    argument <- append(argument, "sf")
    definition <- append(definition, paste0(
      "Should the results be returned as an `sf` object (defaults to TRUE)?",
      "If `FALSE`, a `data.frame` is returned."))
  }
  url <- rep(paste0("https://macrostrat.org/api", endpoint), length(argument))
  cbind.data.frame(endpoint, argument, definition, url)
})
definitions <- do.call(rbind.data.frame, params)

# The following routes have subroutes so need to be scraped at this level
# Defs
routes <- names(get_options(endpoint = "defs"))
params <- lapply(routes, function(x) {
  p <- get_options(x = "parameters", endpoint = x)
  endpoint <- x
  argument <- names(unlist(p[[1]]))
  definition <- as.character(unlist(p[[1]]))
  formats <- unlist(get_options(x = "output_formats", endpoint = x))
  # Check if sf required
  if ("geojson" %in% formats) {
    argument <- append(argument, "sf")
    definition <- append(definition, paste0(
      "Should the results be returned as an `sf` object (defaults to TRUE)?",
      "If `FALSE`, a `data.frame` is returned."))
  }
  url <- rep(paste0("https://macrostrat.org/api", endpoint), length(argument))
  cbind.data.frame(endpoint, argument, definition, url)
})
defs <- do.call(rbind.data.frame, params)

# Carto
routes <- names(get_options(endpoint = "carto"))
params <- lapply(routes, function(x) {
  p <- get_options(x = "parameters", endpoint = x)
  endpoint <- x
  argument <- names(unlist(p[[1]]))
  definition <- as.character(unlist(p[[1]]))
  formats <- unlist(get_options(x = "output_formats", endpoint = x))
  # Check if sf required
  if ("geojson" %in% formats) {
    argument <- append(argument, "sf")
    definition <- append(definition, paste0(
      "Should the results be returned as an `sf` object (defaults to TRUE)?",
      "If `FALSE`, a `data.frame` is returned."))
  }
  url <- rep(paste0("https://macrostrat.org/api", endpoint), length(argument))
  cbind.data.frame(endpoint, argument, definition, url)
})
carto <- do.call(rbind.data.frame, params)

# Grids
routes <- names(get_options(endpoint = "grids"))
params <- lapply(routes, function(x) {
  p <- get_options(x = "parameters", endpoint = x)
  endpoint <- x
  argument <- names(unlist(p[[1]]))
  definition <- as.character(unlist(p[[1]]))
  formats <- unlist(get_options(x = "output_formats", endpoint = x))
  # Check if sf required
  if ("geojson" %in% formats) {
    argument <- append(argument, "sf")
    definition <- append(definition, paste0(
      "Should the results be returned as an `sf` object (defaults to TRUE)?",
      "If `FALSE`, a `data.frame` is returned."))
  }
  url <- rep(paste0("https://macrostrat.org/api", endpoint), length(argument))
  cbind.data.frame(endpoint, argument, definition, url)
})
grids <- do.call(rbind.data.frame, params)

# Mobile (probably not needed here?)
#routes <- names(get_options(endpoint = "mobile"))
#params <- lapply(routes, function(x) {
#   p <- get_options(x = "parameters", endpoint = x)
#   args <- names(unlist(p[[1]]))
#   defs <- as.character(unlist(p[[1]]))
#   cbind.data.frame(args, defs)
# })
# mobile <- do.call(rbind.data.frame, params)

# Bind all argument definitions
definitions <- rbind.data.frame(definitions, defs, carto, grids)
definitions <- unique(definitions)

# Drop format argument
definitions <- definitions[-which(definitions$argument == "format"), ]

definitions$class <- NA

definitions <- definitions[, c("endpoint", "argument", "class", "definition", "url")]

# Save data
write.csv(definitions, "./data-raw/parameters.csv", row.names = FALSE)

# Save endpoints
endpoint <- unique(definitions$endpoint)
saveRDS(endpoint, "./data-raw/endpoints.RDS", compress = "xz")
