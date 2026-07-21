# Define measurements

A function to retrieve the definitions of different measurements that
are included in the Macrostrat database. By default, all definitions are
returned.

## Usage

``` r
def_measurements(
  measure_id = NULL,
  measurement_type = NULL,
  measurement_class = NULL
)
```

## Arguments

- measure_id:

  `integer`. The unique identification number(s) of the desired
  measurement(s) to return a definition for.

- measurement_type:

  `character`. Filter the returned definitions to those of one or more
  named type(s) of measurement (e.g., "geochronological"). This is a
  less inclusive grouping than `measurement_class`.

- measurement_class:

  `character`. Filter the returned definitions to those of one or more
  named class(es) of measurement (e.g., "geochemical"). This is a more
  inclusive grouping than `measurement_type`.

## Value

A `data.frame` containing the following columns:

- `measure_id`: The unique identification number of the measurement.

- `name`: The name of the measurement.

- `type`: Measurement type, less inclusive than class

- `class`: Measurement class, more inclusive than type.

- `t_units`: The total number of Macrostrat units containing this
  measurement.

## Developer(s)

William Gearty

## Reviewer(s)

Christopher D. Dean

## See also

External data:
[`def_drilling_sites()`](https://rmacrostrat.palaeoverse.org/reference/def_drilling_sites.md),
[`get_eodp()`](https://rmacrostrat.palaeoverse.org/reference/get_eodp.md),
[`get_fossils()`](https://rmacrostrat.palaeoverse.org/reference/get_fossils.md),
[`get_measurements()`](https://rmacrostrat.palaeoverse.org/reference/get_measurements.md)

Geologic features and attributes:
[`def_econs()`](https://rmacrostrat.palaeoverse.org/reference/def_econs.md),
[`def_environments()`](https://rmacrostrat.palaeoverse.org/reference/def_environments.md),
[`def_grain_sizes()`](https://rmacrostrat.palaeoverse.org/reference/def_grain_sizes.md),
[`def_lithologies()`](https://rmacrostrat.palaeoverse.org/reference/def_lithologies.md),
[`def_lithology_att()`](https://rmacrostrat.palaeoverse.org/reference/def_lithology_att.md),
[`def_minerals()`](https://rmacrostrat.palaeoverse.org/reference/def_minerals.md),
[`def_structures()`](https://rmacrostrat.palaeoverse.org/reference/def_structures.md)

## Examples

``` r
# \donttest{
# Return all definitions
ex1 <- def_measurements()
# Return subsets of definitions
ex2 <- def_measurements(measure_id = c(1, 2, 4))
ex3 <- def_measurements(measurement_class = "geochemical")
# }
```
