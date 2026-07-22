# Define environments

A function to retrieve the definitions for one or more environments in
the Macrostrat database. By default, all environment definitions are
returned.

## Usage

``` r
def_environments(
  environ = NULL,
  environ_type = NULL,
  environ_class = NULL,
  environ_id = NULL
)
```

## Arguments

- environ:

  `character`. The name of a specific environment (e.g., "reef") to
  return a definition for.

- environ_type:

  `character`. The name of a type of environment (e.g., "carbonate") to
  return a definition for.

- environ_class:

  `character`. The name of a class of environment (e.g., "marine") to
  return a definition for.

- environ_id:

  `integer`. The unique identification number of the desired environment
  to return a definition for.

## Value

A `data.frame` containing the following columns:

- `environ_id`: The unique identification number of the environment.

- `name`: The name of the environment.

- `type`: Environment type, less inclusive than class.

- `class`: Environment class, more inclusive than type.

- `color`: Recommended coloring for environment, based on the dominant
  lithology.

- `t_units`: The total number of Macrostrat units that are partially, or
  entirely, composed of the environment.

## Developer(s)

Christopher D. Dean

## Reviewer(s)

Lewis A. Jones

## See also

Geologic features and attributes:
[`def_econs()`](https://rmacrostrat.palaeoverse.org/reference/def_econs.md),
[`def_grain_sizes()`](https://rmacrostrat.palaeoverse.org/reference/def_grain_sizes.md),
[`def_lithologies()`](https://rmacrostrat.palaeoverse.org/reference/def_lithologies.md),
[`def_lithology_att()`](https://rmacrostrat.palaeoverse.org/reference/def_lithology_att.md),
[`def_measurements()`](https://rmacrostrat.palaeoverse.org/reference/def_measurements.md),
[`def_minerals()`](https://rmacrostrat.palaeoverse.org/reference/def_minerals.md),
[`def_structures()`](https://rmacrostrat.palaeoverse.org/reference/def_structures.md)

## Examples

``` r
# \donttest{
# Return all environment definitions
ex1 <- def_environments()
# Return subsets of environment definitions
ex2 <- def_environments(environ = "reef")
ex3 <- def_environments(environ_type = "carbonate")
ex4 <- def_environments(environ_class = "marine")
# }
```
