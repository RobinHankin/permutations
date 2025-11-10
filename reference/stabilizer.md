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

## Author

Robin K. S. Hankin

## Examples

``` r
a <- rperm(200)
stabilizer(a,3:4)
#>  [1] (16725)       (12765)       (12576)       (15276)       (12756)(34)  
#>  [6] (16275)       (16752)       (156)(27)(34) (15627)(34)   (176)(34)    
#> [11] (34)(567)     (257)         (1752)        (156)(34)     (12)(576)    

all_perms_shape(c(1,1,2,2)) |> stabilizer(2:3)  # some include (23), some don't
#> [1] (16)(23) (16)(45) (14)(23) (14)(56) (15)(23) (15)(46) (23)(56) (23)(46)
#> [9] (23)(45)

```
