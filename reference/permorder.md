# The order of a permutation

Returns the order of a permutation \\P\\: the smallest strictly positive
integer \\n\\ for which \\P^n\\ is the identity.

## Usage

``` r
permorder(x, singly = TRUE)
```

## Arguments

- x:

  Permutation, coerced to `cycle` form

- singly:

  Boolean, with default `TRUE` meaning to return the order of each
  element of the vector, and `FALSE` meaning to return the order of the
  vector itself (that is, the smallest strictly positive integer for
  which `all(x^n == id)`).

## Details

Coerces its argument to cycle form.

The order of the identity permutation is 1.

## Author

Robin K. S. Hankin

## Note

Uses `mLCM()` from the `numbers` package.

## See also

[`sgn`](sgn.md)

## Examples

``` r
x <- rperm(5,20)
permorder(x)
#> [1] 34 30 70 78 12
permorder(x,FALSE)
#> [1] 92820

stopifnot(all(is.id(x^permorder(x))))
stopifnot(is.id(x^permorder(x,FALSE)))
```
