# This script is for generating function-level
# roxygen2 parameter dictionaries for each endpoint
library(devtools)
library(googlesheets4)
load_all()
# Load endpoints
endpoints <- readRDS("./data-raw/endpoints.RDS")
# Load parameter data
dat <- read_sheet("https://docs.google.com/spreadsheets/d/1sW8cWNkEd3RfKS0CDSzbg2fO3pFUkc07-RBhxXnUa9c/edit?usp=sharing")
# Version control
saveRDS(dat, paste0("./data-raw/ver/definitions-", Sys.Date(), ".RDS"), compress = "xz")
# Generate dictionaries
sapply(endpoints, function(x) {
  # Subset by endpoint
  defs <- subset(dat, endpoint == x)
  defs <- defs[order(defs$order), ]
  # Create file name
  file_name <- paste0("./data-raw/dictionary", x,  ".R")
  # Create file
  file.create(file_name)
  # Generate text
  dictionary <- paste0("#' @param ",
                       defs$argument,
                       " \\code{",
                       defs$class,
                       "}. ",
                       defs$definition)
  # Add text to file
  writeLines(text = dictionary, con = file_name)
})
