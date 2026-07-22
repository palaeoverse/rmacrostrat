# Define objects associated with eODP

Obtain metadata for variables associated with the [Extending Ocean
Drilling Pursuits (eODP)](https://eodp.github.io) project. By default,
data for all drilling sites are returned.

## Usage

``` r
def_drilling_sites(program = NULL, exp = NULL, site = NULL, sf = FALSE)
```

## Arguments

- program:

  `character`. The name of a drilling program (i.e., "DSDP", "ODP", or
  "IODP") to return a definition for.

- exp:

  `character`. The unique identification number(s) of drilling
  expedition(s) to return a definition for (formerly known as 'leg(s)').

- site:

  `character`. The unique identification number(s) of drilling site(s)
  to return a definition for.

- sf:

  `logical`. Should the results be returned as an `sf` object? Defaults
  to `FALSE`.

## Value

A `data.frame` object containing, for each retrieved core:

- `epoch`: The name of the drilling program.

- `leg`: The name of the expedition (formerly known as a 'leg').

- `site`: The name of the drilling site.

- `hole`: The name of the drilling hole.

- `lat`: The decimal degree latitude of the drilling hole.

- `lng`: The decimal degree longitude of the drilling hole.

- `col_id`: The unique identification number of the eODP column.

- `col_group_id`: The unique identification number of the group to which
  the eODP column belongs.

- `penetration`: The depth of the hole drilled, in meters.

- `cored`: The amount of rock cored from the drill hole, in meters.

- `recovered`: The amount of rock recovered from the core, in meters.

- `recovery`: The proportion of rock recovered from the core.

- `drilled_interval`: The interval drilled.

- `drilled_intervals`: The number of drilled intervals.

- `cores`: The total number of cores drilled at the hole.

- `date_started`: The date on which drilling commenced.

- `date_finished`: The date on which drilling concluded.

- `comments`: Written notes assigned to the core.

- `ref_id`: The unique identification number of the reference.

If `sf` is `TRUE`, an `sf` object is returned instead, with a "geometry"
column that contains the spatial data instead of the `lat`/`lng`
columns.

## Developer(s)

Bethany Allen

## Reviewer(s)

Christopher D. Dean

## References

Sessa JA, Fraass AJ, LeVay LJ, Jamson KM, and Peters SE. (2023). The
Extending Ocean Drilling Pursuits (eODP) Project: Synthesizing
Scientific Ocean Drilling Data. Geochemistry, Geophysics, Geosystems, 24
(3) e2022GC010655.
[doi:10.1029/2022GC010655](https://doi.org/10.1029/2022GC010655) .

## See also

External data:
[`def_measurements()`](https://rmacrostrat.palaeoverse.org/reference/def_measurements.md),
[`get_eodp()`](https://rmacrostrat.palaeoverse.org/reference/get_eodp.md),
[`get_fossils()`](https://rmacrostrat.palaeoverse.org/reference/get_fossils.md),
[`get_measurements()`](https://rmacrostrat.palaeoverse.org/reference/get_measurements.md)

## Examples

``` r
# \donttest{
# Return all core information for a specific site
core_info <- def_drilling_sites(site = "U1547")
# }
```
