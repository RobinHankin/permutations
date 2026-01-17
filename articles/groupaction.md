# Function \`as.function.permutation()\` in the permutations package: group actions

![](../../../_temp/Library/permutations/help/figures/permutations.png)

``` r
as.function.permutation
```

    ## function (x, ...) 
    ## {
    ##     a <- NULL
    ##     x <- unclass(as.word(x))
    ##     if (nrow(x) == 1) {
    ##         return(as.function(alist(a = , x[, a])))
    ##     }
    ##     else {
    ##         return(as.function(alist(a = , x[cbind(seq_len(nrow(x)), 
    ##             a)])))
    ##     }
    ## }
    ## <bytecode: 0x563fbc243128>
    ## <environment: namespace:permutations>

To cite the permutations package in publications, please use Hankin
([2020](#ref-hankin2020)). The `permutations` package was intended to
manipulate and combine permutations, but often one wants to consider the
effect of a permutation on the underlying set, taken to be
$\lbrack n\rbrack = \left\{ 1,2,\ldots,n \right\}$. In other words, we
wish to consider a permutation as a function. In package idiom, coercing
a permutation to a function is straightforward:

``` r
g <- as.cycle("(45)(127)")
as.function(g)(4)
```

    ## [1] 5

Above we see that permutation $(45)(127)$ maps 4 to 5. We can see from
the function body, at the top of the page, that permutations are coerced
to word form. Function
[`as.function.permutation()`](../reference/as.function.permutation.md)
uses [`as.matrix()`](../reference/permutation.md) to stop “`x[a,]`”
dispatching to `[.word()` and use matrix extraction instead. It might be
argued that [`unclass()`](https://rdrr.io/r/base/class.html) would be
better coding.

Coercion is vectorized:

``` r
as.function(g)(1:7)
```

    ## [1] 2 7 3 5 4 6 1

``` r
as.function(allperms(4))(3)
```

    ##  [1] 3 4 2 4 2 3 3 4 1 4 1 3 2 4 1 4 1 2 2 3 1 3 1 2

``` r
as.function(rperm(7,8))(1:7)
```

    ## [1] 6 2 2 7 3 2 2

The second and third forms use the
`alist(a = , x[cbind(seq_len(nrow(x)),a)])` construction. We now discuss
the extent to which the underlying permutation group is represented in
package idiom. Consider the following construction:

``` r
(p <- cyc_len(2))
```

    ## [1] (12)

``` r
as.function(p)(3)
```

    ## Error in `x[, a]`:
    ## ! subscript out of bounds

On the one hand, object `p` is a permutation on the set
$\lbrack 2\rbrack = \left\{ 1,2 \right\}$. The action of this
permutation on 3 is not defined, and the package returns an error. Above
we effectively see

``` r
t(1:2)[,3]
```

    ## Error in `t(1:2)[, 3]`:
    ## ! subscript out of bounds

which is the origin of the error. On the other hand, one might
reasonably hold that the action of $(12)$ on 3 should be 3, on the
grounds that $(12)$ transposes elements 1 and 2 and leaves all other
elements unchanged. To realise this interpretation we need to ensure
that `p` has underlying set including 3, in this case
$\left\{ 1,2,3 \right\}$. This is straightforward with
[`as.word()`](../reference/permutation.md):

``` r
as.function(as.word(p,n=3))(3)
```

    ## [1] 3

### Note on identity permutation

The ever-problematic identity permutation acts on the empty set so its
functionalization always returns an error:

``` r
as.function(id)(4)
```

    ## Error in `x[, a]`:
    ## ! subscript out of bounds

Again the resolution is to coerce to word form with explicit `n`:

``` r
as.function(as.word(id,n=4))(4)
```

    ## [1] 4

### References

Hankin, R. K. S. 2020. “Introducing the Permutations R Package.”
*SoftwareX* 11. <https://doi.org/10.1016/j.softx.2020.100453>.
