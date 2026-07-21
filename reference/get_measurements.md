# Retrieve geological measurements

Retrieve a range of measurements relevant to making geological
inferences.

## Usage

``` r
get_measurements(
  measure_id = NULL,
  measurement_id = NULL,
  measurement = NULL,
  measurement_type = NULL,
  measurement_class = NULL,
  measuremeta_id = NULL,
  measure_phase = NULL,
  column_id = NULL,
  section_id = NULL,
  unit_id = NULL,
  interval_name = NULL,
  lithology_id = NULL,
  lithology_type = NULL,
  lithology_class = NULL,
  project_id = NULL,
  sf = FALSE
)
```

## Arguments

- measure_id:

  `integer`. Filter measurements to those of one or more unique
  identification number(s).

- measurement_id:

  `integer`. Filter measurements to those of one or more measurement
  definition(s) as specified by their unique identification number(s).

- measurement:

  `character`. Filter measurements to those of one or more measurement
  definition(s) as specified by their name (e.g., "Pb" or "transport
  direction").

- measurement_type:

  `character`. Filter measurements to those of one or more measurement
  definition type(s) (e.g., "major elements", "geochronological").

- measurement_class:

  `character`. Filter measurements to those of one or more measurement
  definition class(es) (e.g., "geochemical", "geophysical").

- measuremeta_id:

  `integer`. Filter measurements to those of one or more measurement
  metadata(s) (usually refers to a sample) as specified by their unique
  identification number(s).

- measure_phase:

  `character`. Filter measurements by the phase from which the
  measurement was taken (e.g., "zircon", "whole rock").

- column_id:

  `integer`. Filter measurements to those within one or more column(s)
  as specified by their unique identification number(s).

- section_id:

  `integer`. Filter measurements to those within one or more section(s)
  as specified by their unique identification number(s).

- unit_id:

  `integer`. Filter measurements to those within one or more unit(s) as
  specified by their unique identification number(s).

- interval_name:

  `character`. Filter measurements to those from units within or
  touching a named interval(s) (e.g., "Permian").

- lithology_id:

  `integer`. Filter measurements to those of one or more lithology(ies)
  as specified by their unique identification number(s).

- lithology_type:

  `character`. Filter measurements to those of one or more lithology
  type(s) (e.g., "carbonate", "siliciclastic").

- lithology_class:

  `character`. Filter measurements to those of one or more lithology
  class(es) (e.g., "sedimentary", "igneous", "metamorphic").

- project_id:

  `integer`. Filter measurements by the unique identification number(s)
  of the Macrostrat project(s).

- sf:

  `logical`. Should the results be returned as an `sf` object? Defaults
  to `FALSE`.

## Value

A `data.frame` containing the following columns:

- `measurement_id`: The unique identification number of the measurement.

- `measuremeta_id`: The unique identification number of the sample.

- `measurement`: The name of the type of measurement obtained.

- `measure_units`: The units of the measurement.

- `measure_phase`: The phase from which the measurement was taken.

- `method`: The method used to generate the measurement.

- `n`: The number of observations or measurements.

- `ref_id`: The unique identification number of the reference associated
  with the measurement.

- `sample_name`: The name of the sample.

- `geo_unit`: The Macrostrat unit from which the measurement was taken.

- `samp_lith`: A lithological description of the rock from which the
  measurement was taken.

- `samp_lith_id`: The unique identification number of the lithological
  description of the rock from which the measurement was taken.

- `samp_desc`: A description of the sample used to generate the
  measurement.

- `samp_age`: The geological time interval assigned to the measurement.

- `lat`: Decimal degree latitude of the measurement.

- `lng`: Decimal degree longitude of the measurement.

- `unit_id`: The unique identification number of the Macrostrat unit
  from which the measurement was taken.

- `unit_rel_pos`: The relative positive of the sample within the unit.

- `col_id`: The unique identification number of the Macrostrat column
  from which the measurement was taken.

- `strat_name_id`: The unique identification number of the stratigraphic
  name attributed to the unit from which the measurement was taken.

- `match_basis`: A terse description of how the measuremeta data was
  linked to the Macrostrat unit.

- `ref`: The name of the reference.

- `measure_value`: The value of the measurement.

- `measure_error`: The reported error on the measurement value.

- `measure_position`: The position of the measurement in the Macrostrat
  column.

- `measure_n`: The number of measurements used to generate the
  measure_value; if greater than one, usually used to produce the
  measure_error.

- `sample_no`: The sample number for the measurement.

- `error_units`: The units of the error.

If `sf` = `TRUE`, an `sf` object is returned instead, with the same
columns plus a "geometry" column that contains the spatial data.

## Details

More information can be found about the inputs and outputs for this
function by using
[`def_measurements()`](https://rmacrostrat.palaeoverse.org/reference/def_measurements.md).

## Developer(s)

Bethany Allen

## Reviewer(s)

Christopher D. Dean

## See also

External data:
[`def_drilling_sites()`](https://rmacrostrat.palaeoverse.org/reference/def_drilling_sites.md),
[`def_measurements()`](https://rmacrostrat.palaeoverse.org/reference/def_measurements.md),
[`get_eodp()`](https://rmacrostrat.palaeoverse.org/reference/get_eodp.md),
[`get_fossils()`](https://rmacrostrat.palaeoverse.org/reference/get_fossils.md)

## Examples

``` r
# \donttest{
# Return measurements based on their specific IDs
ex1 <- get_measurements(measure_id = c(353, 354))
# Return measurements based on the ID of a specific measurement definition
ex2 <- get_measurements(measurement_id = 42)
# Return measurements for a specific measurement type
ex3 <- get_measurements(measurement = "SiO2")
# }
```
