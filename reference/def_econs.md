# Define economic resources

A function to retrieve the definitions for one or more economic
resources in the Macrostrat database. By default, all economic
definitions are returned.

## Usage

``` r
def_econs(econ = NULL, econ_type = NULL, econ_class = NULL, econ_id = NULL)
```

## Arguments

- econ:

  `character`. The name of the economic resource (e.g., "gas reservoir")
  to return a definition for.

- econ_type:

  `character`. The type of economic resource (e.g., "hydrocarbon") to
  return a definition for.

- econ_class:

  `character`. The class of economic resource (e.g., "energy") to return
  a definition for.

- econ_id:

  `integer`. The unique identification number(s) of the economic
  resource(s) to return a definition for.

## Value

A `data.frame` containing the following columns:

- `econ_id`: The unique identifier of the economic resource.

- `name`: The name of the economic resource.

- `type`: The type of economic resource.

- `class`: The class of economic resource.

- `color`: The recommended coloring for units based on the dominant
  lithology.

- `t_units`: The total number of Macrostrat units containing the
  economic resource.

## Developer(s)

Bethany Allen

## Reviewer(s)

William Gearty

## See also

Geologic features and attributes:
[`def_environments()`](https://rmacrostrat.palaeoverse.org/reference/def_environments.md),
[`def_grain_sizes()`](https://rmacrostrat.palaeoverse.org/reference/def_grain_sizes.md),
[`def_lithologies()`](https://rmacrostrat.palaeoverse.org/reference/def_lithologies.md),
[`def_lithology_att()`](https://rmacrostrat.palaeoverse.org/reference/def_lithology_att.md),
[`def_measurements()`](https://rmacrostrat.palaeoverse.org/reference/def_measurements.md),
[`def_minerals()`](https://rmacrostrat.palaeoverse.org/reference/def_minerals.md),
[`def_structures()`](https://rmacrostrat.palaeoverse.org/reference/def_structures.md)

## Examples

``` r
# \donttest{
# Return all economic resource definitions
econ_inf <- def_econs()
# Return only definitions for hydrocarbon resources
econ_inf <- def_econs(econ_type = "hydrocarbon")
# }
```
