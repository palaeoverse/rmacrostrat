# Define references

A function to retrieve the definitions for one or more published
scientific references in the Macrostrat database. By default, all
reference definitions are returned.

## Usage

``` r
def_references(ref_id = NULL)
```

## Arguments

- ref_id:

  `integer`. The unique identification number(s) of the desired
  reference(s) to return a definition for. If `NULL` (default), all
  references are returned.

## Value

A `data.frame` containing the following columns:

- `ref_id`: The unique identification number(s) for the reference(s).

- `pub_year`: The year of publication of the reference.

- `author`: The author(s) of the reference.

- `ref`: The name of the reference.

- `doi`: The digital object identifier of the reference.

- `url`: A URL where additional information, the source, or contributing
  publication can be found.

- `t_units`: The total number of Macrostrat units associated with the
  reference.

## Developer(s)

William Gearty

## Reviewer(s)

Bethany Allen

## See also

Macrostrat database metadata:
[`def_projects()`](https://rmacrostrat.palaeoverse.org/reference/def_projects.md),
[`def_sources()`](https://rmacrostrat.palaeoverse.org/reference/def_sources.md),
[`get_stats()`](https://rmacrostrat.palaeoverse.org/reference/get_stats.md)

## Examples

``` r
# \donttest{
# Return all references
ex1 <- def_references()
# Return a subset of references
ex2 <- def_references(ref_id = c(1, 2, 3))
# }
```
