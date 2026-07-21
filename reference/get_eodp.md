# Retrieve core data from ocean drilling programs

A function to retrieve data from the [Extending Ocean Drilling Pursuits
(eODP)](https://eodp.github.io) project, a collation of sedimentary
description data from ocean drilling cores. This currently includes
cores from the Deep Sea Drilling Project (DSDP), Integrated Ocean
Drilling Program (IODP), and Ocean Drilling Program (ODP). Note: eODP
data is currently being integrated into Macrostrat's data entities (e.g.
columns and units) and should be available via
[`get_columns()`](https://rmacrostrat.palaeoverse.org/reference/get_columns.md)
and
[`get_units()`](https://rmacrostrat.palaeoverse.org/reference/get_units.md)
in the future.

## Usage

``` r
get_eodp(column_id = NULL, site = NULL, leg = NULL, program = NULL, sf = FALSE)
```

## Arguments

- column_id:

  `integer`. Filter cores by their unique identification number(s).

- site:

  `character`. Filter cores to those from a particular drilling site
  (e.g., "U1351").

- leg:

  `character`. Filter cores to those from a particular drilling leg or
  expedition (e.g., "317").

- program:

  `character`. Filter cores to those from a particular drilling program
  ("DSDP", "IODP", or "ODP").

- sf:

  `logical`. Should the results be returned as an `sf` object? Defaults
  to `FALSE`.

## Value

A `data.frame` containing, for each retrieved core:

- `col_group`: The name of the drilling program and leg/expedition.

- `site_hole`: The name of the drilling site and hole.

- `date_started`: The date on which drilling commenced.

- `ref_id`: The unique identifier of the reference.

- `col_id`: The unique identifier of the Macrostrat column.

- `lat`: Decimal degree latitude of the core.

- `lng`: Decimal degree longitude of the core.

- `top_depth`: A vector describing the height of the top of each unit.

- `bottom_depth`: A vector describing the height of the bottom of each
  unit.

- `primary_lith`: A vector giving the name of the primary lithology of
  each unit.

- `lith_id`: A vector giving the unique identifier of the primary
  lithology of each unit.

- `minor_lith`: A vector giving the name of the primary lithology of
  each unit.

If `sf` is `TRUE`, an `sf` object is returned instead, with a "geometry"
column that contains the spatial data instead of the `lat`/`lng`
columns.

## Details

More information can be found about the inputs for this function by
using
[`def_drilling_sites()`](https://rmacrostrat.palaeoverse.org/reference/def_drilling_sites.md).

## Developer(s)

Bethany Allen

## Reviewer(s)

William Gearty

## References

Sessa JA, Fraass AJ, LeVay LJ, Jamson KM, and Peters SE. (2023). The
Extending Ocean Drilling Pursuits (eODP) Project: Synthesizing
Scientific Ocean Drilling Data. Geochemistry, Geophysics, Geosystems, 24
(3) e2022GC010655.
[doi:10.1029/2022GC010655](https://doi.org/10.1029/2022GC010655) .

## See also

External data:
[`def_drilling_sites()`](https://rmacrostrat.palaeoverse.org/reference/def_drilling_sites.md),
[`def_measurements()`](https://rmacrostrat.palaeoverse.org/reference/def_measurements.md),
[`get_fossils()`](https://rmacrostrat.palaeoverse.org/reference/get_fossils.md),
[`get_measurements()`](https://rmacrostrat.palaeoverse.org/reference/get_measurements.md)

## Examples

``` r
# \donttest{
# Get data for specific cores
cores <- get_eodp(column_id = c(5081, 5082))
# Get data for all cores at a specific site
cores <- get_eodp(site = "U1351")
# Get data for all cores for a specific leg
cores <- get_eodp(leg = "317")
# Get data for all cores for a specific program
cores <- get_eodp(program = "IODP")
# }
```
