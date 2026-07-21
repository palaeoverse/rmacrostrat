# Define stratigraphic names

A function to retrieve the definitions for one or more stratigraphic
names in the Macrostrat database. By default, all stratigraphic name
definitions are returned.

## Usage

``` r
def_strat_names(
  strat_name = NULL,
  interval_name = NULL,
  rank = NULL,
  concept_id = NULL,
  ref_id = NULL,
  strat_name_id = NULL,
  rule = NULL
)
```

## Arguments

- strat_name:

  `character`. The name(s) of the desired stratigraphic unit(s) to
  return a definition for.

- interval_name:

  `character`. The chronostratigraphic interval name (e.g., "Campanian")
  for which to return stratigraphic name definitions. This returns
  `strat_names` with an age declared in Macrostrat, whose age has any
  temporal overlap with the desired interval.

- rank:

  `character`. The formal stratigraphic rank abbreviation of the desired
  name(s) (i.e., "SGp", "Gp", "SubGp", "Fm", "Mbr", or "Bed") to return
  a definition for.

- concept_id:

  `integer`. The unique identification number(s) of the stratigraphic
  concept(s) (grouped `strat_name`s which represent the same entity) to
  return a definition for.

- ref_id:

  `character`. The unique identification number(s) of the desired
  reference(s). Only stratigraphic names linked to the specified
  `ref_id` will be returned.

- strat_name_id:

  `integer`. The unique identification number(s) of the desired
  stratigraphic name to return a definition for.

- rule:

  `character`. The hierarchical rule for returning stratigraphic name
  definitions (either "all" or "down"). The "all" option will return the
  entire stratigraphic name hierarchy (parents and children of all
  levels) that the requested name(s) belongs to. The "down" option will
  return any direct children of the requested stratigraphic name(s). Can
  only be used with `strat_name_id`.

## Value

A `data.frame` containing the following columns:

- `strat_name`: The short-form stratigraphic name (e.g. "Hell Creek").

- `strat_name_long`: The long-form stratigraphic name, including the
  lithostratigraphic rank of the stratigraphic name (e.g., "Hell Creek
  Formation").

- `rank`: The lithostratigraphic rank of the stratigraphic name (e.g.,
  "Formation"), in short form (e.g., "Fm").

- `strat_name_id`: The unique identification number of the stratigraphic
  name.

- `concept_id`: The unique identification number of the associated
  stratigraphic name concept, which groups variant `strat_names` for the
  same geologic entity (see
  [`def_strat_name_concepts()`](https://rmacrostrat.palaeoverse.org/reference/def_strat_name_concepts.md)).

- `bed`: The stratigraphic name of the bed associated with the specified
  stratigraphic name.

- `bed_id`: The unique identification number (strat_name_id) of the bed
  associated with the specified stratigraphic name associated with the
  specified stratigraphic name.

- `mbr`: The stratigraphic name of the member associated with the
  specified stratigraphic name.

- `mbr_id`: The unique identification number (strat_name_id) of the
  member associated with the specified stratigraphic name.

- `fm`: The stratigraphic name of the formation associated with the
  specified stratigraphic name.

- `fm_id`: The unique identification number (strat_name_id) of the
  formation associated with the specified stratigraphic name.

- `subgp`: The stratigraphic name of the subgroup associated with the
  specified stratigraphic name.

- `subgp_id`: The unique identification number (strat_name_id) of the
  subgroup associated with the specified stratigraphic name.

- `gp`: The stratigraphic name of the group associated with the
  specified stratigraphic name.

- `gp_id`: The unique identification number (strat_name_id) of the group
  associated with the specified stratigraphic name.

- `sgp`: The stratigraphic name of the supergroup associated with the
  specified stratigraphic name.

- `sgp_id`: The unique identification number (strat_name_id) of the
  supergroup associated with the specified stratigraphic name.

- `b_age`: The bottom age (maximum age) associated with the
  stratigraphic name, in millions of years before present.

- `t_age`: The top age (minimum age) associated with the stratigraphic
  name, in millions of years before present.

- `b_period`: The name of the oldest geologic time period associated
  with the stratigraphic name (see
  [`def_intervals()`](https://rmacrostrat.palaeoverse.org/reference/def_intervals.md)).

- `t_period`:The name of the youngest geologic time period associated
  with the stratigraphic name (see
  [`def_intervals()`](https://rmacrostrat.palaeoverse.org/reference/def_intervals.md)).

- `c_interval`: The name of the central interval associated with the
  stratigraphic name (see
  [`def_intervals()`](https://rmacrostrat.palaeoverse.org/reference/def_intervals.md)).

- `t_units`: The total number of Macrostrat units that are associated
  with the stratigraphic name.

- `ref_id`: The unique identification number of the reference from which
  the stratigraphic name was sourced (see
  [`def_references()`](https://rmacrostrat.palaeoverse.org/reference/def_references.md)).

## Developer(s)

Christopher D. Dean

## Reviewer(s)

Bethany Allen

## See also

Stratigraphic names:
[`def_strat_name_concepts()`](https://rmacrostrat.palaeoverse.org/reference/def_strat_name_concepts.md)

## Examples

``` r
# \donttest{
# Return a sample of stratigraphic names
ex1 <- def_strat_names()
# Return all stratigraphic names associated with a particular stratigraphic
# name
ex2 <- def_strat_names(strat_name = "Hell Creek")
# Return all stratigraphic names that intersect with a chosen time interval
ex3 <- def_strat_names(interval_name = "Campanian")
# }
```
