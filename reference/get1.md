# Retrieve particular cycles or components of cycles

Given an object of class `cycle`, function `get1()` returns a
representative of each of the disjoint cycles in the object's elements.
Function `get_cyc()` returns the cycle containing a specific element.

## Usage

``` r
get1(x,drop=TRUE)
get_cyc(x,elt)
```

## Arguments

- x:

  permutation object (coerced to `cycle` class)

- drop:

  In function `get1()`, argument `drop` controls the behaviour if `x` is
  length 1. If `drop` is `TRUE`, then a vector of representative
  elements is returned; if `FALSE`, then a list with one vector element
  is returned

- elt:

  Length-one vector interpreted as a permutation object

## Author

Robin K. S. Hankin

## Examples

``` r
data(megaminx)
get1(megaminx)
#> $White
#> [1] 10 11 21 22 23
#> 
#> $Purple
#> [1] 15 16 17 20 21
#> 
#> $DarkYellow
#> [1] 17 18 19 30 31
#> 
#> $DarkBlue
#> [1] 10 11 19 40 41
#> 
#> $Red
#> [1] 11 12 13 50 51
#> 
#> $DarkGreen
#> [1] 13 14 15 60 61
#> 
#> $LightGreen
#> [1] 30 31 39 70 71
#> 
#> $Orange
#> [1] 27 28 29 80 81
#> 
#> $LightBlue
#> [1] 25 26 27 90 91
#> 
#> $LightYellow
#> [1]  53  54  55 100 101
#> 
#> $Pink
#> [1]  41  42  43 110 111
#> 
#> $Grey
#> [1]  73  74  75 120 121
#> 
get1(megaminx[1])
#> [1] 10 11 21 22 23
get1(megaminx[1],drop=TRUE)
#> [1] 10 11 21 22 23

get_cyc(megaminx,11) 
#>              White             Purple         DarkYellow           DarkBlue 
#>   (11,13,15,17,19)                 ()                 ()  (11,33,79,119,51) 
#>                Red          DarkGreen         LightGreen             Orange 
#> (11,43,115,105,61)                 ()                 ()                 () 
#>          LightBlue        LightYellow               Pink               Grey 
#>                 ()                 ()                 ()                 () 
```
