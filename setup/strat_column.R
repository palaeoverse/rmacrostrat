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
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  # Add geological time scale
  coord_geo(pos = "left", dat = list("stages"), rot = 90)

# Save
ggsave("./setup/strat_column.png", width = 213, height = 400, dpi = 300, units = "mm",
       scale = 0.9)
