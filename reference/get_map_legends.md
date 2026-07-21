# Retrieve geologic map legend data

A function to retrieve legend components from various geological maps.

## Usage

``` r
get_map_legends(
  source_id = NULL,
  lithology_id = NULL,
  lithology_type = NULL,
  lithology_class = NULL,
  description = NULL,
  comments = NULL,
  scale = NULL,
  carto = NULL
)
```

## Arguments

- source_id:

  `integer`. Filter legend components to those in sources specified by
  their unique identification number(s).

- lithology_id:

  `integer`. Filter legend components to those containing one or more
  lithology(ies) as specified by their unique identification number(s).

- lithology_type:

  `character`. Filter legend components to those containing one or more
  named lithology type(s) (e.g., "carbonate", "siliciclastic").

- lithology_class:

  `character`. Filter legend components to those containing one or more
  named lithology class(es) (e.g., "sedimentary", "igneous",
  "metamorphic").

- description:

  `character`. Filter legend components to those containing the given
  character string in the map unit description field.

- comments:

  `character`. Filter legend components to those containing the given
  character string in the map unit comments field.

- scale:

  `character`. Filter legend components to those from maps of specific
  scale(s) in Macrostrat's system. Options are "tiny" (global), "small"
  (continental), "medium" (regional), or "large" (local).

- carto:

  `character`. Filter legend components to those of specific scale(s) in
  Macrostrat's system. Options are "tiny" (global), "small"
  (continental), "medium" (regional), or "large" (local).

## Value

A `dataframe` containing the following columns:

- `legend_id`: The unique identification number of the map legend.

- `source_id`: The identification number of the source geologic map (see
  [`def_sources()`](https://rmacrostrat.palaeoverse.org/reference/def_sources.md)).

- `scale`: The associated Macrostrat map scale for the legend.

- `map_unit_name`:The name of the outcrop shape element as defined in
  the geologic map source.

- `strat_name`: The geologic name(s) of the outcrop shape element.

- `age`: The chronostratigraphic bin assigned to the outcrop shape
  element, as defined in the geologic map source in plain text.

- `lith`: The lithology of the outcrop shape element as defined in the
  geologic map source in plain text.

- `descrip`: Description of the outcrop shape element in plain text.

- `comments`: Notes assigned to the outcrop shape element.

- `t_age`: The estimated top age of the outcrop shape element, in
  millions of years before present.

- `b_age`: The estimated bottom age of the outcrop shape element, in
  millions of years before present.

- `b_interval`: The unique identification number of the bottom time
  interval matched to the outcrop shape element.

- `t_interval`: The unique identification number of the top time
  interval matched to the outcrop shape element.

- `strat_name_id`: A vector containing the unique identification
  number(s) for known stratigraphic unit name(s) matched to the outcrop
  shape element (see
  [`def_strat_names()`](https://rmacrostrat.palaeoverse.org/reference/def_strat_names.md)).

- `unit_id`: A vector containing the unique identification number(s) for
  known Macrostrat unit(s) matched to the outcrop shape element.

- `lith_classes`: A vector containing the named lithology class(es)
  (e.g., "sedimentary") matched to the outcrop shape element.

- `lith_types`: A vector containing the named lithology type(s) (e.g.,
  "siliciclastic") matched to the outcrop shape element.

- `lith_id`: A vector containing the unique identification number(s) for
  known lithology(ies) represented within the outcrop shape element (see
  [`def_lithologies()`](https://rmacrostrat.palaeoverse.org/reference/def_lithologies.md)).

- `color`: Recommended color for plotting the outcrop shape element
  based on the dominant lithology.

- `area`: The area of the outcrop shape element in km².

- `tiny_area`: The area of the outcrop shape element in km² at "tiny"
  Macrostrat map scale.

- `small_area`: The area of the outcrop shape element in km² at "small"
  Macrostrat map scale.

- `medium_area`: The area of the outcrop shape element in km² at
  "medium" Macrostrat map scale.

- `large_area`: The area of the outcrop shape element in km² at "large"
  Macrostrat map scale.

## Details

Potential Macrostrat map scales are "tiny" (global), "small"
(continental), "medium" (regional), or "large" (local).

## Developer(s)

Christopher D. Dean

## Reviewer(s)

William Gearty

## See also

Geologic maps:
[`def_sources()`](https://rmacrostrat.palaeoverse.org/reference/def_sources.md),
[`get_map_outcrop()`](https://rmacrostrat.palaeoverse.org/reference/get_map_outcrop.md),
[`get_map_points()`](https://rmacrostrat.palaeoverse.org/reference/get_map_points.md),
[`get_tiles()`](https://rmacrostrat.palaeoverse.org/reference/get_tiles.md)

## Examples

``` r
# \donttest{
 # Get legend components by ID of the original source map
 ex1 <- get_map_legends(source_id = 1)
 # Get legend components for any sedimentary lithologies
 ex2 <- get_map_legends(lithology_type = "sedimentary")
 # Get any legend components that have comments with the word 'breccia'
 ex3 <- get_map_legends(comments = "breccia")
# }
```
