# Functions to validate permutations

Functions to validate permutation objects: if valid, return `TRUE` and
if not valid, generate a
[`warning()`](https://rdrr.io/r/base/warning.html) and return `FALSE`.

Function `singleword_valid()` takes an integer vector, interpreted as a
word, and checks that it is a permutation of `seq_len(max(x))`.

Function `cyclist_valid()` takes a cyclist and checks that its argument
corresponds to a meaningful permutation: the elements must be vectors of
strictly positive integers with no repeated values and empty pairwise
intersection. Compare [`nicify_cyclist()`](cyclist.md) \[documented at
`cyclist.Rd`\] which is more cosmetic, converting its argument into a
standard form.

## Usage

``` r
singleword_valid(w)
cyclist_valid(x)
```

## Arguments

- w:

  In function `singleword_valid()`, an integer vector

- x:

  In function `cyclist_valid()`, a cyclist

## Value

Returns either `TRUE`, or gives a warning and returns `FALSE`

## Author

Robin K. S. Hankin

## See also

[`cyclist`](cyclist.md)

## Examples

``` r
singleword_valid(sample(1:9))      # TRUE
#> [1] TRUE
singleword_valid(c(3L,4L,2L,1L))   # TRUE
#> [1] TRUE
singleword_valid(c(3,4,2,1))       # FALSE (not integer)
#> Warning: invalid word
#> [1] FALSE
singleword_valid(c(3L,3L,2L,1L))   # FALSE (3 repeated)
#> Warning: invalid word
#> [1] FALSE

cyclist_valid(list(c(1,8,2),c(3,6))) # TRUE
#> [1] TRUE
cyclist_valid(list(c(1,8,2),c(3,6))) # FALSE ('8' is repeated)
#> [1] TRUE
cyclist_valid(list(c(1,8,1),c(3,6))) # FALSE ('1' is repeated)
#> Warning: repeated value
#> [1] FALSE
cyclist_valid(list(c(0,8,2),c(3,6))) # FALSE (zero element)
#> Warning: zero element
#> [1] FALSE
```
