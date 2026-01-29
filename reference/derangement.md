# Tests for a permutation being a derangement

A derangement is a permutation which leaves no element fixed.

## Usage

``` r
is.derangement(x)
```

## Arguments

- x:

  Object to be tested

## Value

A vector of Booleans corresponding to whether the permutations are
derangements or not.

## Note

The identity permutation is problematic because it potentially has zero
size.

The identity element is not a derangement, although the (zero-size)
identity cycle and permutation both return `TRUE` under the natural R
idiom `all(P != seq_len(size(P)))`.

## Author

Robin K. S. Hankin

## See also

`id`

## Examples

``` r
allperms(4)
#>  [1] ()       (34)     (23)     (234)    (243)    (24)     (12)     (12)(34)
#>  [9] (123)    (1234)   (1243)   (124)    (132)    (1342)   (13)     (134)   
#> [17] (13)(24) (1324)   (1432)   (142)    (143)    (14)     (1423)   (14)(23)
#> [coerced from word form]
is.derangement(allperms(4))
#>  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE
#> [13] FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE

M <- matrix(c(1,2,3,4, 2,3,4,1, 3,2,4,1),byrow=TRUE,ncol=4)
M
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    2    3    4
#> [2,]    2    3    4    1
#> [3,]    3    2    4    1
is.derangement(word(M))
#> [1] FALSE  TRUE FALSE

is.derangement(rperm(16,4))
#>  [1]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE
#> [13] FALSE FALSE  TRUE  TRUE
```
