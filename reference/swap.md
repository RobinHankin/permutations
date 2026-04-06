# Length-2 cycles; swap a pair of elements

Length-2 cycles; swap a pair of elements

## Usage

``` r
swap(a, b)
```

## Arguments

- a, b:

  Integers

## Details

Swaps two elements. Vectorized; uses standard recycling.

## Value

Returns a permutation in cycle form

## Author

Robin K. S. Hankin

## Note

If the first argument equals the second, the identity permutation is
returned.

Cycles of the form \\(1n)\\, that is, `swap(1, n)`, are used extensively
in `inst/outer_automorphisms_of_S6.Rmd`.

## See also

[`as.cycle`](permutation.md)

## Examples

``` r
swap(2, 8)
#> [1] (28)

swap(5, 1:9)
#> [1] (15) (25) (35) (45) ()   (56) (57) (58) (59)

swap(1:8, 8:1)
#> [1] (18) (27) (36) (45) (45) (36) (27) (18)

swap(sample(9), sample(9))
#> [1] (12) (14) (68) (59) (26) (37) (48) (59) (37)

rcyc(10,4)^swap(1,9)
#>  [1] (2943) (2943) (2439) (2934) (2943) (2394) (2934) (2934) (2349) (2439)
#> [coerced from word form]

```
