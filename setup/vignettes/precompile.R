# This script is used to precompile vignettes and should be run for
# each new version of the package

# Get current wd (to restore later)
old_wd <- getwd()
# Set wd to vignettes to avoid saving to base directory
setwd("vignettes/")
# Precompile vignettes
library(knitr)
knit("../setup/vignettes/geologic-map.Rmd",
     "geologic-map.Rmd")
knit("../setup/vignettes/geological-completeness.Rmd",
     "geological-completeness.Rmd")
knit("../setup/vignettes/stratigraphic-column.Rmd",
     "stratigraphic-column.Rmd")
# Build vignettes
library(devtools)
build_vignettes()
# Restore wd
setwd(old_wd)
