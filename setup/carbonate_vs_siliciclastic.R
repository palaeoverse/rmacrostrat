# Generate a plot of carbonate vs. siliciclastic units through time
# Load libraries
library(rmacrostrat)
# Get units by environment type and interval
carbonate <- get_units(environ_type = "carbonate",
                       interval_name = "Phanerozoic",
                       project_id = 1)
siliciclastic <- get_units(environ_type = "siliciclastic",
                           interval_name = "Phanerozoic",
                           project_id = 1)
# Add column of sediment type
carbonate$sediment_type <- "Carbonate"
siliciclastic$sediment_type <- "Siliciclastic"
# Bind data
units <- rbind.data.frame(carbonate, siliciclastic)


# Load libraries
library(palaeoverse)
# Generate stage-level time bins
bins <- time_bins(rank = "stage")
# Rename age columns in units to be consistent with our bins
colnames(units)[which(colnames(units) == "b_age")] <- "max_ma"
colnames(units)[which(colnames(units) == "t_age")] <- "min_ma"
# Bin data using the bin_time function with the "all" method.
# This method bins units into all bins the unit overlaps with
# generating additional rows for each time bin
units <- bin_time(occdf = units, bins = bins,
                  min_ma = "min_ma", max_ma = "max_ma",
                  method = "all")
# Calculate the number of environment classes per bin assignment
# Remember, each row is a unique instance of a unit within a bin
counts <- group_apply(occdf = units,
                      group = c("sediment_type", "bin_assignment"),
                      fun = nrow)
# Rename columns to ease reading and merging
colnames(counts) <- c("count", "sediment_type", "bin")
# Merge datasets by bin number
counts <- merge(x = bins, y = counts, by = "bin")

# Load libraries
library(ggplot2)
library(deeptime)
# Generate a plot of lithostratigraphic units through time
ggplot(counts, aes(fill = sediment_type, y = count, x = mid_ma)) +
  # Stacked bar chart with bar width specified by interval duration
  geom_bar(position = "stack", stat = "identity", width = counts$duration_myr,
           color = "black", linewidth = 0.1) +
  # Label y-axis
  scale_y_continuous("Number of lithostratigraphic units") +
  # Label x-axis and reverse direction
  scale_x_reverse("Time (Ma)") +
  # Data plotting colors
  scale_fill_manual(values = c("#add8e6", "#C4A484")) +
  # Theming
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.position = c(0.1, 0.9)) +
  # Add geological timescale
  coord_geo()

ggsave("./setup/carbonate_vs_siliciclastic.png", dpi = 600,
       width = 200, height = 125, unit = "mm")
