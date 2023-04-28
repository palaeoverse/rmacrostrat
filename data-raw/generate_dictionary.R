# This script is for scraping the API for all arguments (parameters) in order
# to make a dictionary of available parameters

# Get all first-level routes
routes <- names(get_options())
params <- lapply(routes, function(x) get_options(x = "parameters", endpoint = x))
# Remove routes without parameters
sub_routes <- unlist(lapply(params, function(x) unique(names(x) == "parameters")))
# Retain first-level routes with parameters
params <- params[sub_routes]
# Extract arguments
params <- lapply(params, function(x) {
  args <- names(unlist(x[[1]]))
  defs <- as.character(unlist(x[[1]]))
  cbind.data.frame(args, defs)
})
definitions <- do.call(rbind.data.frame, params)

# The following routes have subroutes so need to be scraped at this level
# Defs
routes <- names(get_options(endpoint = "defs"))
params <- lapply(routes, function(x) {
  p <- get_options(x = "parameters", endpoint = x)
  args <- names(unlist(p[[1]]))
  defs <- as.character(unlist(p[[1]]))
  cbind.data.frame(args, defs)
})
defs <- do.call(rbind.data.frame, params)

# Carto
routes <- names(get_options(endpoint = "carto"))
params <- lapply(routes, function(x) {
  p <- get_options(x = "parameters", endpoint = x)
  args <- names(unlist(p[[1]]))
  defs <- as.character(unlist(p[[1]]))
  cbind.data.frame(args, defs)
})
carto <- do.call(rbind.data.frame, params)

# Grids
routes <- names(get_options(endpoint = "grids"))
params <- lapply(routes, function(x) {
  p <- get_options(x = "parameters", endpoint = x)
  args <- names(unlist(p[[1]]))
  defs <- as.character(unlist(p[[1]]))
  cbind.data.frame(args, defs)
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

# Bind all argument defintions
definitions <- rbind.data.frame(definitions, defs, carto, grids)
definitions <- unique(definitions)
# Sort definitions by args
definitions <- definitions[order(definitions$args), ]

# Make dictionary
file.create("dictionary.R")
dictionary <- paste0("#' @param ",
                     definitions$args,
                     " \\code{}. ",
                     definitions$defs)
writeLines(text = dictionary, con = "./R/dictionary.R")
