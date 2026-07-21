# Define grain sizes

A function to return grain size definitions from the Macrostrat Database
based on user-specified arguments. If no arguments are specified, all
definitions are returned.

## Usage

``` r
def_grain_sizes(
  grain_name = NULL,
  grain_group = NULL,
  soil_group = NULL,
  grain_id = NULL,
  grain_symbol = NULL,
  grain_classification = NULL
)
```

## Arguments

- grain_name:

  `character`. The name of the specific grain (e.g., "Coarse Gravel") to
  return a definition for.

- grain_group:

  `character`. The name of the group the grain belongs to (e.g.,
  "Gravel") to return a definition for.

- soil_group:

  `character`. The name of the family of soils the grain belongs to
  (e.g., "Coarse Soil") to return a definition for.

- grain_id:

  `integer`. The unique identification number(s) of the desired grain
  definitions(s) to return a definition for.

- grain_symbol:

  `character`. The abbreviation of the desired grain definition(s)
  (e.g., "CGr") to return a definition for.

- grain_classification:

  `character`. The classification scheme the given grain belongs to
  (e.g., "Wentworth") to return a definition for.

## Value

A `data.frame` containing the following columns:

- `grain_id`: The unique identification number of the grain.

- `grain_symbol`: The grain symbol (or abbreviation) to use for display
  purposes.

- `grain_name`: The name of the grain.

- `grain_group`: The name of the group the grain belongs to.

- `soil_group`: The name of the soil family the grain belongs to.

- `min_size`: The minimum size of the size in millimeters.

- `max_size`: The maximum size of the grain in millimeters.

- `classification`: The classification scheme the given grain belongs
  to.

## Developer(s)

Lewis A. Jones

## Reviewer(s)

William Gearty

## See also

Geologic features and attributes:
[`def_econs()`](https://rmacrostrat.palaeoverse.org/reference/def_econs.md),
[`def_environments()`](https://rmacrostrat.palaeoverse.org/reference/def_environments.md),
[`def_lithologies()`](https://rmacrostrat.palaeoverse.org/reference/def_lithologies.md),
[`def_lithology_att()`](https://rmacrostrat.palaeoverse.org/reference/def_lithology_att.md),
[`def_measurements()`](https://rmacrostrat.palaeoverse.org/reference/def_measurements.md),
[`def_minerals()`](https://rmacrostrat.palaeoverse.org/reference/def_minerals.md),
[`def_structures()`](https://rmacrostrat.palaeoverse.org/reference/def_structures.md)

## Examples

``` r
# \donttest{
 # Return all definitions
 ex1 <- def_grain_sizes()
 # Return grain sizes by group
 ex2 <- def_grain_sizes(grain_group = "Gravel")
#> Error in GET_macrostrat(endpoint = "defs/grainsizes", query = args, format = "json"): Content not found. Check your request.
# }
```
