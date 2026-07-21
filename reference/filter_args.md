# Filters NULL and FALSE arguments from a list

This function checks whether any elements in a list are NULL or FALSE
and removes them.

## Usage

``` r
filter_args(x, filter_null = TRUE, filter_false = TRUE)
```

## Arguments

- x:

  `list`. The user-query list

- filter_null:

  `logical`. Should NULL value queries be filtered?

- filter_false:

  `logical`. Should FALSE value queries be filtered?

## Value

A `NULL` and `FALSE` filtered list of `x`.
