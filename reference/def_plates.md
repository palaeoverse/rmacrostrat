# Define tectonic plates

A function to retrieve tectonic plate definitions for a user-specified
plate identification number, as defined by the Wright et al. (2013)
Global Plate Model. If no arguments are supplied, all plates are
returned.

## Usage

``` r
def_plates(plate_id = NULL)
```

## Arguments

- plate_id:

  `integer`. The unique identification number(s) of the desired plate(s)
  to return a definition for. If NULL (default), all plates are
  returned.

## Value

A `data.frame` containing the `plate_id` of the tectonic plate and the
name of the tectonic plate as defined by Wright et al. (2013).

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
[`get_paleogeography()`](https://rmacrostrat.palaeoverse.org/reference/get_paleogeography.md)

## Examples

``` r
# \donttest{
 # Get all tectonic plates
 ex1 <- def_plates()
 # Get name of tectonic plate by ID
 ex2 <- def_plates(plate_id = 604)
#> Error in GET_macrostrat(endpoint = "defs/plates/", query = args, format = "json"): Content not found. Check your request.
# }
```
