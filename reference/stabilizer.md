# Stabilizer of a permutation

A permutation \\\phi\\ is said to stabilize a set \\S\\ if the image of
\\S\\ under \\\phi\\ is a subset of \\S\\, that is, if
\\\left\lbrace\left. \phi(s)\right\|s\in S \right\rbrace\subseteq S\\.
This may be written \\\phi(S)\subseteq S\\. Given a vector \\G\\ of
permutations, we define the stabilizer of \\S\\ in \\G\\ to be those
elements of \\G\\ that stabilize \\S\\.

Given \\S\\, it is clear that the identity permutation stabilizes \\S\\,
and if \\\phi,\psi\\ stabilize \\S\\, then so do \\\phi\psi\\ and
\\\psi\phi\\, and so does \\\phi^{-1}\\ \[\\\phi\\ is a bijection from
\\S\\ to itself\].

Function `stabilizes(G,S)` returns a Boolean vector `V` with `V[i]`
being `TRUE` if `G[i]` stabilizes `S` and `FALSE` otherwise. Function
`stabilizer(G,S)` returns `G[stabilizes(G,S)]`.

## Usage

``` r
stabilizes(a,s)
stabilizer(a,s)
```

## Arguments

- a:

  Permutation (coerced to class `cycle`)

- s:

  Subset of \\\left\lbrace 1,\ldots,n\right\rbrace\\, to be stabilized

## Value

A boolean vector \[`stabilizes()`\] or a vector of permutations in cycle
form \[`stabilizer()`\]

## Note

The identity permutation stabilizes any set.

Functions `stabilizes()` and `stabilizer()` coerce their arguments to
cycle form.

Note that if \\\phi\\ stabilizes \\S\\, then the elements of `S` may be
permuted by \\\phi\\; thus some elements of `S[i]^stabilizer(G,S)`
\[equivalently, `as.function(stabilizer(G,S))(S[i])`\] may not be equal
to `S[i]`.

## Author

Robin K. S. Hankin

## Examples

``` r
a <- rperm(200)
s <- stabilizer(a, 3:4)

3^s   # all these in {3,4}
#>  [1] 3 3 3 3 4 3 3 4 4 4 4 3 3 4 3

all_perms_shape(c(1,1,2,2)) |> stabilizer(2:3)  # some include (23), some don't
#> [1] (16)(23) (16)(45) (14)(23) (14)(56) (15)(23) (15)(46) (23)(56) (23)(46)
#> [9] (23)(45)

```
