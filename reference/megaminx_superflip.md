# The Megaminx Superflip

On the megaminx, a flip is a a sequence of moves whose only effect is to
flip one or more edge pieces in place (the number of edges flipped must
be even). The *superflip* is the operation that flips each of the 30
edges of the puzzle.

Object `edge_facets` is a 30 row, two-column matrix with each row
representing an edge facet.

## Usage

``` r
is.flip_pair(pair)
is.flip(p)
is.flip(p)
is.superflip(p)
```

## Arguments

- pair:

  Integer vector of length two corresponding to a pair of facets

- p:

  Vector iof permutations, coerced to cycle form

## Value

Returns a boolean vector

## Author

Robin K. S. Hankin

## See also

[`megaminx`](megaminx.md)

## Examples

``` r
stopifnot(all(
 is.flip_pair(c(10,46)),
 is.flip_pair(c(98,124)),
!is.flip_pair(c(10,98)),
!is.flip_pair(c(11,98))
))

is.flip(c(
    as.cycle("(10,46)(44,50)(56,62)"),
    as.cycle("74,121)"),
    as.cycle("74,120)")
))
#> [1]  TRUE FALSE  TRUE
```
