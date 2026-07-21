# Retrieve Macrostrat unit data

A function to retrieve Macrostrat unit data matching a user-specified
search criteria.

## Usage

``` r
get_units(
  unit_id = NULL,
  section_id = NULL,
  column_id = NULL,
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
  adjacents = FALSE,
  sf = FALSE
)
```

## Arguments

- unit_id:

  `integer`. Filter units by their unique identification number(s).

- section_id:

  `integer`. Filter units to those contained within section(s) as
  specified by their unique identification number(s).

- column_id:

  `integer`. Filter units to those contained within column(s) as
  specified by their unique identification number(s).

- strat_name:

  `character`. Filter units to those containing a unit that fuzzy
  matches a stratigraphic name (e.g., "Hell Creek").

- strat_name_id:

  `integer`. Filter units to those that match one or more stratigraphic
  name(s) as specified by their unique identification number(s).

- interval_name:

  `character`. Filter units to those that overlap with a named
  chronostratigraphic time interval (e.g., "Permian").

- interval_id:

  `integer`. Filter units to those that overlap with one or more
  chronostratigraphic time interval(s) as specified by their unique
  identification number(s).

- age:

  `numeric`. Filter units to those that overlap with the specified
  numerical age, in millions of years before present.

- age_top:

  `numeric`. Filter units to those that overlap with the age range
  between the specified numerical age and `age_bottom`. Should be in
  millions of years before present. `age_bottom` must also be specified,
  and `age_top` must be younger than `age_bottom`.

- age_bottom:

  `numeric`. Filter units to those that overlap with the age range
  between the specified numerical age and `age_top`. Should be in
  millions of years before present. `age_top` must also be specified,
  and `age_bottom` must be older than `age_top`.

- lat:

  `numeric`. Return the units at the specified decimal degree latitude.
  Must also specify `lng`.

- lng:

  `numeric`. Return the units at the specified decimal degree longitude.
  Must also specify `lat`.

- lithology:

  `character`. Filter units to those containing a named lithology (e.g.,
  "shale", "sandstone").

- lithology_id:

  `integer`. Filter units to those containing one or more lithology(ies)
  as specified by their unique identification number(s).

- lithology_group:

  `character`. Filter units to those containing a named lithology group
  (e.g., "sandstones", "mudrocks", "unconsolidated").

- lithology_type:

  `character`. Filter units to those containing a named lithology type
  (e.g., "carbonate", "siliciclastic").

- lithology_class:

  `character`. Filter units to those containing a named lithology class
  (e.g., "sedimentary", "igneous", "metamorphic").

- lithology_att:

  `character`. Filter units to those containing a named lithology
  attribute (e.g., "fine", "olivine", "poorly washed").

- lithology_att_id:

  `integer`. Filter units to those containing one or more lithology
  attribute(s) as specified by their unique identification number(s).

- lithology_att_type:

  `character`. Filter units to those containing a named category of
  lithology attribute (e.g., "grains", "lithology", "bedform").

- environ:

  `character`. Filter units to those containing a named environment
  (e.g., "delta plain", "pond").

- environ_id:

  `integer`. Filter units to those containing one or more environment(s)
  as specified by their unique identification number(s).

- environ_type:

  `character`. Filter units to those containing a named environment type
  (e.g., "fluvial", "eolian", "glacial").

- environ_class:

  `character`. Filter units to those containing a named environment
  class (e.g., "marine", "non-marine").

- pbdb_collection_no:

  `integer`. Filter units to those containing one or more Paleobiology
  Database collection(s) as specified by their unique identification
  number(s).

- econ:

  `character`. Filter units to those containing a named economic
  attribute (e.g., "brick", "ground water", "gold").

- econ_id:

  `integer`. Filter units to those containing one or more economic
  attribute(s) as specified by their unique identification number(s).

- econ_type:

  `character`. Filter units to those containing a named economic
  attribute type (e.g., "construction", "aquifer", "mineral").

- econ_class:

  `character`. Filter units to those containing a named economic
  attribute class (e.g., "material", "water", "precious commodity").

- project_id:

  `integer`. Filter units to those contained within one or more
  Macrostrat project(s) as specified by their unique identification
  number(s).

- adjacents:

  `logical`. If `column_id` or `lat`/`lng` is specified, should all
  units that touch the specified column be returned? Defaults to
  `FALSE`.

- sf:

  `logical`. Should the results be returned as an `sf` object? Defaults
  to `FALSE`.

## Value

A `data.frame` containing the following columns:

- `unit_id`: The unique identification number of the Macrostrat unit.

- `section_id`: The unique identification number of the Macrostrat
  section containing the unit.

- `col_id`: The unique identification number of the Macrostrat column
  containing the unit.

- `project_id`: The unique identification number of the Macrostrat
  project.

- `col_area`: The area of the associated Macrostrat column in km².

- `unit_name`: The name of the Macrostrat unit.

- `strat_name_id`: The unique Macrostrat stratigraphic name ID.

- `Mbr`: The lithostratigraphic member.

