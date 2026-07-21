# Retrieve geologic map outcrop shape element data

A function to retrieve data for geologic map outcrop shape elements from
various sources.

## Usage

``` r
get_map_outcrop(
  map_id = NULL,
  unit_id = NULL,
  strat_name_id = NULL,
  lat = NULL,
  lng = NULL,
  scale = NULL,
  sf = TRUE
)
```

## Arguments

- map_id:

  `integer`. The unique identification number(s) of the map outcrop
  shape element(s) to return.

- unit_id:

  `integer`. Filter outcrop shape elements to those that match one or
  more Macrostrat unit(s) as specified by their unique identification
  number(s).

- strat_name_id:

  `integer`. Filter outcrop shape elements to those that match one or
  more stratigraphic name(s) as specified by their unique identification
  number(s).

- lat:

  `numeric`. Return the outcrop shape element(s) at the specified
  decimal degree latitude. Must also specify `lng`.

- lng:

  `numeric`. Return the outcrop shape element(s) at the specified
  decimal degree longitude. Must also specify `lat`.

- scale:

  `character`. The Macrostrat map scale to use (a vector of scales is
  also supported). Options are "tiny" (global), "small" (continental),
  "medium" (regional), or "large" (local).

- sf:

  `logical`. Should the results be returned as an `sf` object? Defaults
  to `TRUE`. If `FALSE`, a `data.frame` is returned.

## Value

A `data.frame` containing the following columns:

- `map_id`: The identification number of the outcrop shape element.

- `source_id`: The identification number of the source geologic map.

- `name`: The name of the outcrop shape element in the original (or
  modified) source geologic map.

- `strat_name`: The geologic name(s) of the outcrop shape element.

- `lith`: The lithology of the outcrop shape element as defined in the
  geologic map source in plain text.

- `descrip`: Description of the outcrop shape element in plain text.

- `comments`: Notes assigned to the outcrop shape element.

- `macro_units`: A vector containing the unique identification number(s)
  for known Macrostrat unit(s) matched to the outcrop shape element.

- `strat_names`: A vector containing the unique identification number(s)
  for known stratigraphic unit name(s) matched to the outcrop shape
  element (see
  [`def_strat_names()`](https://rmacrostrat.palaeoverse.org/reference/def_strat_names.md)).

- `liths`: A vector containing the unique identification number(s) of
  the lithology(ies) represented within the outcrop shape element (see
  [`def_lithologies()`](https://rmacrostrat.palaeoverse.org/reference/def_lithologies.md)).

- `t_int_id`: The identification number of the chronostratigraphic
  interval containing the top boundary of the outcrop shape element.

- `t_int_age`: The top age of the chronostratigraphic interval
  containing the top boundary of the outcrop shape element.

- `t_int_name`: The name of the chronostratigraphic interval containing
  the top boundary of the outcrop shape element.

- `b_int_id`: The identification number of the chronostratigraphic
  interval containing the bottom boundary of the outcrop shape element.

- `b_int_age`: The bottom age of the chronostratigraphic interval
  containing the bottom boundary of the outcrop shape element.

- `b_int_name`: The name of the chronostratigraphic interval containing
  the bottom boundary of the outcrop shape element.

- `color`: Recommended color for plotting the outcrop shape element
  based on the dominant lithology.

- `t_age`: The estimated top age (minimum age) of the outcrop shape
  element, in millions of years before present.

- `b_age`: The estimated bottom age (maximum age) of the outcrop shape
  element, in millions of years before present.

- `best_int_name`: The best/most representative interval name for the
  outcrop shape element.

If `sf` is `TRUE` (the default), an `sf` object is returned instead,
with the same columns plus a "geometry" column that contains the spatial
data.

## Details

More information can be found for the inputs for this function using the
definition functions (beginning with `def_`).

## Developer(s)

William Gearty

## Reviewer(s)

Lewis A. Jones

## See also

Geologic maps:
[`def_sources()`](https://rmacrostrat.palaeoverse.org/reference/def_sources.md),
[`get_map_legends()`](https://rmacrostrat.palaeoverse.org/reference/get_map_legends.md),
[`get_map_points()`](https://rmacrostrat.palaeoverse.org/reference/get_map_points.md),
[`get_tiles()`](https://rmacrostrat.palaeoverse.org/reference/get_tiles.md)

## Examples

``` r
# \donttest{
ex1 <- get_map_outcrop(lat = 43, lng = -89.3)
ex2 <- get_map_outcrop(lat = 43, lng = -89.3, scale = "tiny")
# }
```
