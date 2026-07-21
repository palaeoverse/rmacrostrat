# Define minerals

A function to retrieve mineral definitions from the Macrostrat database
based on user-specified arguments. If no arguments are provided, all
definitions are returned.

## Usage

``` r
def_minerals(mineral = NULL, mineral_type = NULL, element = NULL)
```

## Arguments

- mineral:

  `character`. The name of a mineral (e.g., "calcite") to return a
  definition for.

- mineral_type:

  `character`. The type of mineral (e.g., "feldspar") to return a
  definition for.

- element:

  `character`. The chemical element abbreviation of a mineral (e.g.,
  "CaCO3") to return a definition for. Note: abbreviations are case
  sensitive.

## Value

A `data.frame` containing the following columns:

- `mineral_id`: The unique identification number of the mineral.

- `mineral`: The name of the mineral.

- `mineral_type`: The name of the type of mineral.

- `formula`: The chemical formula of the mineral.

- `formula_tags`: The chemical formula of the mineral with appropriate
  sub/superscript html tags.

- `url`: A URL for the mineral's entry in
  [Mindat](https://www.mindat.org).

- `hardness_min`: The minimum hardness value (Mohs Hardness Scale) of
  the mineral.

- `hardness_max`: The maximum hardness value (Mohs Hardness Scale) of
  the mineral.

- `crystal_form`: The crystal form of the mineral.

- `mineral_color`: A description of the color of the mineral.

- `lustre`: A description of the lustre of the mineral.

## Developer(s)

Lewis A. Jones

## Reviewer(s)

Bethany Allen

## See also

Geologic features and attributes:
[`def_econs()`](https://rmacrostrat.palaeoverse.org/reference/def_econs.md),
[`def_environments()`](https://rmacrostrat.palaeoverse.org/reference/def_environments.md),
[`def_grain_sizes()`](https://rmacrostrat.palaeoverse.org/reference/def_grain_sizes.md),
[`def_lithologies()`](https://rmacrostrat.palaeoverse.org/reference/def_lithologies.md),
[`def_lithology_att()`](https://rmacrostrat.palaeoverse.org/reference/def_lithology_att.md),
[`def_measurements()`](https://rmacrostrat.palaeoverse.org/reference/def_measurements.md),
[`def_structures()`](https://rmacrostrat.palaeoverse.org/reference/def_structures.md)

## Examples

``` r
# \donttest{
  # Get all mineral definitions
  ex1 <- def_minerals()
  # Get mineral definitions by type
  ex2 <- def_minerals(mineral_type = "element")
# }
```
