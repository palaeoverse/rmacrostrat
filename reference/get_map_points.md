# Retrieve geologic map point shape element data

A function to retrieve data for geologic map point shape elements from
various sources.

## Usage

``` r
get_map_points(
  point_id = NULL,
  point_type = NULL,
  min_lat = NULL,
  min_lng = NULL,
  max_lat = NULL,
  max_lng = NULL,
  source_id = NULL,
  sf = TRUE
)
```

## Arguments

- point_id:

  `integer`. The unique identification number(s) of the point(s) to
  return.

- point_type:

  `character`. Filter points to those of one or more point type(s).
  Options are "cleavage", "bedding", "axial plane", "fault plane",
  "foliation", and "joint". Ignored if `point_id` is supplied.

- min_lat:

  `integer`. The minimum latitude used to define the bounding box of the
  points to return. Requires `min_lng`, `max_lat`, and `max_lng`.
  Ignored if `point_id` is supplied.

- min_lng:

  `integer`. A minimum longitude used to define the bounding box of the
  points to return. Requires `min_lat`, `max_lat`, and `max_lng`.
  Ignored if `point_id` is supplied.

- max_lat:

  `integer`. A maximum latitude used to define the bounding box of the
  points to return. Requires `min_lat`, `min_lng`, and `max_lng`.
  Ignored if `point_id` is supplied.

- max_lng:

  `integer`. A maximum longitude used to define the bounding box of the
  points to return. Requires `min_lat`, `min_lng`, and `max_lat`.
  Ignored if `point_id` is supplied.

- source_id:

  `integer`. The unique identification number(s) of the source(s) to
  filter the points by. Ignored if `point_id` is supplied.

- sf:

  `logical`. Should the results be returned as an `sf` object? Defaults
  to `TRUE`.

## Value

An `sf` object containing the following columns:

- `point_id`: The identification number of the point element.

- `strike`: The strike value of the point element.

- `dip`: The dip value of the point element.

- `dip_dir`: The dip direction of the point element.

- `point_type`: The type of point element (e.g. "bedding").

- `certainty`: The certainty of the point element location.

- `comments`: Notes assigned to the point element.

- `source_id`: The unique identification number of the source for the
  point element.

- `geometry`: The point spatial data.

If `sf` is `TRUE` (the default), an `sf` object is returned, with the a
"geometry" column that contains the spatial data. If `sf` is `FALSE`, a
`data.frame` object is returned with two additional columns (lng, lat)
containing the geographic coordinates of the point elements.

## Details

More information can be found relating to the inputs for this function
using the definition functions (beginning with `def_`).

## Developer(s)

Lewis A. Jones

## Reviewer(s)

Bethany Allen

## See also

Geologic maps:
[`def_sources()`](https://rmacrostrat.palaeoverse.org/reference/def_sources.md),
[`get_map_legends()`](https://rmacrostrat.palaeoverse.org/reference/get_map_legends.md),
[`get_map_outcrop()`](https://rmacrostrat.palaeoverse.org/reference/get_map_outcrop.md),
[`get_tiles()`](https://rmacrostrat.palaeoverse.org/reference/get_tiles.md)

## Examples

``` r
# \donttest{
# Return a specific point
ex1 <- get_map_points(point_id = 1)
# Return all points within a user-specified bounding box
ex2 <- get_map_points(min_lng = -80, min_lat = 40,
                      max_lng = -70, max_lat = 50)
# }
```
