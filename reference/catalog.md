# Retrieve a complete set of definitions

A function to retrieve all definitions and/or metadata for a given
definition set. Caution: some datasets are large and may take time to
retrieve.

## Usage

``` r
catalog(type = NULL)
```

## Arguments

- type:

  `character`. The name of a definition set to retrieve. See Definitions
  section below for options.

## Value

A `data.frame` containing an exhaustive list of the definitions and/or
metadata retrievable for the given definition set. The variables in the
`data.frame` will match those described in the documentation for that
definition set.

## Definitions

- columns: Definitions of Macrostrat columns. See also
  [`def_columns()`](https://rmacrostrat.palaeoverse.org/reference/def_columns.md).

- drilling_sites: Definitions of eODP drilling cores. See also
  [`def_drilling_sites()`](https://rmacrostrat.palaeoverse.org/reference/def_drilling_sites.md).

- econs: Definitions of economic resources. See also
  [`def_econs()`](https://rmacrostrat.palaeoverse.org/reference/def_econs.md).

- environments: Definitions of environments. See also
  [`def_environments()`](https://rmacrostrat.palaeoverse.org/reference/def_environments.md).

- grain_sizes: Definitions of grain sizes. See also
  [`def_grain_sizes()`](https://rmacrostrat.palaeoverse.org/reference/def_grain_sizes.md).

- intervals: Definitions of temporal intervals. See also
  [`def_intervals()`](https://rmacrostrat.palaeoverse.org/reference/def_intervals.md).

- lithologies: Definitions of lithologies. See also
  [`def_lithologies()`](https://rmacrostrat.palaeoverse.org/reference/def_lithologies.md).

- lithology_att: Definitions of lithology attributes. See also
  [`def_lithology_att()`](https://rmacrostrat.palaeoverse.org/reference/def_lithology_att.md).

- measurements: Definitions of measurements. See also
  [`def_measurements()`](https://rmacrostrat.palaeoverse.org/reference/def_measurements.md).

- minerals: Defintions of minerals. See also
  [`def_minerals()`](https://rmacrostrat.palaeoverse.org/reference/def_minerals.md).

- plates: Definitions of tectonic plates. See also
  [`def_plates()`](https://rmacrostrat.palaeoverse.org/reference/def_plates.md).

- projects: Definitions of Macrostrat projects. See also
  [`def_projects()`](https://rmacrostrat.palaeoverse.org/reference/def_projects.md).

- references: Definitions of references. See also
  [`def_references()`](https://rmacrostrat.palaeoverse.org/reference/def_references.md).

- sources: Definitions of geological maps. See also
  [`def_sources()`](https://rmacrostrat.palaeoverse.org/reference/def_sources.md).

- strat_name_concepts: Definitions of stratigraphic name concepts. See
  also
  [`def_strat_name_concepts()`](https://rmacrostrat.palaeoverse.org/reference/def_strat_name_concepts.md).

- strat_names: Definitions of stratigraphic names. See also
  [`def_strat_names()`](https://rmacrostrat.palaeoverse.org/reference/def_strat_names.md).

- structures: Definitions of geological structures. See also
  [`def_structures()`](https://rmacrostrat.palaeoverse.org/reference/def_structures.md).

- timescales: Definitions of timescales. See also
  [`def_timescales()`](https://rmacrostrat.palaeoverse.org/reference/def_timescales.md).

## Developer(s)

Bethany Allen & Lewis A. Jones

## Reviewer(s)

Lewis A. Jones

## Examples

``` r
# \donttest{
  # Get mineral definitions
  ex1 <- catalog(type = "minerals")
  # Get grain size definitions
  ex2 <- catalog(type = "grain_sizes")
# }
```
