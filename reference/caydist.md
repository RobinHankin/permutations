# Cayley distance

Cayley distance and associated metrics for permutations

## Usage

``` r
nmoved(a)
nfixed(a)
ncyc(a, discard1 = TRUE)
caydist(a, b = id)
```

## Arguments

- a, b:

  Permutations, coerced to cycle form

- discard1:

  Boolean, with default `TRUE` meaning to discard length-1 cycles and
  return the number of cycles with length \\\>1\\

## Value

Generally return non-negative integers

## Details

These functions support `caydist()`.

Given a permutation `a`, `nfixed(a)` returns the number of elements
mapped to themselves and `nmoved(a)` returns the number of elements
moved \[that is, elements not mapped to themselves\]; `ncyc(a)` returns
the number of cycles, and `caydist()` returns the minimum number of
transpositions needed to convert `a` to `b`.

## Note

Function `ncyc(a, TRUE)` returns the number of nontrivial cycles. Thus,
if `a` is \\(12)(567)\\, then `ncyc(a, TRUE)` returns 2. If argument
`discard1` is `FALSE`, then length-1 cycles are not discarded and
`ncyc(a, FALSE)` returns 4 \[because `a` is equivalent to
\\(12)(3)(4)(567)\\, which has 4 cycles\].

The Cayley distance between two permutations \\a\\ and \\b\\ is defined
a the least number of swaps to go from \\a\\ to \\b\\. Operationally:

\$\$d\_\mathrm{Cayley}(a,b) = n-c(a^{-1}b)\$\$

where \\c(x)\\ is `ncyc(a, FALSE)`. Actually it uses
\\d\_\mathrm{Cayley}(a,b) = n-c(ab^{-1})\\ internally, for efficiency
reasons. This does not matter, for the shape of \\ab\\ is the same as
the shape of \\ba\\: for any permutations \\x,y\\ we have
\\\operatorname{shape}(x) = \operatorname{shape}(x^{-1})\\ and
\\\operatorname{shape}(x)=\operatorname{shape}(y^{-1}xy)\\. Then

\$\$\operatorname{shape}(ab) = \operatorname{shape}(b^{-1}a^{-1}) =
\operatorname{shape}(bb^{-1}a^{-1}b^{-1}) =
\operatorname{shape}(a^{-1}b^{-1}) = \operatorname{shape}(ba).\$\$

## Author

Robin K. S. Hankin

## See also

[`tidy`](tidy.md)

## Examples

``` r
x <- rperm()
x
#>  [1] (1375264)     (15246)       (125763)      (17)(3465)    (135)(27)(46)
#>  [6] (14763)       (1763)(24)    (12673)       (25347)       (132)(4765)  
#> [coerced from word form]

nmoved(x)
#>  [1] 7 5 6 6 7 5 6 5 5 7
nfixed(x)
#>  [1] 0 2 1 1 0 2 1 2 2 0
ncyc(x, discard1 = TRUE)
#>  [1] 1 1 1 2 3 1 2 1 1 2
ncyc(x, discard1 = FALSE)
#>  [1] 1 3 2 3 3 3 3 3 3 2

y <- rperm()

caydist(x,y)
#>  [1] 3 4 5 4 5 5 4 4 4 4
all(caydist(x, y) == caydist(y, x))
#> [1] TRUE

z <- rperm()
all(caydist(x, z) <= caydist(x, y) + caydist(y, z))
#> [1] TRUE

mean(caydist(rperm(100,100)))  # compare 100 - log(100) - gamma ~= 94.82
#> [1] 94.71

```