- `Fm`: The lithostratigraphic formation.

- `Gp`: The lithostratigraphic group.

- `SGp`: The lithostratigraphic supergroup.

- `t_age`: The age of the top of the unit, estimated using the
  continuous time age model, in millions of years before present.

- `b_age`: The age of the bottom of the unit, estimated using the
  continuous time age model, in millions of years before present.

- `max_thick`: The maximum thickness of the unit, in meters.

- `min_thick`: The minimum thickness of the unit, in meters.

- `outcrop`: Type of exposure ("outcrop", "subsurface", or "both").

- `pbdb_collections`: The number of Paleobiology Database collections
  contained within the unit.

- `pbdb_occurrences`: The number of Paleobiology Database occurrences
  contained within the unit.

- `lith`: a `dataframe` containing the lithologies present within the
  unit, with the following columns:

  - `name`: The named lithology (e.g., "sandstone").

  - `prop`: The proportion of the lithology within the unit, calculated
    from the individual Macrostrat sub-units within the unit.

  - `lith_id`: The unique identification number of the lithology.

  - `type`: The named lithology type (e.g., "siliciclastic").

  - `class`: The named lithology class (e.g., "sedimentary").

- `environ`: a `dataframe` containing the environments present within
  the unit, with the following columns:

  - `class`: The named environment class (e.g., "marine").

  - `type`: The named environment type (e.g., "siliciclastic").

  - `name`: The named environment (e.g., "delta plain").

  - `environ_id`: The unique identification number of the environment.

- `econ`: a `dataframe` containing the economic attributes present
  within the unit, with the following columns:

  - `type`: The named economic attribute type (e.g., "mineral").

  - `name`: The named economic attribute (e.g., "gold").

  - `econ_id`: The unique identification number of the economic
    attribute.

  - `class`: The named economic attribute class (e.g., "precious
    commodity").

- `measure`: a `dataframe` containing the measure attributes present
  within the unit, with the following columns:

  - `measure_class`: The class of measures (e.g., "geochemical").

  - `measure_type`: the type of measures (e.g., "minor elements").

- `notes`: Unit specific notes.

- `color`: Recommended coloring for units based on dominant lithology.

- `text_color`: Recommended coloring for text based on color.

- `t_int_id`: The ID of the chronostratigraphic interval containing the
  top boundary of the unit.

- `t_int_name`: The name of the time interval represented at the top of
  the unit.

- `t_int_age`: The age of the chronostratigraphic interval containing
  the top boundary of the unit.

- `t_prop`: Position of continuous time age model top boundary,
  proportional to reference time interval (t_int_name).

- `units_above`: The unit_ids of the units contacting the top of the
  unit.

- `b_int_id`: The ID of the chronostratigraphic interval containing the
  bottom boundary of the unit.

- `b_int_name`: The name of the time interval represented at the bottom
  of the unit.

- `b_int_age`: The age of the chronostratigraphic interval containing
  the bottom boundary of the unit.

- `b_prop`: Position of continuous time age model bottom boundary,
  proportional to reference time interval (b_interval).

- `units_below`: The unit_ids of the units contacting the bottom of the
  unit.

- `strat_name_long`: The stratigraphic name associated with the unit
  (e.g., "Coal Valley Formation").

- `refs`: The unique identification number(s) of the reference(s)
  associated with the unit.

- `clat`: The present day latitude of the centroid of the column to
  which the unit belongs.

- `clng`: The present day longitude of the centroid of the column to
  which the unit belongs.

- `t_plat`: The paleolatitude of the centroid of the column which the
  unit belongs to at top age (`clat` rotated to `t_age`).

- `t_plng`: The paleolongitude of the centroid of the column which the
  unit belongs to at top age (`clng` rotated to `t_age`) .

- `b_plat`: The paleolatitude of the centroid of the column which the
  unit belongs to at bottom age (`clat` rotated to `b_age`).

- `b_plng`: The paleolongitude of the the centroid of the column which
  the unit belongs to at bottom age (`clng` rotated to `b_age`).

If `sf` is `TRUE`, an `sf` object is returned instead, with a "geometry"
column that contains the spatial data instead of the `clat`/`clng`
columns.

## Details

More information can be found for the inputs for this function using the
definition functions (beginning with `def_`).

## Developer(s)

Lewis A. Jones

## Reviewer(s)

William Gearty

## See also

Macrostrat data entities:
[`def_columns()`](https://rmacrostrat.palaeoverse.org/reference/def_columns.md),
[`get_age_model()`](https://rmacrostrat.palaeoverse.org/reference/get_age_model.md),
[`get_columns()`](https://rmacrostrat.palaeoverse.org/reference/get_columns.md),
[`get_sections()`](https://rmacrostrat.palaeoverse.org/reference/get_sections.md)

## Examples

``` r
# \donttest{
# Get units with a specific stratigraphic name
ex1 <- get_units(strat_name = "Hell Creek")
# Get units at a specific geographic coordinate
ex2 <- get_units(lng = -110.9, lat = 48.4)
# }
```
