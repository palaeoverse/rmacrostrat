# Retrieve Macrostrat column data

A function to retrieve independent, hexagonal, vertical columns which
contain chronostratigraphically organised Macrostrat units.

## Usage

``` r
get_columns(
  column_id = NULL,
  section_id = NULL,
  unit_id = NULL,
  strat_name = NULL,
  strat_name_id = NULL,
  interval_name = NULL,
  interval_id = NULL,
  age = NULL,
  age_top = NULL,
  age_bottom = NULL,
  lat = NULL,
  lng = NULL,
  lithology = NULL,
  lithology_id = NULL,
  lithology_type = NULL,
  lithology_class = NULL,
  lithology_att = NULL,
  lithology_att_id = NULL,
  lithology_att_type = NULL,
  environ = NULL,
  environ_id = NULL,
  environ_type = NULL,
  environ_class = NULL,
  pbdb_collection_no = NULL,
  econ = NULL,
  econ_id = NULL,
  econ_type = NULL,
  econ_class = NULL,
  project_id = NULL,
  adjacents = FALSE,
  sf = FALSE
)
```

## Arguments

- column_id:

  `integer`. Filter columns by their unique identification number(s).

- section_id:

  `integer`. Filter columns to those containing section(s) as specified
  by their unique identification number(s).

- unit_id:

  `integer`. Filter columns to those containing unit(s) as specified by
  their unique identification number(s).

- strat_name:

  `character`. Filter columns to those containing a unit that fuzzy
  matches a stratigraphic name (e.g., "Hell Creek").

- strat_name_id:

  `integer`. Filter columns to those containing a unit that matches one
  or more stratigraphic name(s) as specified by their unique
  identification number(s).

- interval_name:

  `character`. Filter columns to those that overlap with a named
  chronostratigraphic time interval (e.g., "Permian").

- interval_id:

  `integer`. Filter columns to those that overlap with a
  chronostratigraphic time interval as specified by their unique
  identification number(s).

- age:

  `numeric`. Filter columns to those that overlap with the specified
  numerical age, in millions of years before present.

- age_top:

  `numeric`. Filter columns to those that overlap with the age range
  between the specified numerical age and `age_bottom`. Should be in
  millions of years before present. `age_bottom` must also be specified,
  and this must be younger than `age_bottom`.

- age_bottom:

  `numeric`. Filter columns to those that overlap with the age range
  between the specified numerical age and `age_top`. Should be in
  millions of years before present. `age_top` must also be specified,
  and this must be older than `age_top`.

- lat:

  `numeric`. Return the column at the specified decimal degree latitude.
  Must also specify `lng`.

- lng:

  `numeric`. Return the column at the specified decimal degree
  longitude. Must also specify `lat`.

- lithology:

  `character`. Filter columns to those containing a named lithology
  (e.g., "shale", "sandstone").

- lithology_id:

  `integer`. Filter columns to those containing one or more
  lithology(ies) identified by their unique identification number(s).

- lithology_type:

  `character`. Filter columns to those containing a named lithology type
  (e.g., "carbonate", "siliciclastic").

- lithology_class:

  `character`. Filter columns to those containing a named lithology
  class (e.g., "sedimentary", "igneous", "metamorphic").

- lithology_att:

  `character`. Filter columns to those containing a named lithology
  attribute (e.g., "fine", "olivine", "poorly washed").

- lithology_att_id:

  `integer`. Filter columns to those containing one or more lithology
  attribute(s) as specified by their unique identification number(s).

- lithology_att_type:

  `character`. Filter columns to those containing a named category of
  lithology attribute (e.g., "grains", "lithology", "bedform").

- environ:

  `character`. Filter columns to those containing a named environment
  (e.g., "delta plain", "pond").

- environ_id:

  `integer`. Filter columns to those containing one or more
  environment(s) as specified by their unique identification number(s).

- environ_type:

  `character`. Filter columns to those containing a named environment
  type (e.g., "fluvial", "eolian", "glacial").

- environ_class:

  `character`. Filter columns to those containing a named environment
  class (e.g., "marine", "non-marine").

- pbdb_collection_no:

  `integer`. Filter columns to those containing one or more Paleobiology
  Database collection(s) as specified by their unique identification
  number(s).

- econ:

  `character`. Filter columns to those containing a named economic
  attribute (e.g., "brick", "ground water", "gold").

- econ_id:

  `integer`. Filter columns to those containing one or more economic
  attribute(s) as specified by their unique identification number(s).

- econ_type:

  `character`. Filter columns to those containing a named economic
  attribute type (e.g., "construction", "aquifer", "mineral").

