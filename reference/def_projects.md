# Retrieve metadata for Macrostrat projects

A function to obtain information concerning the different Macrostrat
projects. If no arguments are specified (default), data for all projects
are returned.

## Usage

``` r
def_projects(project_id = NULL)
```

## Arguments

- project_id:

  `integer`. The unique identification number(s) of the desired
  project(s) to return a definition for.

## Value

A `data.frame` containing:

- `project_id`: The unique identification number of the Macrostrat
  project.

- `project`: The name of the Macrostrat project.

- `descrip`: Description of the Macrostrat project.

- `timescale_id`: The unique identification number of the timescale used
  in the Macrostrat project.

- `t_cols`: The total number of Macrostrat columns associated with the
  project.

- `in_process_cols`: The total number of in-progress Macrostrat columns
  associated with the project.

- `obsolete_cols`: The total number of obsolete Macrostrat columns
  associated with the project.

- `t_units`: The total number of Macrostrat units associated with the
  project.

- `area`: The area covered by the Macrostrat project in km².

## Developer(s)

Bethany Allen

## Reviewer(s)

Lewis A. Jones

## See also

Macrostrat database metadata:
[`def_references()`](https://rmacrostrat.palaeoverse.org/reference/def_references.md),
[`def_sources()`](https://rmacrostrat.palaeoverse.org/reference/def_sources.md),
[`get_stats()`](https://rmacrostrat.palaeoverse.org/reference/get_stats.md)

## Examples

``` r
# \donttest{
 ex1 <- def_projects()
 ex2 <- def_projects(project_id = 4)
# }
```
