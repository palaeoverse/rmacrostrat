# Retrieve Macrostrat vectorized tiles

A function to retrieve map tile data from the [Macrostrat tile
server](https://tiles.macrostrat.org/). This includes geologic line
features such as faults, anticlines, and moraines, as well as geologic
map polygons (similar to
[`get_map_outcrop()`](https://rmacrostrat.palaeoverse.org/reference/get_map_outcrop.md)
but for an entire geographic tile). The function retrieves the data in
vectorized (`sf`) tile format. Note that the geographic features come
from the "carto" Macrostrat scale, which is primarily for visualization
purposes, and makes many assumptions about the relative priority of each
source map. The layers and scales are seamlessly blended based on the
chosen `zoom` level, so no scale-dependent decisions can or should be
made.

## Usage

``` r
get_tiles(zoom = 0, x = NULL, y = NULL, combined = TRUE)
```

## Arguments

- zoom:

  `integer`. The zoom level of the tile(s) to retrieve. The minimum zoom
  level is `0`.

- x:

  `integer`. The x index/indices of the tile(s) to retrieve. If `NULL`
  (the default), tiles of all x indices will be retrieved and combined.

- y:

  `integer`. The y index/indices of the tile(s) to retrieve. If `NULL`
  (the default), tiles of all y indices will be retrieved and combined.

- combined:

  `logical`. Whether all tiles should be combined. If `TRUE` (the
  default), the function returns a single list with all tiles combined
  (as described below). If `FALSE`, the function returns a list of
  lists, each element of which represents the data for a single tile.

## Value

A `list` of length two containing the following elements:

- `lines`: An `sf` object containing the geologic line features such as
  faults, anticlines, and moraines. It includes 8 variables:

  - `tile`: An identifier of the form "x/y" for the tile that contains
    the line feature. Not included if `combined = FALSE`.

  - `line_id`: The unique identifier for a line feature.

  - `source_id`: An integer that corresponds to the original map sources
    (see
    [`def_sources()`](https://rmacrostrat.palaeoverse.org/reference/def_sources.md)).

  - `descrip`: A description of the line.

  - `name`: The name of the line, if available.

  - `direction`: A normalized direction of the line. Not commonly
    available.

  - `type`: A normalized line type (fault, fold, anticline, etc).

  - `geometry`: The line features as `sf` objects.

- `units`: An `sf` object containing the geologic map polygons. It
  includes 24 variables:

  - `tile`: An identifier of the form "x/y" for the tile that contains
    the polygon. Not included if `combined = FALSE`.

  - `map_id`: The unique identifier for a polygon (see
    \[get_map_outcrop\[\]).

  - `source_id`: An integer that corresponds to the original map sources
    (see
    [`def_sources()`](https://rmacrostrat.palaeoverse.org/reference/def_sources.md)).

  - `legend_id`: An integer that corresponds to the associated legend
    component of the original map source (see
    [`get_map_legends()`](https://rmacrostrat.palaeoverse.org/reference/get_map_legends.md)).

  - `best_age_top`: The best top age that Macrostrat can assign to the
    unit based on linked resources.

  - `best_age_bottom`: The best bottom age that Macrostrat can assign to
    the unit based on linked resources.

  - `color`: A hex code associated with the best containing time
    interval for the map unit.

  - `name`: The name of the polygon. Usually either a stratigraphic name
    or lithological description.

  - `age`: The age indicated by the map author.

  - `lith`: Lithologies, or lithological description (see
    [`def_lithologies()`](https://rmacrostrat.palaeoverse.org/reference/def_lithologies.md)).

  - `descrip`: A description of the map unit.

  - `comments`: Comments about the map unit.

  - `t_int_id`: The Macrostrat interval ID associated with the top age
    of the map unit (see
    [`def_intervals()`](https://rmacrostrat.palaeoverse.org/reference/def_intervals.md)).

  - `t_int`: The name of the Macrostrat interval associated with the top
    age of the map unit (see
    [`def_intervals()`](https://rmacrostrat.palaeoverse.org/reference/def_intervals.md)).

  - `b_int_id`: The Macrostrat interval ID associated with the bottom
    age of the map unit (see
    [`def_intervals()`](https://rmacrostrat.palaeoverse.org/reference/def_intervals.md)).

  - `b_int`: The name of the Macrostrat interval associated with the
    bottom age of the map unit (see
    [`def_intervals()`](https://rmacrostrat.palaeoverse.org/reference/def_intervals.md)).

  - `ref_url`: A URL to the original map source.

  - `ref_name`: The name of the original map source.

  - `ref_title`: The title of the original map source.

  - `ref_authors`: The authors of the original map source.

  - `ref_source`: The publication source of the original map source.

  - `ref_year`: The publication year of the original map source.

  - `ref_isbn`: The ISBN of the original map source.

  - `geometry`: The polygon geometries as `sf` objects.

## Details

The tile indices (`x` and `y`) are zero-indexed, meaning that the first
tile in each dimension is `0`. The zoom level is also zero-indexed,
meaning that the first (most zoomed out) zoom level is `0`. For a given
zoom level, the possible tile indices are `0` to `2 ^ zoom - 1`. Note
that retrieving multiple (or all tiles) at higher zoom levels returns
large (memory-wise) data objects.

Also note that two (or more) tiles may contain parts of the same
geologic outcrop polygon. Since tiles also overlap slightly, these
separate outcrop components may also overlap, which may lead to
confusing visualizations or invalid downstream analyses. To address
this, users are encouraged to union polygons that have the same `map_id`
values using the
[`sf::st_union()`](https://r-spatial.github.io/sf/reference/geos_combine.html)
function (either with a combination of
[`dplyr::group_by()`](https://dplyr.tidyverse.org/reference/group_by.html)
and
[`dplyr::summarise()`](https://dplyr.tidyverse.org/reference/summarise.html)
or with
[`palaeoverse::group_apply()`](https://palaeoverse.palaeoverse.org/reference/group_apply.html),
the former of which is significantly faster for a large number of
tiles). We have not implemented this here to reduce the number of
package dependencies and to reduce the computational time of this
function.

## Developer(s)

William Gearty

## Reviewer(s)

Lewis A. Jones

## See also

Geologic maps:
[`def_sources()`](https://rmacrostrat.palaeoverse.org/reference/def_sources.md),
[`get_map_legends()`](https://rmacrostrat.palaeoverse.org/reference/get_map_legends.md),
[`get_map_outcrop()`](https://rmacrostrat.palaeoverse.org/reference/get_map_outcrop.md),
[`get_map_points()`](https://rmacrostrat.palaeoverse.org/reference/get_map_points.md)

## Examples

``` r
# \donttest{
# get single carto tile of the world
ex1 <- get_tiles()
#> Retrieving tiles...
#>   |                                                                              |                                                                      |   0%  |                                                                              |======================================================================| 100%
#> Cleaning and combining tiles...
# get specific tile at a higher zoom
ex2 <- get_tiles(zoom = 6, x = 5, y = 5)
#> Retrieving tiles...
#>   |                                                                              |                                                                      |   0%  |                                                                              |======================================================================| 100%
#> Cleaning and combining tiles...
# }
```
