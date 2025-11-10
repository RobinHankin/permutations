# The permutations package and representation theory

![](../../../_temp/Library/permutations/help/figures/permutations.png)

To cite the permutations package in publications, please use Hankin
([2020](#ref-hankin2020)). Here we consider $S_{9}$, the symmetric group
on 9 elements, and representations of its elements. First we will load
the package and change the default print method:

``` r
library("permutations")
options("print_word_as_cycle" = FALSE)
```

Now we will generate a couple of permutations, `a` and `b`:

``` r
a <- as.word(char2cycle("(175296)(348)"))
b <- as.word(char2cycle("(27)(45)(89)"))
a
#>     1 2 3 4 5 6 7 8 9
#> [1] 7 9 4 8 2 1 5 3 6
b
#>     1 2 3 4 5 6 7 8 9
#> [1] . 7 . 5 4 . 2 9 8
```

Now we will show a representation of $S_{9}$, using permutation
matrices:

``` r
M <- diag(9)
rownames(M) <- 1:9
colnames(M) <- 1:9
M
#>   1 2 3 4 5 6 7 8 9
#> 1 1 0 0 0 0 0 0 0 0
#> 2 0 1 0 0 0 0 0 0 0
#> 3 0 0 1 0 0 0 0 0 0
#> 4 0 0 0 1 0 0 0 0 0
#> 5 0 0 0 0 1 0 0 0 0
#> 6 0 0 0 0 0 1 0 0 0
#> 7 0 0 0 0 0 0 1 0 0
#> 8 0 0 0 0 0 0 0 1 0
#> 9 0 0 0 0 0 0 0 0 1
```

We will use the map
$\left. \phi:S_{9}\rightarrow\operatorname{Aut}\left( {\mathbb{R}}^{9} \right) \right.$
given by $\phi(a) =$`M[a,]`. Then

``` r
M[a, ]
#>   1 2 3 4 5 6 7 8 9
#> 7 0 0 0 0 0 0 1 0 0
#> 9 0 0 0 0 0 0 0 0 1
#> 4 0 0 0 1 0 0 0 0 0
#> 8 0 0 0 0 0 0 0 1 0
#> 2 0 1 0 0 0 0 0 0 0
#> 1 1 0 0 0 0 0 0 0 0
#> 5 0 0 0 0 1 0 0 0 0
#> 3 0 0 1 0 0 0 0 0 0
#> 6 0 0 0 0 0 1 0 0 0
```

permutes the rows of $M$ with permutation `a`. Note how the row names
are permuted as well as the elements of $M$. Verifying that $\phi$ is
indeed a homomorphism—that is, $\phi(\iota) = I_{9}$ and
$\phi(a)\phi(b) = \phi(a \circ b)$—is straightforward:

``` r
all(M[as.word(id, 9), ] == diag(9))
#> [1] TRUE
all(M[a * b, ] == M[a, ] %*% M[b, ])
#> [1] TRUE
```

In the second line above, note that the left hand side of the equality
is group composition, while the right hand side is matrix
multiplication. We can further verify that
$\phi\left( a^{- 1} \right) = \phi(a)^{- 1}$:

``` r
all(M[inverse(a), ] == solve(M[a, ]))
#> [1] TRUE
```

again with group inversion on the left and matrix inversion on the
right.

The map $\phi(a) =$`M[,a]` is not a homomorphism:

``` r
all(M[, a * b] == M[, a] %*% M[, b])
#> [1] FALSE
```

but we can “rescue” it by considering a group operation $\star$ defined
by $a \star b = b \circ a$:

``` r
all(M[, b * a] == M[, a] %*% M[, b])
#> [1] TRUE
```

See how the operation has `a` and `b` in opposite order from the matrix
multiplication; see the [order_of_ops](order_of_ops.md) vignette for a
discussion of this phenomenon from a different perspective.

## References

Hankin, R. K. S. 2020. “Introducing the Permutations R Package.”
*SoftwareX* 11. <https://doi.org/10.1016/j.softx.2020.100453>.
