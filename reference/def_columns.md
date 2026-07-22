# Define Macrostrat columns

A function to retrieve the definitions for Macrostrat columns. By
default, all definitions are returned.

## Usage

``` r
def_columns(
  column_id = NULL,
  column_group_id = NULL,
  column_name = NULL,
  project_id = NULL,
  status = NULL
)
```

## Arguments

- column_id:

  `integer`. The unique identification number(s) of the desired
  column(s) to return a definition for.

- column_group_id:

  `integer`. The unique identification number(s) of the desired column
  group(s) to return a definition for.

- column_name:

  `character`. The name of the desired column to return a definition
  for.

- project_id:

  `integer`. The unique identification number(s) of the desired
  Macrostrat project(s) to return a definition for.

- status:

  `character`. The status of the column to return a definition for.
  Either "active", "in process", or "obsolete".

## Value

A `data.frame` containing the following columns:

- `col_id`: The unique identification number for the column.

- `col_group_id`: The unique identification number of the group to which
  the column belongs.

- `col_name`: The name of the column.

- `lat`: Latitude of the centroid of the column.

- `lng`: Longitude of the centroid of the column.

- `col_area`: Area of the Macrostrat column, in km².

- `max_thick`: Maximum unit thickness in meters.

- `ref_id`: The unique identification number for the reference
  associated with the column.

- `status`: Indicates the current status of the column (values are
  'active', 'in process', and 'obsolete').

- `t_units`: Total number of Macrostrat units contained within the
  column.

- `project_id`: The unique identification number for the column's
  project. Corresponds to general geographic region.

- `notes`: Column specific notes.

## Developer(s)

William Gearty

## Reviewer(s)

Christopher D. Dean

## See also

Macrostrat data entities:
[`get_age_model()`](https://rmacrostrat.palaeoverse.org/reference/get_age_model.md),
[`get_columns()`](https://rmacrostrat.palaeoverse.org/reference/get_columns.md),
[`get_sections()`](https://rmacrostrat.palaeoverse.org/reference/get_sections.md),
[`get_units()`](https://rmacrostrat.palaeoverse.org/reference/get_units.md)

## Examples

``` r
# \donttest{
# Return all column definitions
ex1 <- def_columns()
# Return subsets of column definitions
ex2 <- def_columns(column_group_id = 17)
ex3 <- def_columns(column_id = c(22,24))
ex4 <- def_columns(column_name = "Eastern Kentucky")
# }
```
