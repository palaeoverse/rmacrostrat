# Retrieve geologic map source definitions

A function to retrieve the definitions for one or more geologic map
sources in the Macrostrat database. By default, all source definitions
are returned.

## Usage

``` r
def_sources(
  source_id = NULL,
  lat = NULL,
  lng = NULL,
  shape = NULL,
  buffer = NULL,
  scale = NULL,
  sf = TRUE
)
```

## Arguments

- source_id:

  `integer`. The unique identification number(s) of the desired
  source(s) to return a definition for.

- lat:

  `numeric`. A valid latitude in decimal degrees to return a source
  definition for. Must also supply `lng`.

- lng:

  `numeric`. A valid longitude in decimal degrees to return a source
  definition for. Must also supply `lat`.

- shape:

  `character`. A valid well-known text (WKT) representation of geometry,
  such as "POINT(30 10)" or "POLYGON((30 10, 40 40, 20 40, 10 20))", to
  return a source definition for.

- buffer:

  `integer`. The geographic buffer (in meters) that should be applied to
  the specified `shape`.

- scale:

  `character`. The desired Burwell scale, either: "tiny" (global),
  "small" (continental), "medium" (regional), or "large" (local).

- sf:

  `logical`. Should the results be returned as an `sf` object? Defaults
  to `TRUE`. If `FALSE`, a `data.frame` is returned.

## Value

A `data.frame` containing the following columns:

- `source_id`: Identification number of the geologic map source.

- `name`: Name of the geologic map source.

- `url`: URL where additional information, the source, or contributing
  publication can be found.

- `ref_title`: Title of reference for geologic map source.

- `authors`: Authors of geologic map source.

- `ref_year`: Year of reference publication.

- `ref_source`: Original publication source of the reference.

- `isbn_doi`: The ISBN or DOI for the reference.

- `scale`: The Macrostrat scale the geologic map source belongs to.

- `features`: The total number of features (i.e., outcrop shape and
  point elements) associated with the geologic map source.

- `area`: The total geographic area of the geologic map source in km².

If `sf` is `TRUE` (the default), an `sf` object is returned instead,
with the same columns plus a "geometry" column that contains the spatial
data.

## Developer(s)

William Gearty

## Reviewer(s)

Lewis A. Jones

## See also

Geologic maps:
[`get_map_legends()`](https://rmacrostrat.palaeoverse.org/reference/get_map_legends.md),
[`get_map_outcrop()`](https://rmacrostrat.palaeoverse.org/reference/get_map_outcrop.md),
[`get_map_points()`](https://rmacrostrat.palaeoverse.org/reference/get_map_points.md),
[`get_tiles()`](https://rmacrostrat.palaeoverse.org/reference/get_tiles.md)

Macrostrat database metadata:
[`def_projects()`](https://rmacrostrat.palaeoverse.org/reference/def_projects.md),
[`def_references()`](https://rmacrostrat.palaeoverse.org/reference/def_references.md),
[`get_stats()`](https://rmacrostrat.palaeoverse.org/reference/get_stats.md)

## Examples

``` r
# \donttest{
# Get all sources
ex1 <- def_sources()
#> Warning: No results returned for query.
# Get subset of sources
ex2 <- def_sources(source_id = c(1,2,4))
#> Warning: No results returned for query.
ex3 <- def_sources(lat = 43.03, lng = -89.4, scale = "large")
#> Warning: No results returned for query.
# Use WKT representation
library(sf)
#> Linking to GEOS 3.12.1, GDAL 3.8.4, PROJ 9.4.0; sf_use_s2() is TRUE
line <- st_linestring(x = matrix(c(-122.3438, 37,-89.3527, 43.0582),
                                 byrow = TRUE, ncol = 2))
ex4 <- def_sources(shape = st_as_text(line), buffer = 100)
#> Warning: No results returned for query.
# }
```
