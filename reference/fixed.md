# Fixed elements

Finds which elements of a permutation object are fixed

## Usage

``` r
# S3 method for class 'word'
fixed(x)
# S3 method for class 'cycle'
fixed(x)
```

## Arguments

- x:

  Object of class `word` or `cycle`

## Value

Returns a Boolean vector corresponding to the fixed elements of a
permutation.

## Note

The function is vectorized; if given a vector of permutations, `fixed()`
returns a Boolean vector showing which elements are fixed by *all* of
the permutations.

This function has two methods: `fixed.word()` and `fixed.cycle()`,
neither of which coerce.

## Author

Robin K. S. Hankin

## See also

[`tidy`](tidy.md)

## Examples

``` r
fixed(as.cycle(1:3)+as.cycle(8:9))   # elements 4,5,6,7 are fixed
#> [1] FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
fixed(id)
#> logical(0)


data(megaminx)
fixed(megaminx)
#>   [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
#>  [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#>  [25] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#>  [37] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#>  [49] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#>  [61] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#>  [73] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#>  [85] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#>  [97] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [109] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [121] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE

```
