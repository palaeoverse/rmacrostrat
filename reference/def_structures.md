# Define geological structure

A function to retrieve definitions for various geological structures
within the Macrostrat database.

## Usage

``` r
def_structures(
  structure = NULL,
  structure_class = NULL,
  structure_type = NULL,
  structure_id = NULL
)
```

## Arguments

- structure:

  `character`. The name of a geological structure (e.g., "syncline") to
  return a definition for.

- structure_class:

  `character`. The name of the geological structure class (e.g.,
  "sedimentology") to return a definition for.

- structure_type:

  `character`. The name of the geological structure type (e.g., "fault")
  to return a definition for.

- structure_id:

  `integer`. The unique idenfication number(s) of geological
  structures(s) to return a definition for.

## Value

A `data.frame` containing the following columns:

- `structure_id`: The unique identification number of the structure.

- `name`: The name of the structure.

- `structure_type`: Structure type, less inclusive than class.

- `group`: Structure group, less inclusive than type.

- `class`: Structure class, more inclusive than type.

## Developer(s)

William Gearty

## Reviewer(s)

Lewis A. Jones

## See also

Geologic features and attributes:
[`def_econs()`](https://rmacrostrat.palaeoverse.org/reference/def_econs.md),
[`def_environments()`](https://rmacrostrat.palaeoverse.org/reference/def_environments.md),
[`def_grain_sizes()`](https://rmacrostrat.palaeoverse.org/reference/def_grain_sizes.md),
[`def_lithologies()`](https://rmacrostrat.palaeoverse.org/reference/def_lithologies.md),
[`def_lithology_att()`](https://rmacrostrat.palaeoverse.org/reference/def_lithology_att.md),
[`def_measurements()`](https://rmacrostrat.palaeoverse.org/reference/def_measurements.md),
[`def_minerals()`](https://rmacrostrat.palaeoverse.org/reference/def_minerals.md)

## Examples

``` r
# \donttest{
# Get all structure definitions
ex1 <- def_structures()
# Get subset of structure definitions
ex2 <- def_structures(structure_id = c(1, 3))
ex3 <- def_structures(structure_class = "igneous")
# }
```
