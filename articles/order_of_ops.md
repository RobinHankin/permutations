# The permutation group: active and passive permutations, and the order of operations

![](../../../_temp/Library/permutations/help/figures/permutations.png)

To cite the permutations package in publications, please use Hankin
([2020](#ref-hankin2020)). When considering permutation groups, the
order of operations can be confusing. Here I discuss active and passive
transforms, order of operations, prefix and postfix notation, and
associativity from the perspective of the `permutations` R package.

- An **active permutation** $\pi$ moves an object from place $i$ to
  place $\pi(i)$. Textbooks and undergraduate courses usually use this
  system.
- A **passive permutation** $\pi$ replaces an object in position $i$ by
  that in position $\pi(i)$.

### Introduction

Consider the following package idiom:

``` r
a <- as.cycle("(145)(26)")
a
```

    ## [1] (145)(26)

Thus we can see that $a$ has a three-cycle $(145)$ and a two-cycle
$(26)$. We can express $a$ in word form by changing the default print
method which coerces to cycle form:

``` r
options("print_word_as_cycle" = FALSE)
(a <- as.word(a))
```

    ##     1 2 3 4 5 6
    ## [1] 4 6 . 5 1 2

showing that 3 is a fixed point (indicated with a dot). In matrix form
we would have:

$$\begin{pmatrix}
1 & 2 & 3 & 4 & 5 & 6 \\
4 & 6 & 3 & 5 & 1 & 2
\end{pmatrix}$$

Expressed in functional notation, we have a function
$\left. a:\lbrack 6\rbrack\rightarrow\lbrack 6\rbrack \right.$ (here
$\lbrack n\rbrack = \left\{ 1,2,\ldots,n \right\}$); and we have
$a(1) = 4$, $a(2) = 6$, $a(3) = 3$, and so on. If these were objects, or
people, we might want to keep track of where they are. We would say: “at
the start, object $i$ sits in place $i$, $i \in \lbrack 6\rbrack$. Then,
after the move, object 1 is in place 4, object 2 in place 6, object 3 in
place 3, and so on”. This information is encapsulated by `as.word(a)`.
In R matrix form we would have

``` r
a_active <- rbind(1:6, as.word(a))
rownames(a_active) <- c("place before move", "place after move")
a_active
```

    ##                   [,1] [,2] [,3] [,4] [,5] [,6]
    ## place before move    1    2    3    4    5    6
    ## place after move     4    6    3    5    1    2

(in the above R chunk, note how the top row is `1:6`. We give the
objects persistent labels: each object is named according to the place
it sits in, before any moving).

On the other hand, we might be more interested in the *places*. We might
want to know which object is sitting in place 4. We would say: “at the
start, object $i$ sits in place $i$, $i \in \lbrack 6\rbrack$. Then
place 1 is occupied by object 4, place 2 occupied by object 5, and so
on”. This information is technically represented by permutation `a` but
in an obscure form. To answer the question “which object is in place
$i$?” in a convenient way, we need to rearrange the permutation:

\$\$ \left( \begin{array}{ccccccccc} 1&2&3&4&5&6\\ 4&6&3&5&1&2
\end{array} \right) {\mbox{swap rows}\atop\longrightarrow} \left(
\begin{array}{ccccccccc} 4&6&3&5&1&2\\ 1&2&3&4&5&6 \end{array}
\right){\mbox{shuffle columns}\atop\longrightarrow} \left(
\begin{array}{ccccccccc} 1&2&3&4&5&6\\ 5&6&3&1&4&2 \end{array} \right)
\$\$

In the above, it is easy to see that the rearrangement of permutation is
equivalent to taking a group-theoretic inverse:

``` r
inverse(a)
```

    ##     1 2 3 4 5 6
    ## [1] 5 6 . 1 4 2

(even now I find the R idiom for inversion to be unreasonably elegant:
`a[a] <- seq_along(a)`). In R idiom, the two-row matrix form would use
[`inverse()`](../reference/inverse.md):

``` r
a_passive <- rbind(1:6, as.word(inverse(a)))
rownames(a_passive) <- c("place after move", "place before move")
a_passive
```

    ##                   [,1] [,2] [,3] [,4] [,5] [,6]
    ## place after move     1    2    3    4    5    6
    ## place before move    5    6    3    1    4    2

(in the above R chunk, note how the top row—the *place* an object sits
in after the move—is `1:6`). Thus from the first column we see that the
object currently in place 1 was originally in place 5, and the object
currently in place 5 was originally in place 4. If the people
subsequently move again, the mathematics and the R idiom depend on
whether we are interested in people, or places. We need to specify use
of *active* or *passive* transformations, much as in the Lorentz
package.

### Composition of active permutations

Suppose we have (active) permutation `a` as above, and another active
permutation `b`:

``` r
b <- as.word(c(5, 2, 3, 4, 6, 1))
b
```

    ##     1 2 3 4 5 6
    ## [1] 5 . . . 6 1

(note the three dots representing three fixed points of `b`). Note
carefully that the operations $a$ and $b$ do not commute and we will
discuss this in the context of active and passive transforms. What is
the result of executing $a$, followed by $b$? Symbolically we have:

$$\overset{a}{\overbrace{\begin{pmatrix}
1 & 2 & 3 & 4 & 5 & 6 \\
4 & 6 & 3 & 5 & 1 & 2
\end{pmatrix}}} \circ \overset{b}{\overbrace{\begin{pmatrix}
1 & 2 & 3 & 4 & 5 & 6 \\
5 & 2 & 3 & 4 & 6 & 1 \\
 & & & & & 
\end{pmatrix}}} = \overset{a \circ b}{\overbrace{\begin{pmatrix}
1 & 2 & 3 & 4 & 5 & 6 \\
4 & 1 & 3 & 6 & 5 & 2 \\
 & & & & & 
\end{pmatrix}}}$$

Thus, for example, $\left. 4\rightarrow 5\rightarrow 6 \right.$.
Considering the operation $a \circ b$, this means that we perform
permutation `a` first, and then perform permutation `b`. Taking this one
step at a time we would have, for example: “We start with object $i$ in
place $i$. The object in place 4 (this is object 4) moves to place 5
(but is still object 4) $\ldots$ and then the object in place 5 (this is
still object 4) moves to place 6”. See how we track the object that
started in place 4 (that is, object 4) over two permutations, and so
overall object 4 ends up in place 6. We see this on the right hand side:
the fourth column of $a \circ b$ is $\begin{pmatrix}
4 \\
6
\end{pmatrix}$. The figure shows this visually.

Visual representation of active permutation composition

In R, if we express `a` and `b` as active permutations, and wish to
express the result of performing `a` then `b` in active language, we can
use standard permutation composition, in package idiom the `*` operator:

``` r
a * b
```

    ##     1 2 3 4 5 6
    ## [1] 4 1 . 6 . 2

The `*` operator in R idiom is essentially carries out `b[a]` to
evaluate `a*b` (which is why indexing starts at 1, not 0). Indeed we may
verify that package idiom operates as expected:

``` r
as.vector(b)[as.vector(a)]
```

    ## [1] 4 1 3 6 5 2

showing agreement. With functional notation (also known as prefix
notation) we can ask what happens to the object originally in place 1
(that would be object 1)

``` r
fa <- as.function(a)
fb <- as.function(b)
fb(fa(1))
```

    ## [1] 4

``` r
as.function(a * b)(1) # should match fb(fa(1))
```

    ## [1] 4

Note, however, the confusing order of operations: in functional
notation, if we want to operate on an element $x$ by function $f$ and
then by function $g$ we write $g\left( f(x) \right)$ for the two
successive mappings
$\left. x\rightarrow f(x)\rightarrow g\left( f(x) \right) \right.$.
Postfix notation would denote the same process as $xfg$, as shorthand
for $(xf)g$. In R idiom, this is implemented by the excellent `magrittr`
package:

``` r
1 %>%
  fa() %>%
  fb() # idiom for fb(fa(1)), should match result above
```

    ## [1] 4

## Composition of passive permutations

Now we consider operations `a` and `b` as discussed above. But this time
we express the permutations, and their composition, in passive form, and
this requires some modification.

``` r
a # word form
```

    ##     1 2 3 4 5 6
    ## [1] 4 6 . 5 1 2

``` r
a_active # matrix form (active); defined above
```

    ##                   [,1] [,2] [,3] [,4] [,5] [,6]
    ## place before move    1    2    3    4    5    6
    ## place after move     4    6    3    5    1    2

``` r
a_passive # matrix form (passive); defined above
```

    ##                   [,1] [,2] [,3] [,4] [,5] [,6]
    ## place after move     1    2    3    4    5    6
    ## place before move    5    6    3    1    4    2

Now `b`, but we need to create equivalents `b_active` and `b_passive`
which we do as before:

``` r
b_active <- rbind(1:6, as.word(b))
rownames(b_active) <- c("place before move", "place after move")
b_passive <- rbind(1:6, as.word(inverse(b)))
rownames(b_passive) <- c("place after move", "place before move")
```

``` r
b
```

    ##     1 2 3 4 5 6
    ## [1] 5 . . . 6 1

``` r
b_active
```

    ##                   [,1] [,2] [,3] [,4] [,5] [,6]
    ## place before move    1    2    3    4    5    6
    ## place after move     5    2    3    4    6    1

``` r
b_passive
```

    ##                   [,1] [,2] [,3] [,4] [,5] [,6]
    ## place after move     1    2    3    4    5    6
    ## place before move    6    2    3    4    1    5

(note again the relationship between `b_active` and `b_passive`). We
want to perform `a` and then `b` as before, but this time we want to use
matrices `a_passive` and `b_passive`:

``` r
a_passive
```

    ##                   [,1] [,2] [,3] [,4] [,5] [,6]
    ## place after move     1    2    3    4    5    6
    ## place before move    5    6    3    1    4    2

``` r
b_passive
```

    ##                   [,1] [,2] [,3] [,4] [,5] [,6]
    ## place after move     1    2    3    4    5    6
    ## place before move    6    2    3    4    1    5

To work out the composition of `a_passive` and `b_passive` \[explicitly:
give the passive transform corresponding to performing `a_passive`
first, and then `b_passive` second\] we want a passive transformation,
that is, a matrix with the same row labels as, say `a_passive` and first
row `1:6`. Let us call the result of these two permutations
`ab_passive`. Given that `ab_passive[1,1]=1`, we ask “what is
`ab_passive[2,1]`? This is equivalent to asking,”we have just performed
permutation `a` followed by `b`. The object currently in place 1: where
was it before this composition of permutations?”

To figure out which object is in place 1, we would look at `b_passive`,
being the most recent operation. We would then look at the first column
of `b_passive` and say that the object that was in place 6 was moved by
`b_passive` to place 1. And then you would have to figure out which
object was in place 6 before `b_passive` was executed. To answer *that*,
you would look at `a_passive` and see, from column 6 of `a_passive` that
the object in place 6 was moved from place 2 by `a`. Thus the passive
transform `ab_passive` indicates that the object in place 1 after the
move was in place 2 before the move. We would have
$\left. 1\rightarrow 6\rightarrow 2 \right.$ where in this case
“$\rightarrow$” means “comes from”.

We can thus represent the passive transformation by
`b_passive*a_passive`: see how the R idiom for permutation composition
“`*`” is used in exactly the same way for active and passive
permutations, but with a different meaning which requires us to reverse
the order of permutations. To express the result, `ab_passive` in active
language we need to take the group-theoretic inverse of the composition.
Recalling that passive transforms are the group-theoretic inverses of
the same active transformation, in algebraic notation we would have

$$\left( a^{- 1}b^{- 1} \right)^{- 1} = ab;\qquad a^{- 1}b^{- 1} = (ab)^{- 1}$$

and in R idiom we would have

``` r
inverse(inverse(b) * inverse(a)) == a * b # both should be TRUE
```

    ## [1] TRUE

``` r
inverse(b) * inverse(a) == inverse(a * b) # note b precedes a on LHS
```

    ## [1] TRUE

## Permutation matrices

Now we will show how permutation matrices work and how they deal with
active and passive language.

``` r
g <- as.cycle(c(1, 2, 6))
g
```

    ## [1] (126)

Then we can express `g` in terms of permutation matrices:

``` r
pg <- perm_matrix(g)
pg
```

    ##   1 2 3 4 5 6
    ## 1 0 1 0 0 0 0
    ## 2 0 0 0 0 0 1
    ## 3 0 0 1 0 0 0
    ## 4 0 0 0 1 0 0
    ## 5 0 0 0 0 1 0
    ## 6 1 0 0 0 0 0

But it is convenient to relabel the rows and the columns:

``` r
dimnames(pg) <- list(place_before_move = 1:6, place_after_move = 1:6)
pg
```

    ##                  place_after_move
    ## place_before_move 1 2 3 4 5 6
    ##                 1 0 1 0 0 0 0
    ##                 2 0 0 0 0 0 1
    ##                 3 0 0 1 0 0 0
    ##                 4 0 0 0 1 0 0
    ##                 5 0 0 0 0 1 0
    ##                 6 1 0 0 0 0 0

Row `n` of matrix `pg` shows where the object that was in place `n`
before the move ends up. Thus, looking at the top row (row 1), we see
that the object that was in place 1 is now in place 2 \[because the
second column of row 1 is nonzero\]. The second row (row 2) shows that
the object that was in place 2 is now in place 6, the object that was in
place 3 is now in place 6, and so on. This is active language.

We can see that taking the transpose is equivalent to inverting the
matrix: a permutation matrix is orthogonal. Now we can consider a second
permutation `h` and convert it to matrix form:

``` r
h <- as.word(c(1, 3, 4, 5, 2, 6))
h
```

    ##     1 2 3 4 5 6
    ## [1] . 3 4 5 2 .

``` r
ph <- perm_matrix(h)
dimnames(ph) <- list(place_before_move = 1:6, place_after_move = 1:6)
ph
```

    ##                  place_after_move
    ## place_before_move 1 2 3 4 5 6
    ##                 1 1 0 0 0 0 0
    ##                 2 0 0 1 0 0 0
    ##                 3 0 0 0 1 0 0
    ##                 4 0 0 0 0 1 0
    ##                 5 0 1 0 0 0 0
    ##                 6 0 0 0 0 0 1

We now consider what happens with successive permutations, as above, but
this time using permutation matrices. We will permute first with `g` and
then with `h`, using matrix multiplication.

     pg                                  ph
                      place_after_move                    place_after_move
     place_before_move 1 2 3 4 5 6       place_before_move 1 2 3 4 5 6
                     1 0 1 0 0 0 0                       1 1 0 0 0 0 0
                     2 0 0 0 0 0 1                       2 0 0 1 0 0 0
                     3 0 0 1 0 0 0                       3 0 0 0 1 0 0
                     4 0 0 0 1 0 0                       4 0 0 0 0 1 0
                     5 0 0 0 0 1 0                       5 0 1 0 0 0 0
                     6 1 0 0 0 0 0                       6 0 0 0 0 0 1

(the above is hand-edited to put the matrices side-by-side for
convenience). Composition of permutations is just matrix multiplication:

``` r
pg %*% ph
```

    ##                  place_after_move
    ## place_before_move 1 2 3 4 5 6
    ##                 1 0 0 1 0 0 0
    ##                 2 0 0 0 0 0 1
    ##                 3 0 0 0 1 0 0
    ##                 4 0 0 0 0 1 0
    ##                 5 0 1 0 0 0 0
    ##                 6 1 0 0 0 0 0

Thinking about the matrix multiplication, let us consider the top row of
`pg`. This multiplies by each column of `ph` but the only nonzero term
is with column 3 of `ph` which has row 2 nonzero. Thus
`(pg%*%ph)[1,3]==1`. The process is, symbolically,
$\left. 1\rightarrow 2\rightarrow 3 \right.$.

#### Passive language for permutation matrices

Alternatively, we could look at matrix `pg` in terms of columns. Column
`n` of this matrix shows where the object that ended up in place `n`
came from. Thus, looking at column 1, we see that the object that ended
up in column 1 came from place 6, and the object that ended up in place
2 came from place 1, and so on. This is passive language.

Thus the passive matrix is the *transpose* of the active matrix (we
could see this by swapping the dimension names). Now we use the matrix
rule

$$AB = (B\prime A\prime)\prime$$

to show that permutation matrix multiplication has to be in the opposite
order for passive matrices. Of course, we could observe that permutation
matrices are orthogonal and use

$$AB = \left( B^{- 1}A^{- 1} \right)^{- 1}$$

instead. Numerical verification using package idiom is straightforward.
First we verify that permutation matrices are indeed orthogonal:

``` r
pa_active <- perm_matrix(a)
all(solve(pa_active) == t(pa_active))
```

    ## [1] TRUE

Now we verify that matrix multiplication of permutation matrices
corresponds to active permutation composition:

``` r
pb_active <- perm_matrix(b)
all(perm_matrix(a*b) == pa_active %*% pb_active)
```

    ## [1] TRUE

Finally, we verify that passive composition is reverse-order matrix
multiplication:

``` r
pa_passive <- perm_matrix(inverse(a))
pb_passive <- perm_matrix(inverse(b))
all(solve(perm_matrix(a * b)) == pb_passive %*% pa_passive) # note order of ops
```

    ## [1] TRUE

Above we see numerical verification that the passive form of `a*b`
(expressed as a permutation matrix) is equal to the matrix product of
(passive) permutations `b` and `a` (expressed as permutation matrices).

## References

Hankin, R. K. S. 2020. “Introducing the Permutations R Package.”
*SoftwareX* 11. <https://doi.org/10.1016/j.softx.2020.100453>.