- econ_class:

  `character`. Filter columns to those containing a named economic
  attribute class (e.g., "material", "water", "precious commodity").

- project_id:

  `integer`. Filter columns to those contained within a Macrostrat
  project as specified by its unique identification number.

- adjacents:

  `logical`. If `column_id` or `lat`/`lng` is specified, should all
  columns that touch the specified column be returned? Defaults to
  `FALSE`.

- sf:

  `logical`. Should the results be returned as an `sf` object? Defaults
  to `FALSE`.

## Value

A `data.frame` containing the following columns:

- `col_id`: The unique identification number of the Macrostrat column.

- `col_name`: The name of the Macrostrat column.

- `col_group`: Name of the group the column belongs to. Generally
  corresponds to geologic provinces.

- `col_group_id`: The unique identification number of the group to which
  the column belongs.

- `group_col_id`: The original column ID assigned to the column (used in
  the original source).

- `lat`: Decimal degree latitude of the column centroid.

- `lng`: Decimal degree longitude of the column centroid.

- `col_area`: The area of the Macrostrat column in km².

- `project_id`: The unique identification number for project.
  Corresponds to general geographic region.

- `col_type`: The type of column.

- `refs`: The unique identification number(s) for the reference(s)
  associated with the column.

- `max_thick`: The maximum unit thickness in meters.

- `max_min_thick`: The maximum possible minimum thickness in meters.

- `min_min_thick`: The minimum possible minimum thickness in meters.

- `b_age`: The age of the bottom of the column, estimated using the
  continuous time age model, in millions of years before present.

- `t_age`: The age of the top of the column, estimated using the
  continuous time age model, in millions of years before present.

- `b_int_name`: The name of the time interval represented at the bottom
  of the column.

- `t_int_name`: The name of the time interval represented at the top of
  the column.

- `pbdb_collections`: The number of PBDB collections contained within
  the column.

- `lith`: a `data.frame` containing the lithologies present within the
  column, with the following columns:

  - `name`: The named lithology (e.g., "sandstone").

  - `type`: The named lithology type (e.g., "siliciclastic").

  - `class`: The named lithology class (e.g., "sedimentary").

  - `prop`: The proportion of the lithology within the column,
    calculated from the individual Macrostrat units within the column.

  - `lith_id`: The unique identification number of the lithology.

&nbsp;

- `environ`: a `data.frame` containing the environments present within
  the column, with the following columns:

  - `name`: The named environment (e.g., "delta plain").

  - `type`: The named environment type (e.g., "siliciclastic").

  - `class`: The named environment class (e.g., "marine").

  - `prop`: The proportion of the environment within the column,
    calculated from the individual Macrostrat units within the column.

  - `environ_id`: The unique identification number of the environment.

&nbsp;

- `econ`: a `data.frame` containing the economic attributes present
  within the column, with the following columns:

  - `name`: The named economic attribute (e.g., "gold").

  - `type`: The named economic attribute type (e.g., "mineral").

  - `class`: The named economic attribute class (e.g., "precious
    commodity").

  - `prop`: The proportion of the economic attribute out of all economic
    attributes contained within the column, calculated from the
    individual Macrostrat units within the column.

  - `econ_id`: The unique identification number of the economic
    attribute.

- `t_units`: The total number of units contained within the column.

- `t_sections`: The total number of sections contained within the
  column.

If `sf` is `TRUE`, an `sf` object is returned instead, with the same
columns plus a "geometry" column that contains the spatial data.

## Details

More information can be found for the inputs for this function using the
definition functions (beginning with `def_`).

## Developer(s)

William Gearty

## Reviewer(s)

Christopher D. Dean

## See also

Macrostrat data entities:
[`def_columns()`](https://rmacrostrat.palaeoverse.org/reference/def_columns.md),
[`get_age_model()`](https://rmacrostrat.palaeoverse.org/reference/get_age_model.md),
[`get_sections()`](https://rmacrostrat.palaeoverse.org/reference/get_sections.md),
[`get_units()`](https://rmacrostrat.palaeoverse.org/reference/get_units.md)

## Examples

``` r
# \donttest{
# Return columns that overlap with a named chronostratigraphic interval
ex1 <- get_columns(interval_name = "Permian")
# Return columns that overlap with a specified age range
ex2 <- get_columns(age_top = 200, age_bottom = 250)
# Return columns that contain a specific stratigraphic unit, in `sf` format
ex3 <- get_columns(strat_name = "mancos", sf = TRUE)
# Return the columns at a specific geographic coordinate
ex4 <- get_columns(lat = 43, lng = -89, adjacents = TRUE)
# }
```
