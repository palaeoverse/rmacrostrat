# Retrieve Macrostrat column age models

A function to obtain information about the age models used for
Macrostrat columns or sections. This consists of the temporal boundaries
applied to the column's constituent units.

## Usage

``` r
get_age_model(column_id = NULL, section_id = NULL)
```

## Arguments

- column_id:

  `integer`. Filter age models to those associated with column(s) as
  specified by their unique identification number(s).

- section_id:

  `integer`. Filter age models to those associated with section(s) as
  specified by their unique identification number(s).

## Value

A `data.frame` containing, for each boundary between units for each
retrieved age model:

- boundary_id: The unique identification number of the boundary between
  two units.

- col_id: The unique identification number of the Macrostrat column.

- section_id: The unique identification number of the Macrostrat
  section.

- interval_id: The unique identification number of the time interval
  which the boundary lies within.

- interval_name: The name of the time interval which the boundary lies
  within.

- age_bottom: The numerical lower limit on the age of the boundary
  (maximum age), in millions of years before present.

- age_top: The numerical upper limit on the age of the boundary (minimum
  age), in millions of years before present.

- rel_position: The relative position of the boundary.

- model_age: The age of the boundary, as correlated with other ages in
  the column, in millions of years before present.

- boundary_status: The method used to determine the age of the boundary.

- boundary_type: The type of boundary.

- boundary_position: The position of the boundary.

- unit_below: The Macrostrat unit beneath the given boundary.

- unit_above: The Macrostrat unit above the given boundary.

- ref_id: The unique identification number of the reference.

## Details

The Macrostrat age models are used to determine the ages of the
boundaries between units in an internally consistent manner, allowing
each boundary to be dated with respect to all age information available
for the column.

## Developer(s)

Bethany Allen

## Reviewer(s)

Lewis A. Jones

## See also

Macrostrat data entities:
[`def_columns()`](https://rmacrostrat.palaeoverse.org/reference/def_columns.md),
[`get_columns()`](https://rmacrostrat.palaeoverse.org/reference/get_columns.md),
[`get_sections()`](https://rmacrostrat.palaeoverse.org/reference/get_sections.md),
[`get_units()`](https://rmacrostrat.palaeoverse.org/reference/get_units.md)

## Examples

``` r
# \donttest{
 # Get age model for specific columns by ID
 ex1 <- get_age_model(column_id = c(503, 504))
 # Get age model for specific sections by ID
 ex2 <- get_age_model(section_id = c(65, 22))
# }
```
