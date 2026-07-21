# Retrieve Macrostrat database statistics

A function to retrieve various statistics about each Macrostrat project
in the Macrostrat database. Function is called without user-specified
arguments.

## Usage

``` r
get_stats()
```

## Value

A `data.frame` containing the following columns:

- `project_id`: The unique identification number of the Macrostrat
  project.

- `project`: The name of the Macrostrat project.

- `columns`: The number of Macrostrat columns associated with the
  project.

- `packages`: The number of Macrostrat packages/sections associated with
  the project.

- `units`: The number of Macrostrat units associated with the project.

- `pbdb_collections`: The number of Paleobiology Database collections
  associated with the project.

- `measurements`: The number of measurements associated with the
  project.

- `t_polys`: The number of spatial polygons associated with the project.

## Developer(s)

William Gearty

## Reviewer(s)

Bethany Allen

## See also

Macrostrat database metadata:
[`def_projects()`](https://rmacrostrat.palaeoverse.org/reference/def_projects.md),
[`def_references()`](https://rmacrostrat.palaeoverse.org/reference/def_references.md),
[`def_sources()`](https://rmacrostrat.palaeoverse.org/reference/def_sources.md)

## Examples

``` r
# \donttest{
# Return all project statistics
ex1 <- get_stats()
# }
```
