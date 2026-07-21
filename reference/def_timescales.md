# Define timescales

A function to retrieve all timescale definitions from the Macrostrat
database. Function is called without user-specified arguments.

## Usage

``` r
def_timescales()
```

## Value

A `data.frame` containing the following columns:

- `timescale_id`: The unique identification number of the timescale.

- `timescale`: The name of the timescale.

- `n_intervals`: The number of intervals within the timescale.

- `max_age`: The maximum age coverage of the timescale in millions of
  years before present.

- `min_age`: The minimum age coverage of the timescale in millions of
  years before present.

- `ref_id`: The unique identification number of the associated
  reference.

## Developer(s)

Lewis A. Jones

## Reviewer(s)

Christopher D. Dean

## See also

Timescales and time intervals:
[`def_intervals()`](https://rmacrostrat.palaeoverse.org/reference/def_intervals.md)

## Examples

``` r
# \donttest{
 # Retrieve all timescale definitions
 ex1 <- def_timescales()
# }
```
