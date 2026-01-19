# Shape of a permutation

Returns the shape of a permutation. If given a word, it coerces to cycle
form.

## Usage

``` r
shape(x, drop = TRUE, id1 = TRUE, decreasing = FALSE)
shape_cyclist(cyc, id1 = TRUE)
padshape(x, drop = TRUE, n = NULL)
shapepart(x)
shapepart_cyclist(cyc, n = NULL)
```

## Arguments

- x:

  Object of class `cycle` (if not, coerced)

- cyc:

  A cyclist

- n:

  Integer governing the size of the partition assumed, with default
  `NULL` meaning to use the largest element

- drop:

  Boolean, with default `TRUE` meaning to unlist if possible

- id1:

  Boolean, with default `TRUE` in function `shape_cyclist()` meaning
  that the shape of the identity is “1” and `FALSE` meaning that the
  shape is `NULL`

- decreasing:

  In function `shape()`, Boolean with default `FALSE` meaning to return
  the cycle lengths in the order given by
  [`nicify_cyclist()`](cyclist.md) and `TRUE` meaning to sort in
  decreasing order

## Value

Function `shape()` returns a list with elements representing the lengths
of the component cycles.

Function `shapepart()` returns an object of class `partition` showing
the permutation as a set partition of disjoint cycles.

Function `padshape()` returns a list of shapes but padded with ones so
the total is the size of the permutation.

`shapepart_cyclist()` and `shapepart_cyclist()` are low-level helper
functions.

## Author

Robin K. S. Hankin

## Note

What I call “shape”, others call the “cycle type”, so you will sometimes
see “cycle type determines conjugacy class” as a theorem.

## See also

[`size`](size.md),[`conjugate`](conjugate.md)

## Examples

``` r
jj <- as.cycle(c("123", "", "(12)(34)", "12345"))
jj
#> [1] (123)    ()       (12)(34) (12345) 
shape(jj)
#> [[1]]
#> [1] 3
#> 
#> [[2]]
#> [1] 1
#> 
#> [[3]]
#> [1] 2 2
#> 
#> [[4]]
#> [1] 5
#> 

shape(rperm(10, 9)) # coerced to cycle
#> [[1]]
#> [1] 6 3
#> 
#> [[2]]
#> [1] 6 3
#> 
#> [[3]]
#> [1] 4 5
#> 
#> [[4]]
#> [1] 6 2
#> 
#> [[5]]
#> [1] 6 3
#> 
#> [[6]]
#> [1] 4 2
#> 
#> [[7]]
#> [1] 2 4 2
#> 
#> [[8]]
#> [1] 9
#> 
#> [[9]]
#> [1] 7 2
#> 
#> [[10]]
#> [1] 3 5
#> 

a <- rperm()
identical(shape(a, dec=TRUE), shape(a^cyc_len(2), dec=TRUE))
#> [1] TRUE


data(megaminx)
shape(megaminx)
#> $White
#> [1] 5 5 5 5 5
#> 
#> $Purple
#> [1] 5 5 5 5 5
#> 
#> $DarkYellow
#> [1] 5 5 5 5 5
#> 
#> $DarkBlue
#> [1] 5 5 5 5 5
#> 
#> $Red
#> [1] 5 5 5 5 5
#> 
#> $DarkGreen
#> [1] 5 5 5 5 5
#> 
#> $LightGreen
#> [1] 5 5 5 5 5
#> 
#> $Orange
#> [1] 5 5 5 5 5
#> 
#> $LightBlue
#> [1] 5 5 5 5 5
#> 
#> $LightYellow
#> [1] 5 5 5 5 5
#> 
#> $Pink
#> [1] 5 5 5 5 5
#> 
#> $Grey
#> [1] 5 5 5 5 5
#> 

jj <- megaminx*megaminx[1]
identical(shape(jj), shape(tidy(jj)))  #tidy() does not change shape
#> [1] TRUE


allperms(3)
#> [1] ()    (23)  (12)  (123) (132) (13) 
#> [coerced from word form]
shapepart(allperms(3))
#>                 
#> [1,] 1 2 1 1 1 1
#> [2,] 2 1 1 1 1 2
#> [3,] 3 1 2 1 1 1
shapepart(rperm(10, 5))
#>                         
#> [1,] 1 1 3 1 2 1 1 1 1 1
#> [2,] 2 1 1 1 1 1 1 2 1 1
#> [3,] 2 1 1 1 1 1 1 1 2 2
#> [4,] 1 2 2 1 1 1 1 1 1 3
#> [5,] 2 1 2 1 1 1 1 1 1 2

shape_cyclist(list(1:4, 8:9))
#> [1] 4 2
shapepart_cyclist(list(1:4, 8:9))
#> [1] 1 1 1 1 3 4 5 2 2
```
