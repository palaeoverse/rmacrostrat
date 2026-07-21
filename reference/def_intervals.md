# Define Macrostrat time intervals

A function to retrieve Macrostrat time interval definitions matching a
user-specific search criteria. If no arguments are specified (the
default), all time interval definitions are returned.

## Usage

``` r
def_intervals(
  timescale = NULL,
  interval_name = NULL,
  interval_id = NULL,
  age = NULL,
  age_top = NULL,
  age_bottom = NULL,
  rule = NULL,
  true_colors = NULL
)
```

## Arguments

- timescale:

  `character`. The name of the desired timescale to return a definition
  for (e.g., "international epochs").

- interval_name:

  `character`. The name of the desired interval to return a definition
  for.

- interval_id:

  `integer`. The identification number(s) of the desired time interval
  to return a definition for.

- age:

  `numeric`. Age in millions of years before present to return an
  interval definition for. All intervals overlapping with this age will
  be returned.

- age_top:

  `numeric`. The minimum age for which interval definitions should be
  returned, in millions of years before present. If specified,
  `age_bottom` must also be specified, and this must be younger than
  `age_bottom`.

- age_bottom:

  `numeric`. The maximum age for which interval definitions should be
  returned, in millions of years before present. If specified, `age_top`
  must also be specified, and this must be older than `age_top`.

- rule:

  `character`. How should interval definitions be returned for the given
  `age_top` and `age_bottom`? Use "contains" to return all intervals
  that fall entirely within `age_top` and `age_bottom`. Use "exact" to
  return any intervals with both boundaries equal to `age_top` and
  `age_bottom`. Use "loose" (the default) to return all intervals
  touching the range of `age_top` and `age_bottom`. If `age_top` and
  `age_bottom` are not provided, this argument is ignored.

- true_colors:

  `logical`. Should the original international time scale colors be
  returned? Defaults to `TRUE`.

## Value

A `data.frame` containing the following columns:

- `int_id`: The unique identification number of the time interval.

- `name`: The name of the time interval.

- `abbrev`: The standard abbreviation for the time interval name, if one
  exists.

- `t_age`: The top age (minimum age) in millions of years before
  present.

- `b_age`: The bottom age (maximum age) in millions of years before
  present.

- `int_type`: The temporal rank of the interval (e.g., "age", "epoch",
  "chron").

- `timescales`: A `data.frame` containing the timescale(s) that the
  interval is included in (see
  [`def_timescales()`](https://rmacrostrat.palaeoverse.org/reference/def_timescales.md)
  for more details), with the following columns:

  - `timescale_id`: The unique identification number of the timescale.

  - `name`: The name of the timescale.

- `color`: The recommended coloring for units based on dominant
  lithology.

## Developer(s)

Lewis A. Jones

## Reviewer(s)

William Gearty

## See also

Timescales and time intervals:
[`def_timescales()`](https://rmacrostrat.palaeoverse.org/reference/def_timescales.md)

## Examples

``` r
# \donttest{
# Return all intervals
ex1 <- def_intervals()
# Return all specific timescale intervals
ex2 <- def_intervals(timescale = "international ages")
# Return for specific age
ex3 <- def_intervals(timescale = "international ages", age = 70)
# }
```
