# Retrieve paleogeographic geometries

A function to retrieve paleogeographic geometries reconstructed to a
given a age or interval using the Wright et al. (2013) Global Plate
Model.

## Usage

``` r
get_paleogeography(age = NULL, interval_name = NULL)
```

## Arguments

- age:

  `numeric`. Return a paleogeographic reconstruction based on a
  numerical age in millions of years before present (between 0 and 550).

- interval_name:

  `character`. Return a paleogeographic reconstruction based on a
  specified time interval. Ignored if `age` is supplied.

## Value

An `sf` object containing the geometries of the paleogeographic map.

## Details

More information for appropriate interval inputs for this function can
be found using the
[`def_intervals()`](https://rmacrostrat.palaeoverse.org/reference/def_intervals.md)
function.

## Developer(s)

Lewis A. Jones

## Reviewer(s)

Christopher D. Dean

## References

Wright, N., Zahirovic, S., Müller, R.D., Seton, M. (2013). Towards
community-driven paleogeographic reconstructions: integrating
open-access paleogeographic and paleobiology data with plate tectonics.
Biogeosciences, 10, 1529–1541.
[doi:10.5194/bg-10-1529-2013](https://doi.org/10.5194/bg-10-1529-2013) .

## See also

Paleogeography:
[`def_plates()`](https://rmacrostrat.palaeoverse.org/reference/def_plates.md)

## Examples

``` r
# \donttest{
 # Get paleogeographic map via age
 ex1 <- get_paleogeography(age = 250)
 # Get paleogeographic map via interval name
# }
```
