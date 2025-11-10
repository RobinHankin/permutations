# The fundamental bijection

Stanley defines the fundamental bijection on page 30.

Given \\w=(14)(2)(375)(6)\\, Stanley writes it in standard form
(specifically: each cycle is written with its largest element first;
cycles are written in increasing order of their largest element). Thus
we obtain \\(2)(41)(6)(753)\\.

Then we obtain \\w^\*\\ from \\w\\ by writing it in standard form an
erasing the parentheses (that is, viewing the numbers as a *word*); here
\\w^\*=2416753\\.

Given this, \\w\\ may be recovered by inserting a left parenthesis
preceding every left-to-right maximum, and right parentheses where
appropriate.

Function `standard()` takes an object of class `cycle` and returns a
list of cyclists. NB this does not return an object of class “cycle”
because [`cycle()`](permutation.md) calls [`nicify()`](cyclist.md).

Function `standard_cyclist()` retains length-one cycles (compare
[`nicify_cyclist()`](cyclist.md), which does not).

## Usage

``` r
standard(cyc,n=NULL)
standard_cyclist(x,n=NULL)
fbin_single(vec)
fbin(W)
fbin_inv(cyc)
```

## Arguments

- vec:

  In function `fbin_single()`, an integer vector

- W:

  In functions `fbin()` and `fbin_inv()`, an object of class
  permutation, coerced to word and cycle form respectively

- cyc:

  In functions `fbin_single()` and `standard()`, permutation object
  coerced to cycle form

- n:

  In function `standard()` and `standard_cyclist()`, size of the
  partition to assume, with default `NULL` meaning to use the largest
  element of any cycle

- x:

  In function `standard_cyclist()`, a cyclist

## Details

The user-friendly functions are `fbin()` and `fbin_inv()` which perform
Stanley's “fundamental bijection”. Function `fbin()` takes a word object
and returns a cycle; function `fbin_inv()` takes a cycle and returns a
word.

The other functions are low-level helper functions that are not really
intended for the user (except possibly `standard()`, which puts a cycle
object in standard order in list form).

## References

R. P. Stanley 2011 *Enumerative Combinatorics*

## Author

Robin K. S. Hankin

## See also

[`nicify_cyclist`](cyclist.md)

## Examples

``` r
# Stanley's example w:
standard(cycle(list(list(c(1,4),c(3,7,5)))))
#> [[1]]
#> [[1]][[1]]
#> [1] 2
#> 
#> [[1]][[2]]
#> [1] 4 1
#> 
#> [[1]][[3]]
#> [1] 6
#> 
#> [[1]][[4]]
#> [1] 7 5 3
#> 
#> 

standard_cyclist(list(c(4, 6), c(7), c(2, 5, 1), c(8, 3)))
#> [[1]]
#> [1] 5 1 2
#> 
#> [[2]]
#> [1] 6 4
#> 
#> [[3]]
#> [1] 7
#> 
#> [[4]]
#> [1] 8 3
#> 


w_hat <- c(2,4,1,6,7,5,3)

fbin(w_hat)
#> [1] (14)(375)
fbin_inv(fbin(w_hat))
#> [1] (1246573)
#> [coerced from word form]


x <- rperm(40,9)
stopifnot(all(fbin(fbin_inv(x))==x))
stopifnot(all(fbin_inv(fbin(x))==x))
```
