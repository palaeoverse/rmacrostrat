# Retrieve Macrostrat section data

A function to retrieve Macrostrat units contained within gap-bound
packages (sections).

## Usage

``` r
get_sections(
  section_id = NULL,
  column_id = NULL,
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
  lithology_group = NULL,
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
  adjacents = FALSE
)
```

## Arguments

- section_id:

  `integer`. Filter sections by their unique identification number(s).

- column_id:

  `integer`. Filter sections to those contained within column(s) as
  specified by their unique identification number(s).

- unit_id:

  `integer`. Filter sections to those containing unit(s) as specified by
  their unique identification number(s).

- strat_name:

  `character`. Filter sections to those containing a unit that fuzzy
  matches a stratigraphic name (e.g., "Hell Creek").

- strat_name_id:

  `integer`. Filter sections to those containing a unit that matches one
  or more stratigraphic name(s) as specified by their unique
  identification number(s).

- interval_name:

  `character`. Filter sections to those that overlap with a named
  chronostratigraphic time interval (e.g., "Permian").

- interval_id:

  `integer`. Filter sections to those that overlap with a
  chronostratigraphic time interval as specified by their unique
  identification number(s).

- age:

  `numeric`. Filter sections to those that overlap with the specified
  numerical age, in millions of years before present.

- age_top:

  `numeric`. Filter sections to those that overlap with the age range
  between the specified numerical age and `age_bottom`. Should be in
  millions of years before present. `age_bottom` must also be specified,
  and this must be younger than `age_bottom`.

- age_bottom:

  `numeric`. Filter sections to those that overlap with the age range
  between the specified numerical age and `age_top`. Should be in
  millions of years before present. `age_top` must also be specified,
  and this must be older than `age_top`.

- lat:

  `numeric`. Return the sections at the specified decimal degree
  latitude. Must also specify `lng`.

- lng:

  `numeric`. Return the sections at the specified decimal degree
  longitude. Must also specify `lat`.

- lithology:

  `character`. Filter sections to those containing a named lithology
  (e.g., "shale", "sandstone").

- lithology_id:

  `integer`. Filter sections to those containing one or more
  lithology(ies) as specified by their unique identification number(s).

- lithology_group:

  `character`. Filter sections to those containing a named lithology
  group (e.g., "sandstones", "mudrocks", "unconsolidated").

- lithology_type:

  `character`. Filter sections to those containing a named lithology
  type (e.g., "carbonate", "siliciclastic").

- lithology_class:

  `character`. Filter sections to those containing a named lithology
  class (e.g., "sedimentary", "igneous", "metamorphic").

- lithology_att:

  `character`. Filter sections to those containing a named lithology
  attribute (e.g., "fine", "olivine", "poorly washed").

- lithology_att_id:

  `integer`. Filter sections to those containing one or more lithology
  attribute(s) as specified by their unique identification number(s).

- lithology_att_type:

  `character`. Filter sections to those containing a named category of
  lithology attribute (e.g., "grains", "lithology", "bedform").

- environ:

  `character`. Filter sections to those containing a named environment
  (e.g., "delta plain", "pond").

- environ_id:

  `integer`. Filter sections to those containing one or more
  environment(s) as specified by their unique identification number(s).

- environ_type:

  `character`. Filter sections to those containing a named environment
  type (e.g., "fluvial", "eolian", "glacial").

- environ_class:

  `character`. Filter sections to those containing a named environment
  class (e.g., "marine", "non-marine").

- pbdb_collection_no:

  `integer`. Filter sections to those containing one or more
  Paleobiology Database collection(s) as specified by their unique
  identification number(s).

- econ:

  `character`. Filter sections to those containing a named economic
  attribute (e.g., "brick", "ground water", "gold").

- econ_id:

  `integer`. Filter sections to those containing one or more economic
  attribute(s) as specified by their unique identification number(s).

- econ_type:

  `character`. Filter sections to those containing a named economic
  attribute type (e.g., "construction", "aquifer", "mineral").

- econ_class:

  `character`. Filter sections to those containing a named economic
  attribute class (e.g., "material", "water", "precious commodity").

- project_id:

  `integer`. Filter sections to those contained within one or more
  Macrostrat project(s) as specified by their unique identification
  number(s).

- adjacents:

  `logical`. If `column_id` or `lat`/`lng` is specified, should all
  sections that touch the specified column be returned? Defaults to
  `FALSE`.

## Value

A `dataframe` containing the following columns:

- `col_id`: The unique identification number of the Macrostrat column
  containing the section.

- `col_area`: The area of the associated Macrostrat column in km².

- `section_id`: The unique identification number of the Macrostrat
  section.

- `project_id`: The unique identification number of the Macrostrat
  project.

- `max_thick`: The maximum thickness of the section, in meters.

- `min_thick`: The minimum thickness of the section, in meters.

- `t_age`: The age of the top of the section, estimated using the
  continuous time age model, in millions of years before present.

- `b_age`: The age of the bottom of the section, estimated using the
  continuous time age model, in millions of years before present.

- `pbdb_collections`: The number of PBDB collections contained within
  the section.

- `lith`: a `dataframe` containing the lithologies present within the
  section, with the following columns:

  - `name`: The named lithology (e.g., "sandstone").

  - `type`: The named lithology type (e.g., "siliciclastic").

  - `class`: The named lithology class (e.g., "sedimentary").

  - `prop`: The proportion of the lithology within the section,
    calculated from the individual Macrostrat units within the section.

  - `lith_id`: The unique identification number of the lithology.

&nbsp;

- `environ`: a `dataframe` containing the environments present within
  the section, with the following columns:

  - `name`: The named environment (e.g., "delta plain").

  - `type`: The named environment type (e.g., "siliciclastic").

  - `class`: The named environment class (e.g., "marine").

  - `prop`: The proportion of the environment within the section,
    calculated from the individual Macrostrat units within the section.

  - `environ_id`: The unique identification number of the environment.

&nbsp;

- `econ`: a `dataframe` containing the economic attributes present
  within the section, with the following columns:

  - `name`: The named economic attribute (e.g., "gold").

  - `type`: The named economic attribute type (e.g., "mineral").

  - `class`: The named economic attribute class (e.g., "precious
    commodity").

  - `prop`: The proportion of the economic attribute out of all economic
    attributes contained within the section, calculated from the
    individual Macrostrat units within the section.

  - `econ_id`: The unique identification number of the economic
    attribute.

## Details

More information can be found for the inputs for this function using the
definition functions (beginning with `defs_`).

## Developer(s)

Christopher D. Dean

## Reviewer(s)

Bethany Allen

## See also

Macrostrat data entities:
[`def_columns()`](https://rmacrostrat.palaeoverse.org/reference/def_columns.md),
[`get_age_model()`](https://rmacrostrat.palaeoverse.org/reference/get_age_model.md),
[`get_columns()`](https://rmacrostrat.palaeoverse.org/reference/get_columns.md),
[`get_units()`](https://rmacrostrat.palaeoverse.org/reference/get_units.md)

## Examples

``` r
# \donttest{
# Get sections within a specified column
ex1 <- get_sections(column_id = 10)
# Get sections at a specific geographic coordinate
ex2 <- get_sections(lng = -110.9, lat = 48.4)
# }
```
