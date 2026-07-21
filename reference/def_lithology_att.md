# Define lithology attributes

A function to retrieve the definitions for one or more lithology
attributes in the Macrostrat database. By default, all lithology
attribute definitions are returned.

## Usage

``` r
def_lithology_att(
  lithology_att = NULL,
  att_type = NULL,
  lithology_att_id = NULL
)
```

## Arguments

- lithology_att:

  `character`. The name of the lithology attribute (e.g.,
  "cross-bedded") to return a definition for.

- att_type:

  `character`. The type of lithology attribute (e.g., "sed structure")
  to return a definition for.

- lithology_att_id:

  `integer`. The unique identification number(s) of lithology
  attribute(s) to return a definition for.

## Value

A `data.frame` containing the following columns:

- `lith_att_id`: The unique identifier of the lithology attribute.

- `name`: The name of the lithology attribute.

- `type`: The lithology attribute type.

- `t_units`: The total number of Macrostrat units to which the lithology
  attribute is attached.

## Developer(s)

Bethany Allen

## Reviewer(s)

Christopher D. Dean

## See also

Geologic features and attributes:
[`def_econs()`](https://rmacrostrat.palaeoverse.org/reference/def_econs.md),
[`def_environments()`](https://rmacrostrat.palaeoverse.org/reference/def_environments.md),
[`def_grain_sizes()`](https://rmacrostrat.palaeoverse.org/reference/def_grain_sizes.md),
[`def_lithologies()`](https://rmacrostrat.palaeoverse.org/reference/def_lithologies.md),
[`def_measurements()`](https://rmacrostrat.palaeoverse.org/reference/def_measurements.md),
[`def_minerals()`](https://rmacrostrat.palaeoverse.org/reference/def_minerals.md),
[`def_structures()`](https://rmacrostrat.palaeoverse.org/reference/def_structures.md)

## Examples

``` r
# \donttest{
# Return all lithology attribute definitions
ex1 <- def_lithology_att()
# Return subsets of lithology attribute definitions
ex2 <- def_lithology_att(att_type = "sed structure")
# }
```
