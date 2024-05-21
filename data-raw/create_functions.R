library(devtools)
load_all()

create_function(name = "get_columns",
                args = NULL,
                endpoint = "/columns",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "get_units",
                args = NULL,
                endpoint = "/units",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "get_fossils",
                args = NULL,
                endpoint = "/fossils",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "get_stats",
                args = NULL,
                endpoint = "/stats",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "get_paleogeography",
                args = NULL,
                endpoint = "/paleogeography",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "get_map_outcrop",
                args = NULL,
                endpoint = "/geologic_units/map",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "get_map_points",
                args = NULL,
                endpoint = "/geologic_units/map/points",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "get_map_legends",
                args = NULL,
                endpoint = "/geologic_units/map/legend",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "get_measurements",
                args = NULL,
                endpoint = "/measurements",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "get_age_model",
                args = NULL,
                endpoint = "/age_model",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "get_eodp",
                args = NULL,
                endpoint = "/eodp",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_lithologies",
                args = NULL,
                endpoint = "/defs/lithologies",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_lithology_att",
                args = NULL,
                endpoint = "/defs/lithology_attributes",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_structures",
                args = NULL,
                endpoint = "/defs/structures",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_columns",
                args = NULL,
                endpoint = "/defs/columns",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_econs",
                args = NULL,
                endpoint = "/defs/econs",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_environments",
                args = NULL,
                endpoint = "/defs/environments",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_intervals",
                args = NULL,
                endpoint = "/defs/intervals",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_sources",
                args = NULL,
                endpoint = "/defs/sources",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_strat_names",
                args = NULL,
                endpoint = "/defs/strat_names",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_strat_name_concepts",
                args = NULL,
                endpoint = "/defs/strat_name_concepts",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_timescales",
                args = NULL,
                endpoint = "/defs/timescales",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_minerals",
                args = NULL,
                endpoint = "/defs/minerals",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_projects",
                args = NULL,
                endpoint = "/defs/projects",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_plates",
                args = NULL,
                endpoint = "/defs/plates",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_measurements",
                args = NULL,
                endpoint = "/defs/measurements",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_grain_sizes",
                args = NULL,
                endpoint = "/defs/grainsizes",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_references",
                args = NULL,
                endpoint = "/defs/refs",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)

create_function(name = "def_drilling_sites",
                args = NULL,
                endpoint = "/defs/drilling_sites",
                fields = c("author", "details",
                           "examples", "export"),
                overwrite = TRUE)


