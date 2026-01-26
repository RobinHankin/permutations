# details of cyclists

Various functionality to deal with cyclists

## Usage

``` r
vec2cyclist_single(p)
vec2cyclist_single_cpp(p)
remove_length_one(x)
cyclist2word_single(cyc, n)
nicify_cyclist(x, rm1=TRUE, smallest_first=TRUE)
```

## Arguments

- p:

  Integer vector, interpreted as a word

- x, cyc:

  A cyclist

- n:

  In function `cycle2word_single()`, the size of the permutation to
  induce

- rm1, smallest_first:

  In function `nicify_cyclist()`, Boolean, governing whether or not to
  remove length-1 cycles, and whether or not to place the smallest
  element in each cycle first (non-default values are used by
  [`standard_cyclist()`](fbin.md))

## Details

A cyclist is an object corresponding to a permutation P. It is a list
with elements that are integer vectors corresponding to the cycles of P.
This object is informally known as a cyclist, but there is no S3 class
corresponding to it. In general use, one should not usually deal with
cyclists at all: they are internal low-level objects not intended for
the user.

An object of S3 class cycle is a (possibly named) list of cyclists. NB:
there is an unavoidable notational clash here. When considering a single
permutation, “cycle” means group-theoretic cycle \[eg \\1\longrightarrow
2\longrightarrow 3\longrightarrow 1\\\]; when considering R objects,
“cycle” means “an R object of class cycle whose elements are
permutations written in cycle form”.

The elements of a cyclist are the disjoint group-theoretic cycles. Note
the redundancies inherent: firstly, because the cycles commute, their
order is immaterial (and a list is ordered); and secondly, the cycles
themselves are invariant under cyclic permutation. Heigh ho.

A cyclist may be poorly formed in a number of ways: the cycles may
include repeats, or contain elements which are common to more than one
cycle. Such problems are detected by [`cyclist_valid()`](valid.md).
Also, there are less serious problems: the cycles may include length-one
cycles; the cycles may start with an element that is not the smallest.
These issues are dealt with by `nicify_cyclist()`.

- Function `nicify_cyclist()` takes a cyclist and puts it in a nice form
  but does not alter the permutation. It takes a cyclist and removes
  length-one cycles; then orders each cycle so that the smallest element
  appears first (that is, it changes `(523)` to `(235)`). It then orders
  the cycles by the smallest element. Function `nicify_cyclist()` is
  called automatically by [`cycle()`](permutation.md). Remember that
  `nicify_cyclist()` takes a cyclist!

- Function `remove_length_one()` takes a cyclist and removes length-one
  cycles from it.

- Function `vec2cyclist_single()` takes a vector of integers,
  interpreted as a word, and converts it into a cyclist. Length-one
  cycles are discarded.

- Function `vec2cyclist_single_cpp()` is a placeholder for a function
  that is not yet written.

- Function `cyclist2word_single()` takes a cyclist and returns a vector
  corresponding to a single word. This function is not intended for
  everyday use; function [`cycle2word()`](permutation.md) is much more
  user-friendly.

- Function `char2cyclist_single()` takes a character string like
  “`(342)(19)`” and turns it into a cyclist, in this case
  `list(c(3,4,2),c(1,9))`. This function returns a cyclist which is not
  necessarily canonicalized: it might have length-one cycles, and the
  cycles themselves might start with the wrong number or be incorrectly
  ordered. It attempts to deal with absence of commas in a sensible way,
  so “`(18,19)(2,5)`” is dealt with appropriately too. The function is
  insensitive to spaces. Also, one can give it an argument which does
  not correspond to a cycle object, eg
  `char2cyclist_single("(94)(32)(19)(1)")` (in which “9” is repeated).
  The function does not return an error; to catch this kind of problem
  use [`char2cycle()`](permutation.md) which performs \[via
  [`cycle()`](permutation.md)\] the validity checks
  \[[`cyclist_valid()`](valid.md)\] and nicification
  \[`nicify_cyclist()`\].

See also the “cyclist” vignette \[type
[`vignette("cyclist")`](../articles/cyclist.md) at the command line\]
which contains more details and examples.

## Author

Robin K. S. Hankin

## See also

[`as.cycle`](permutation.md),[`fbin`](fbin.md),[`valid`](valid.md)

## Examples

``` r
vec2cyclist_single(c(7,9,3,5,8,6,1,4,2))
#> [[1]]
#> [1] 1 7
#> 
#> [[2]]
#> [1] 2 9
#> 
#> [[3]]
#> [1] 4 5 8
#> 

char2cyclist_single("(342)(19)")
#> [[1]]
#> [1] 3 4 2
#> 
#> [[2]]
#> [1] 1 9
#> 

nicify_cyclist(list(c(4, 6), c(7), c(2, 5, 1), c(8, 3)))
#> [[1]]
#> [1] 1 2 5
#> 
#> [[2]]
#> [1] 3 8
#> 
#> [[3]]
#> [1] 4 6
#> 
nicify_cyclist(list(c(4, 6), c(7), c(2, 5, 1), c(8, 3)), rm1=TRUE)
#> [[1]]
#> [1] 1 2 5
#> 
#> [[2]]
#> [1] 3 8
#> 
#> [[3]]
#> [1] 4 6
#> 

nicify_cyclist(list(c(4, 6), c(7), c(2, 5, 1), c(8, 3)), smallest_first=FALSE, rm1=FALSE)
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
nicify_cyclist(list(c(4, 6), c(7), c(2, 5, 1), c(8, 3)), smallest_first=FALSE, rm1=TRUE )
#> [[1]]
#> [1] 5 1 2
#> 
#> [[2]]
#> [1] 6 4
#> 
#> [[3]]
#> [1] 8 3
#> 
nicify_cyclist(list(c(4, 6), c(7), c(2, 5, 1), c(8, 3)), smallest_first=TRUE , rm1=FALSE)
#> [[1]]
#> [1] 1 2 5
#> 
#> [[2]]
#> [1] 3 8
#> 
#> [[3]]
#> [1] 4 6
#> 
#> [[4]]
#> [1] 7
#> 
nicify_cyclist(list(c(4, 6), c(7), c(2, 5, 1), c(8, 3)), smallest_first=TRUE , rm1=TRUE )
#> [[1]]
#> [1] 1 2 5
#> 
#> [[2]]
#> [1] 3 8
#> 
#> [[3]]
#> [1] 4 6
#> 
 

cyclist2word_single(list(c(1,4,3), c(7,8)))
#> [1] 4 2 1 3 5 6 8 7

```
