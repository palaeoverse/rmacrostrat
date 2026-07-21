# Define stratigraphic name concepts

A function to retrieve the definitions for stratigraphic name concepts.
By default, all stratigraphic name concept definitions are returned.

## Usage

``` r
def_strat_name_concepts(strat_concept_name = NULL, strat_concept_id = NULL)
```

## Arguments

- strat_concept_name:

  `character`. The name(s) of the desired stratigraphic name concept(s)
  to return a definition for (e.g., "Hell Creek").

- strat_concept_id:

  `integer`. The unique identification number(s) of the desired
  stratigraphic name concept(s) to return a definition for.

## Value

A `data.frame` containing the following columns:

- `concept_id`: The unique identification number for the stratigraphic
  name concept, which groups variant `strat_name`s for same geologic
  entity.

- `name`: The name of the stratigraphic name concept.

- `geologic_age`: The geologic age information assigned to the
  stratigraphic name concept, as defined in the original reference in
  plain text.

- `int_id`: The unique identification number of the chronostratigraphic
  interval associated with the stratigraphic name concept (see
  [`def_intervals()`](https://rmacrostrat.palaeoverse.org/reference/def_intervals.md)).

- `b_int_id`: The unique identification number of the bottom (oldest)
  chronostratigraphic interval associated with the stratigraphic name
  concept (see
  [`def_intervals()`](https://rmacrostrat.palaeoverse.org/reference/def_intervals.md)).

- `t_int_id`: The unique identification number of the top (youngest)
  chronostratigraphic interval associated with the stratigraphic name
  concept (see
  [`def_intervals()`](https://rmacrostrat.palaeoverse.org/reference/def_intervals.md)).

- `usage_notes`: Notes on the current validity of the stratigraphic name
  concept, in plain text.

- `other`: Other associated notes on the stratigraphic name concept, in
  plain text.

- `province`: The provinces where the stratigraphic name concept
  appears, in plain text.

- `refs`: The unique identification number of the reference from which
  the stratigraphic name concept was sourced (see
  [`def_references()`](https://rmacrostrat.palaeoverse.org/reference/def_references.md)).

- `url`: The URL associated with the stratigraphic name concept, where
  additional information, the source or contributing publication can be
  found.

- `author`: The authors of the source reference.

## Details

Stratigraphic name concepts consist of grouped `strat_name`s which
represent the same geologic entity. This may be due to stratigraphic
names appearing in multiple reference maps or at multiple
lithostratigraphic ranks.

## Developer(s)

Christopher D. Dean

## Reviewer(s)

William Gearty

## See also

Stratigraphic names:
[`def_strat_names()`](https://rmacrostrat.palaeoverse.org/reference/def_strat_names.md)

## Examples

``` r
# \donttest{
# Return a stratigraphic name concept based on a string
ex1 <- def_strat_name_concepts(strat_concept_name = "Dakota")
# Return a stratigraphic name concept based on an ID
ex1 <- def_strat_name_concepts(strat_concept_id = 8212)
# }
```
