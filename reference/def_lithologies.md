# Define lithologies

A function to retrieve the definitions of one or more lithologies in the
Macrostrat database. If no arguments are specified (the default), all
lithology definitions are returned.

## Usage

``` r
def_lithologies(
  lithology = NULL,
  lithology_group = NULL,
  lithology_class = NULL,
  lithology_type = NULL,
  lithology_id = NULL
)
```

## Arguments

- lithology:

  `character`. The name of the desired lithology (e.g., "limestone") to
  return a definition for.

- lithology_group:

  `character`. The name of the desired lithological group (e.g.,
  "unconsolidated") to return a definition for.

- lithology_class:

  `character`. The name of the desired lithological class (e.g.,
  "sedimentary") to return a definition for.

- lithology_type:

  `character`. The name of the desired lithological type (e.g.,
  "siliciclastic") to return a definition for.

- lithology_id:

  `integer`. The unique identification number(s) of one or more
  lithologies to return a definition for.

## Value

A `data.frame` containing the following columns:

- `lith_id`: The unique identification number of the lithology.

- `name`: The name of the lithology.

- `type`: The lithology type, less inclusive than class.

- `group`: The lithology group, less inclusive than type.

- `class`: The lithology class, more inclusive than type.

- `color`: The recommended coloring for the lithology.

- `fill`: The code for the fill pattern as established in the [Federal
  Geographic Data Committee](https://ngmdb.usgs.gov/fgdc_gds/)'s
  [Digital Cartographic Standard for Geologic Map
  Symbolization](https://ngmdb.usgs.gov/fgdc_gds/).

- `t_units`: The total number of Macrostrat units that are partially or
  entirely composed of the lithology.

## Developer(s)

William Gearty

## Reviewer(s)

Bethany Allen

## See also

Geologic features and attributes:
[`def_econs()`](https://rmacrostrat.palaeoverse.org/reference/def_econs.md),
[`def_environments()`](https://rmacrostrat.palaeoverse.org/reference/def_environments.md),
[`def_grain_sizes()`](https://rmacrostrat.palaeoverse.org/reference/def_grain_sizes.md),
[`def_lithology_att()`](https://rmacrostrat.palaeoverse.org/reference/def_lithology_att.md),
[`def_measurements()`](https://rmacrostrat.palaeoverse.org/reference/def_measurements.md),
[`def_minerals()`](https://rmacrostrat.palaeoverse.org/reference/def_minerals.md),
[`def_structures()`](https://rmacrostrat.palaeoverse.org/reference/def_structures.md)

## Examples

``` r
# \donttest{
# return all lithology definitions
ex1 <- def_lithologies()
# return a definition for sandstone
ex2 <- def_lithologies(lithology = "sandstone")
# return definitions for lithologies of a specific type
ex3 <- def_lithologies(lithology_type = "sedimentary")
# return definitions for lithologies using their unique ID numbers
ex4 <- def_lithologies(lithology_id = c(1,5))
# }
```
