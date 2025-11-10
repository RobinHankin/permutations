# Group-theoretic commutator: the dot object

In the permutations package, the dot is defined as the **Group-theoretic
commutator**: \\\[x,y\]=x^{-1}y^{-1}xy\\. This is a bit of an exception
to the usual definition of `xy-yx` (along with the freegroup package).
Package idiom is `commutator(x,y)` or `.[x,y]`.

The Jacobi identity does not make sense in the context of the
permutations package, but the Hall-Witt identity is obeyed.

The “dot” object is defined and discussed in `inst/dot.Rmd`, which
creates file `data/dot.rda`.

## Usage

``` r
commutator(x, y)
```

## Arguments

- x,y:

  Permutation objects, coerced to word

## Author

Robin K. S. Hankin

## Examples

``` r
.[as.cycle("123456789"),as.cycle("12")]
#> [1] (123)
#> [coerced from word form]


x <- rperm(10,7)
y <- rperm(10,8)
z <- rperm(10,9)

uu <- 
commutator(commutator(x,y),z^x) *
commutator(commutator(z,x),y^z) *
commutator(commutator(y,z),x^y) 

stopifnot(all(is.id(uu)))  # this is the  Hall-Witt identity


.[x,y]
#>  [1] (132)        (145738)(26) (2546873)    (17234)      (12756)(384)
#>  [6] (1827543)    (1765243)    (1624875)    (2536784)    (1852)(46)  
#> [coerced from word form]

is.id(.[.[x,y],z^x] * .[.[z,x],y^z] * .[.[y,z],x^y])
#>  [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
is.id(.[.[x,-y],z]^y * .[.[y,-z],x]^z * .[.[z,-x],y]^x)
#>  [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
```
