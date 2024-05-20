# This function is for generating internal data for functions
library(devtools)
library(googlesheets4)
load_all()
# Load parameter data
dat <- read_sheet("https://docs.google.com/spreadsheets/d/1sW8cWNkEd3RfKS0CDSzbg2fO3pFUkc07-RBhxXnUa9c/edit?usp=sharing")
# Unique endpoints
endpoints <- unique(dat$endpoint)
# Construct parameter list
params <- lapply(endpoints, function(x) {
  tmp <- subset(dat, endpoint == x)
  tmp <- tmp[order(tmp$order), ]
  l <- as.list(tmp$class)
  names(l) <- tmp$argument
  return(l)
})
# Assign endpoint names
names(params) <- endpoints
# Save data
use_data(params, endpoints, internal = TRUE, compress = "xz", overwrite = TRUE)
