# Fetch data from Macrostrat

This function fetches data from [Macrostrat](https://macrostrat.org) via
the Application Programming Interface (API). This is the core function
for handling user requests.

## Usage

``` r
GET_macrostrat(endpoint, query = list(), format = "json", output = "df")
```

## Arguments

- endpoint:

  `character`. The API endpoint to retrieve data from Macrostrat.

- query:

  `character`. The API query to retrieve data from Macrostrat.

- format:

  `character`. The format that data should be downloaded in. Either:
  "csv", "json" (the default), or "geojson".

- output:

  `character`. If `format` is "json", what format should the output be
  in? Valid options are "list" (the default) or "df" (data.frame). If
  "df" is chosen, all metadata will be lost.

## Value

A `data.frame` (if `format` is "csv" or "json" and `output` is "df"), a
`list` (if `format` is "json" and `output` is "list"), or `sf` object
(if `format` is "geojson").
