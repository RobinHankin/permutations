# Inverse of a permutation

Calculates the inverse of a permutation in either word or cycle form

## Usage

``` r
inverse(x)
# S3 method for class 'word'
inverse(x)
# S3 method for class 'cycle'
inverse(x)
inverse_word_single(W)
inverse_cyclist_single(cyc)
```

## Arguments

- x:

  Object of class `permutation` to be inverted

- W:

  In function `inverse_word_single()`, a vector corresponding to a
  permutation in word form (that is, one row of a `word` object)

- cyc:

  In function `inverse_cyclist_single()`, a cyclist to be inverted

## Details

The package provides methods to invert objects of class `word` (the R
idiom is `W[W] <- seq_along(W)`) and also objects of class `cycle` (the
idiom is `lapply(cyc,function(o){c(o[1],rev(o[-1]))})`).

The user should use `inverse()` directly, which dispatches to either
`inverse.word()` or `inverse.cycle()` as appropriate.

Sometimes, using idiom such as `x^-1` or `id/x` gives neater code,
although these may require coercion between word form and cycle form.

## Value

Function `inverse()` returns an object of the same class as its
argument.

## Author

Robin K. S. Hankin

## Note

Inversion of words is ultimately performed by function
`inverse_word_single()`:

    inverse_word_single <- function(W){
        W[W] <- seq_along(W)
        return(W)
    }

which can be replaced by [`order()`](https://rdrr.io/r/base/order.html)
although this is considerably less efficient, especially for small sizes
of permutations. One of my longer-term plans is to implement this in C,
although it is not clear that this will be any faster.

## See also

[`cycle_power`](Ops.permutation.md)

## Examples

``` r
x <- rperm(10,6)
x
#>  [1] (34)(56)     (165)(24)    (1362)(45)   (145632)     (12)(35)(46)
#>  [6] (1643)(25)   (143)(26)    (25634)      (123654)     (16253)     
#> [coerced from word form]
inverse(x)
#>  [1] (34)(56)     (156)(24)    (1263)(45)   (123654)     (12)(35)(46)
#>  [6] (1346)(25)   (134)(26)    (24365)      (145632)     (13526)     
#> [coerced from word form]

all(is.id(x*inverse(x)))  # should be TRUE
#> [1] TRUE

inverse(as.cycle(matrix(1:8,9,8)))
#> [1] ()               (18765432)       (1753)(2864)     (16385274)      
#> [5] (15)(26)(37)(48) (14725836)       (1357)(2468)     (12345678)      
#> [9] ()              
```
