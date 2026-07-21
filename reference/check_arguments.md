# Check if arguments are valid (internal)

This function checks whether user arguments are valid in terms of being
an available argument or of the correct class.

## Usage

``` r
check_arguments(x, ref)
```

## Arguments

- x:

  `list`. The user-query list to compare against `ref`.

- ref:

  `list`. The reference list to compare `x` against.

## Value

Error messages or `TRUE` if all arguments are valid.
