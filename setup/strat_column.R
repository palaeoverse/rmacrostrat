# Load packages
library(rmacrostrat)
library(ggplot2)
library(ggrepel)
library(deeptime)
# Get the column definition of the San Juan Basin
column_def <- def_columns(column_name = "San Juan Basin")
# Using the column ID, retrieve all units of Cretaceous age
units <- get_units(column_id = column_def$col_id, interval_name = "Cretaceous")
# Plot stratigraphic log
ggplot(units, aes(ymin = b_age, ymax = t_age,
                  xmin = 0, xmax = 1, fill = unit_name, color = unit_name)) +
  # Plot units
  geom_rect(alpha = 0.5, colour = "grey30", linetype = 2) +
  # Add text labels
  geom_text_repel(aes(x = 1, y = (b_age + t_age) / 2, label = unit_name),
                  color = "black",
                  min.segment.length = 0, size = 3,
                  nudge_x = rep_len(x = c(0.5, 1.5), length.out = 17),
                  direction = "x", hjust = 0, force = TRUE) +
  #geom_linerange(aes(ymin = b_age, ymax = t_age, x = rep_len(x = c(0.05, 0.95), length.out = 17)), linetype = 1, linewidth = 1.5) +
  geom_rect(aes(ymin = b_age, ymax = t_age,
                xmin = rep_len(x = c(0.9), length.out = 17),
                xmax = rep_len(x = c(1), length.out = 17)), color = "black") +
  scale_y_reverse(n.breaks = 10, name = "Time (Ma)") +
  # Fill color
  scale_fill_manual(values = units$color) +
  scale_color_manual(values = units$color) +
  # Theming
  theme_classic() +
  theme(legend.position = "none",
        axis.line.x = element_blank(),
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  # Add geological time scale
  coord_geo(pos = "left", dat = list("stages"),
            rot = 90, abbrv = FALSE, size = 2, expand = FALSE)

ggsave("./setup/strat_column.png", width = 150, height = 300, dpi = 300, units = "mm")
