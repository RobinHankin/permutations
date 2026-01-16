# Print methods in the permutations package

![](../../../_temp/Library/permutations/help/figures/permutations.png)

To cite the permutations package in publications, please use Hankin
([2020](#ref-hankin2020)). The `permutations` package has a print method
which includes a number of user-configurable options which are
illustrated and motivated here.

Permutations have two natural representations: word form and cycle form.
Internally, the package coerces a permutation from one form to another
depending on what operations one does with it. Group-theoretic products
and inverses are carried out more easily in word form, while powers are
more easily done using cycle form.

Partly as a result of a perceptive comment from a journal reviewer, the
package coerces to cycle form for printing as this is generally more
comprehensible than word form. However, the package print method is
extensively customizable. This document covers some of the options.
Low-level print functionality includes
[`print_word()`](../reference/print.md) and
[`print_cycle()`](../reference/print.md) which can be used explicitly to
print in either word form or cycle form as desired:

``` r
set.seed(0)
x <- rperm(r = 9)
print_word(x)
#>      1 2 3 4 5 6 7 8 9
#> [1]  9 4 7 1 2 . 3 . 5
#> [2]  2 3 8 1 . . 9 7 4
#> [3]  7 1 9 5 6 8 4 2 3
#> [4]  5 . 8 6 1 4 3 9 7
#> [5]  3 6 2 7 4 5 8 9 1
#> [6]  7 6 1 . 9 3 2 . 5
#> [7]  3 . 6 7 8 1 5 9 4
#> [8]  6 1 . 7 4 2 9 . 5
#> [9]  4 5 1 7 9 3 6 . 2
#> [10] 6 5 4 7 1 8 9 3 2
print_cycle(x)
#>  [1] (19524)(37)    (1238794)      (1745682)(39)  (15)(3897)(46) (132654789)   
#>  [6] (17263)(59)    (136)(47589)   (162)(4795)    (14763)(259)   (168347925)
```

It is a matter of taste which one is preferable. For the example above,
the majority of the symbols are moved: elements that map to themselves
are shown with a dot in the word form, and these are in a minority.
However, the difference between word form and cycle form becomes more
pronounced if only a small number of elements move:

``` r
x <- rperm(r = 9, moved = 3)
print_word(x)
#>      1 2 3 4 5 6 7 8 9
#> [1]  7 . . . . . 9 . 1
#> [2]  . 9 2 . . . . . 3
#> [3]  . . . . . . . . .
#> [4]  3 . 1 . . . . . .
#> [5]  . 8 . . 2 . . 5 .
#> [6]  . . . 6 . 4 . . .
#> [7]  . . . . . . . . .
#> [8]  . . . 8 . . . 4 .
#> [9]  6 . 1 . . 3 . . .
#> [10] . . . 9 . . . . 4
print_cycle(x)
#>  [1] (179) (293) ()    (13)  (285) (46)  ()    (48)  (163) (49)
```

Above we see the cycle form is arguably more compact.

### One-line notation for permutations

Sometimes it is desirable to present permutations in “one-line
notation”, which is just the ordered list of the images of
$1,2,\ldots,n$; this is just a compact form of the two-line notation:

$$\begin{pmatrix}
1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 \\
9 & 2 & 6 & 3 & 5 & 4 & 1 & 7 & 8
\end{pmatrix}$$

would just be (926354178). To do this, use
`print_word(x, use_dot=TRUE)`:

``` r
print_word(x, use_dot=FALSE)
#>      1 2 3 4 5 6 7 8 9
#> [1]  7 2 3 4 5 6 9 8 1
#> [2]  1 9 2 4 5 6 7 8 3
#> [3]  1 2 3 4 5 6 7 8 9
#> [4]  3 2 1 4 5 6 7 8 9
#> [5]  1 8 3 4 2 6 7 5 9
#> [6]  1 2 3 6 5 4 7 8 9
#> [7]  1 2 3 4 5 6 7 8 9
#> [8]  1 2 3 8 5 6 7 4 9
#> [9]  6 2 1 4 5 3 7 8 9
#> [10] 1 2 3 9 5 6 7 8 4
```

## Print word as cycle

In use, sometimes we work with objects in word form and sometimes
objects in cycle form. However, the standard workflow would be to use
R’s default system, which is to print values to the console:

``` r
x <- rperm(n = 2)
y <- as.cycle(x)
unclass(x) # shows internal representation (x is in word form)
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#> [1,]    2    6    1    7    3    5    4
#> [2,]    7    4    1    6    3    5    2
unclass(y) # shows internal representation (x is in cycle form)
#> [[1]]
#> [[1]][[1]]
#> [1] 1 2 6 5 3
#> 
#> [[1]][[2]]
#> [1] 4 7
#> 
#> 
#> [[2]]
#> [[2]][[1]]
#> [1] 1 7 2 4 6 5 3
x # default: print to console
#> [1] (12653)(47) (1724653)  
#> [coerced from word form]
y # default: print to console
#> [1] (12653)(47) (1724653)
```

Above we see that, by default, both `x` and `y` are printed in cycle
form, even though `x` is stored internally in word form. See how the
print method tells us if its argument object is printed in
coerced-to-cycle form. However, it is possible to suppress this coercion
by setting option `print_word_as_cycle`:

``` r
options(print_word_as_cycle = FALSE)
x
#>     1 2 3 4 5 6 7
#> [1] 2 6 1 7 3 5 4
#> [2] 7 4 1 6 3 5 2
y
#> [1] (12653)(47) (1724653)
```

We reinstate the default:

``` r
options(print_word_as_cycle = TRUE) # restore default
```

Most people seem to prefer printing in cycle form.

### Commas

Above, we saw the print method for permutations of $\lbrack 9\rbrack$.
If we have 10 or more elements then we need a comma. This is added by
default:

``` r
x <- rperm(r = 15, moved = 4)
print_cycle(x)
#>  [1] (1,4,2,3)     (10,13,15)    (3,14)        (9,10,12)     (5,15,7,9)   
#>  [6] (6,14)(12,15) (6,8,9)       (8,12,11)     (1,4,5)       (5,6,8)
```

Above, the comma has been added to aid readability. However, it is
possible to override this behaviour by setting option `comma`. The
default value of `NULL` means to add commas iff $r > 9$ but Boolean
values are respected:

``` r
options("comma" = TRUE)
rperm(3, r = 9) # commas printed irregardless
#> [1] (1,2,8,3,6,9,5,4,7) (1,8,3,4,9,6,2,7,5) (1,9,2,7,8,5,4,6,3)
#> [coerced from word form]
```

Above we see the commas making the output somewhat prolix, but not a
disaster. However, if we are permuting $> 9$ objects commas are
necessary to interpret strings like `124` which might be `1,2,4` or
`12,4` or `1,24` or `124`:

``` r
options("comma" = FALSE)
x <- rperm(3, r = 20)
x # commas not printed irregardless
#> [1] (194516182719314111013)(612815)(1720) (11771416615345122092)(8191811)(1013)
#> [3] (1515)(2112043)(714891210)(131718)   
#> [coerced from word form]
options("comma" = NULL) # restore default
x # default for comparison
#> [1] (1,9,4,5,16,18,2,7,19,3,14,11,10,13)(6,12,8,15)(17,20)
#> [2] (1,17,7,14,16,6,15,3,4,5,12,20,9,2)(8,19,18,11)(10,13)
#> [3] (1,5,15)(2,11,20,4,3)(7,14,8,9,12,10)(13,17,18)       
#> [coerced from word form]
```

Above, the absence of commas is somewhat confusing, default restored.

### Symbols

The `permutations` package considers permutations of a finite set. It is
*very* convenient to identify the finite set with integers
$1,2,\ldots,n$ \[chiefly because products and inverses are easy if one
can use R’s 1-based vector indexing: products are just `a*b=b[a]` and
the inverse of `W` is just `W[W] <- seq_along(W)`\]. Because of this,
the default print method echoes the internal representation of a
permutation.

``` r
set.seed(0)
x <- rperm(n = 3)
dput(x)
#> structure(c(6L, 7L, 5L, 1L, 3L, 2L, 4L, 2L, 6L, 3L, 6L, 3L, 7L, 
#> 4L, 1L, 2L, 1L, 4L, 5L, 5L, 7L), dim = c(3L, 7L), class = c("permutation", 
#> "word"))
x
#> [1] (162)(34)(57) (17546)(23)   (15)(364)    
#> [coerced from word form]
```

We see the print method echoing the internal representation of the set
$\lbrack n\rbrack = \left\{ 1,2,\ldots,n \right\}$. However, it is
possible to use a different set, using option `perm_set`:

``` r
options(perm_set = letters)
rperm()
#>  [1] (aegdb)(cf)  (abfec)      (acbf)(de)   (adfcbge)    (bdcge)     
#>  [6] (acfgd)      (afgdeb)     (ad)(bf)(eg) (bfeg)(cd)   (afcdgbe)   
#> [coerced from word form]
```

Above we see cyclic representation of permutations of the letters a-z.
However, the use of commas is somewhat problematic, and by default the
print method uses the $> 9$ criterion for including a comma:

``` r
(xx <- rperm(n = 2, r = 26))
#> [1] (a,f,r,h,k,l,c,i,j,w,z,v,y,o,u,d,g,p)(b,q,t,e,s,n) 
#> [2] (a,s,z,l,y,r,p,m,u,b,c,k,w,q,x,j,v,h,i,e,n,o,g,t,d)
#> [coerced from word form]
```

Above we see that commas are included (because $26 > 9$) but it probably
looks better without them:

``` r
options(comma = FALSE)
xx
#> [1] (afrhklcijwzvyoudgp)(bqtesn) (aszlyrpmubckwqxjvhienogtd) 
#> [coerced from word form]
```

One side-effect of using a finite set of symbols is that the print
method might run out of symbols:

``` r
(z <- rperm(n = 2, r = 50))
#> [1] (agNANAyNAepqNANAhbNAuNANAjNAlzNANAdxNAfsNAoNANANArkmNAvnNANANANANAwNANAi)(ct)    
#> [2] (aNANArNANANAi)(bNANAsNAlvzNAgNANAwNANANAoNANAjtnpNAyeNANAmNAfNAcNAq)(dhu)(kxNANA)
#> [coerced from word form]
```

Above we see `NA` printed where the symbol’s index exceeds 26 (also the
absence of commas does not help). Remember that the print method does
not change the object itself, so this might not be an issue. It is
possible to use symbols that have more than one character:

``` r
options(perm_set = state.abb)
options(comma = TRUE)
z
#> [1] (AL,CT,OK,WV,MO,NC,CA,KS,KY,PA,NE,DE,AK,WA,MA,NY,NJ,GA,RI,ID,MT,VA,SD,AR,MS,SC,CO,ME,NM,IA,VT,WI,NH,LA,HI,IL,ND,MI,IN,TX,TN,OR,OH,WY,MN,UT,NV,FL)(AZ,MD)  
#> [2] (AL,NE,SC,LA,WA,WV,ND,FL)(AK,UT,TN,ME,VA,ID,MI,MT,NV,CT,NH,VT,MN,NC,WY,OR,IA,NJ,NY,GA,MD,IN,KS,WI,MO,CA,OK,RI,IL,PA,CO,SD,AZ,NM,KY)(AR,DE,MA)(HI,MS,TX,OH)
#> [coerced from word form]
```

## Cycles in length order

Consider the following:

``` r
options(perm_set = NULL) # revert to numbers
options(comma = FALSE) # supress comma
x <- rgivenshape(30, 2:4)
x
#>  [1] (1938)(256)(47) (162)(3547)(89) (189)(24)(3567) (1523)(48)(697)
#>  [5] (163)(25)(4978) (1263)(45)(789) (1829)(36)(457) (1764)(239)(58)
#>  [9] (153)(28)(4976) (1783)(265)(49) (1829)(34)(576) (13)(2496)(587)
#> [13] (1326)(498)(57) (1537)(286)(49) (17)(284)(3965) (1846)(237)(59)
#> [17] (1597)(246)(38) (1392)(486)(57) (17)(268)(3549) (1972)(356)(48)
#> [21] (198)(2647)(35) (14)(2853)(697) (19)(247)(3568) (1458)(29)(367)
#> [25] (1249)(367)(58) (1794)(256)(38) (1394)(287)(56) (167)(2439)(58)
#> [29] (15)(287)(3649) (1369)(285)(47)
```

We see 30 random permutations with shape
$( \cdot \, \cdot )( \cdot \cdot \cdot )( \cdot \cdot \cdot )$. However,
because function [`nicify_cyclist()`](../reference/cyclist.md) sorts
each cycle so that the smallest element is first, then sorts the cycles
by first element, it is not obvious that all the permutations above have
the same shape. The print method is sensitive to experimental option
`print_in_length_order` (via function
[`as.character_cyclist()`](../reference/print.md)). If `TRUE`,
permutations cycle form will be printed but with the cycles in
increasing length order:

``` r
options("print_in_length_order" = TRUE)
x
#>  [1] (47)(256)(1938) (89)(162)(3547) (24)(189)(3567) (48)(697)(1523)
#>  [5] (25)(163)(4978) (45)(789)(1263) (36)(457)(1829) (58)(239)(1764)
#>  [9] (28)(153)(4976) (49)(265)(1783) (34)(576)(1829) (13)(587)(2496)
#> [13] (57)(498)(1326) (49)(286)(1537) (17)(284)(3965) (59)(237)(1846)
#> [17] (38)(246)(1597) (57)(486)(1392) (17)(268)(3549) (48)(356)(1972)
#> [21] (35)(198)(2647) (14)(697)(2853) (19)(247)(3568) (29)(367)(1458)
#> [25] (58)(367)(1249) (38)(256)(1794) (56)(287)(1394) (58)(167)(2439)
#> [29] (15)(287)(3649) (47)(285)(1369)
```

## Wrapup

Above we used state abbreviations (a builtin R dataset) and also direct
the print method to use commas for readability. However, it is best to
reset to the default, as the option persists between vignettes:

``` r
options(perm_set = NULL)
options(comma = NULL)
options(print_word_as_cycle = FALSE)
options("print_in_length_order" = FALSE)
```

## References

Hankin, R. K. S. 2020. “Introducing the Permutations R Package.”
*SoftwareX* 11. <https://doi.org/10.1016/j.softx.2020.100453>.
