#Vignettes that depend on internet access have been precompiled:
old_wd <- getwd()

setwd("vignettes/")

library(knitr)
knit("geologic-map.Rmd.orig",
     "geologic-map.Rmd")
knit("geological-completeness.Rmd.orig",
     "geological-completeness.Rmd")
knit("stratigraphic-column.Rmd.orig",
     "stratigraphic-column.Rmd")

library(devtools)
build_vignettes()

setwd(old_wd)
