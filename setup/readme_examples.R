# Generate README figures

## Stratigraphic column

# Load packages
library(rmacrostrat)
library(ggplot2)
library(ggrepel)
library(deeptime)
# Get the column definition of the San Juan Basin
column_def <- def_columns(column_name = "San Juan Basin")
# Using the column ID, retrieve all units of Cretaceous age
units <- get_units(column_id = column_def$col_id,
                   interval_name = "Cretaceous")
# Add midpoint age for plotting
units$m_age <- (units$b_age + units$t_age) / 2
# Plot stratigraphic column
ggplot(units, aes(ymin = b_age, ymax = t_age, xmin = 0, xmax = 1)) +
  # Plot units
  geom_rect(alpha = 0.5, fill = units$color, color = "black",
            linetype = 2) +
  # Add text labels
  geom_text_repel(aes(x = 1, y = m_age, label = unit_name),
                  size = 4, hjust = 0,
                  min.segment.length = 0, direction = "x",
                  nudge_x = rep_len(x = c(2, 3), length.out = 17)) +
  # Add additional unit rectangles
  geom_rect(aes(ymin = b_age, ymax = t_age, xmin = 0.9, xmax = 1),
            fill = units$color, color = "black") +
  # Reverse direction of y-axis
  scale_y_reverse(n.breaks = 10, name = "Time (Ma)") +
  # Theming
  theme_classic() +
  theme(legend.position = "none",
        axis.line.x = element_blank(),
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) +
  # Add geological time scale
  coord_geo(pos = "left", dat = list("stages"), rot = 90)

# Save
ggsave("./man/figures/strat_column.png", width = 70, height = 100, dpi = 300,
       units = "mm", scale = 3)

## Outcrop map

# Load libraries
library(rmacrostrat)
library(ggplot2)
library(sf)
# Get data for the chosen formation
hc_def <- def_strat_names(strat_name = "Hell Creek", rank = "Fm")
# Get spatial outcrop data for the formation
hc <- get_map_outcrop(strat_name_id = hc_def$strat_name_id, sf = TRUE)
# Plot the map
ggplot() +
  geom_sf(data = hc, fill = "#C7622B", lwd = 0) +
  coord_sf(xlim = c(-112, -97), ylim = c(44, 50)) +
  theme_bw()

# Save
ggsave("./man/figures/hell_creek_outcrop.png", width = 110, height = 70,
       dpi = 300, units = "mm", scale = 2)

## Time series plot

# Load libraries
library(rmacrostrat)
library(ggplot2)
library(deeptime)
# Get all carbonate units for North America
units <- get_units(environ_class = "marine",
                   interval_name = "Phanerozoic",
                   project_id = 1)
# Add mid age for units
units$mid_age <- (units$b_age + units$t_age) / 2
# Plot data
ggplot(units, aes(x = mid_age)) +
  geom_histogram(binwidth = 10, center = 5,
                 color = "black", fill = "#add8e6") +
  scale_y_continuous("Number of marine units") +
  scale_x_reverse("Time (Ma)", limits = c(538.8, 0)) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.position.inside = c(0.1, 0.9)) +
  coord_geo()

# Save
ggsave("./man/figures/marine_units.png", width = 150, height = 100,
       dpi = 300, units = "mm", scale = 1.5)
