# Keep or discard some cycles of a permutation

Given a permutation and a function that returns a Boolean specifying
whether a cycle is acceptable, return a permutation retaining only the
acceptable cycles.

## Usage

``` r
keepcyc(a, func, ...)
```

## Arguments

- a:

  Permutation, coerced to cycle

- func:

  Function to be applied to each element of `a`

- ...:

  Further arguments to `fun()`

## Value

Returns a permutation in cycle form

## Author

Robin K. S. Hankin

## Note

Function `keepcyc()` is idempotent.

## See also

[`allcyc`](allperms.md)

## Examples

``` r
keepcyc(rgivenshape(10,2:8),function(x){length(x) == 2})  # retains just transpositions
#>  [1] (7,18)  (32,35) (9,29)  (13,30) (8,19)  (23,25) (1,24)  (3,32)  (21,24)
#> [10] (10,14)
keepcyc(megaminx,function(x){any(x == 100)})              # retains just cycles modifying facet #100
#>                 White                Purple            DarkYellow 
#>                    ()                    ()                    () 
#>              DarkBlue                   Red             DarkGreen 
#>                    ()                    ()                    () 
#>            LightGreen                Orange             LightBlue 
#>                    ()                    ()                    () 
#>           LightYellow                  Pink                  Grey 
#> (100,102,104,106,108)                    ()    (74,86,98,100,112) 
keepcyc(rperm(100),function(x){max(x)-min(x) < 3})        # retains just cycles with range<3
#>   [1] (45)          ()            ()            ()            (123)        
#>   [6] ()            ()            ()            (123)         ()           
#>  [11] ()            ()            ()            ()            ()           
#>  [16] ()            ()            ()            ()            (57)         
#>  [21] ()            ()            ()            ()            (57)         
#>  [26] ()            (46)          ()            ()            (13)         
#>  [31] ()            ()            (56)          ()            (35)         
#>  [36] (35)          ()            ()            ()            ()           
#>  [41] (35)          (34)          (123)(46)(57) (67)          ()           
#>  [46] ()            (46)          ()            ()            (45)         
#>  [51] ()            ()            ()            ()            ()           
#>  [56] ()            ()            ()            (56)          (12)(34)(567)
#>  [61] ()            ()            ()            (24)          ()           
#>  [66] ()            ()            (35)          ()            (13)         
#>  [71] (57)          (24)(57)      (34)          (24)          (23)         
#>  [76] ()            ()            ()            ()            ()           
#>  [81] ()            ()            ()            ()            ()           
#>  [86] ()            ()            (456)         ()            ()           
#>  [91] (56)          ()            ()            ()            ()           
#>  [96] ()            ()            ()            ()            ()           

f <- function(x, p){all(x < p) || all(x > p)}             # keep only cycles with all entries either
keepcyc(rgivenshape(9,rep(2:3,9)), f, p=20)               #  all < 20 or all >20
#> [1] (3,15)(10,17,16)(22,33)(24,37,35)(31,34)(36,43)               
#> [2] (7,17)(14,19)(21,22,26)(23,42)(24,37)(30,43)(31,41)           
#> [3] (1,8)(2,10)(11,12)(13,16,14)(21,34,35)(24,26)(27,42)(28,45,31)
#> [4] (24,45)(27,34)                                                
#> [5] (3,4)(7,18,16)(28,36,45)(29,31)(30,34)(32,38)                 
#> [6] (1,19,17)(4,9,8)(21,44)(22,25,37)(26,43,30)(28,29)(34,42)     
#> [7] (1,13)(2,7)(21,37)(22,33)(23,36)(24,26,29)(25,41,35)          
#> [8] (3,12)(7,15)(10,17,18)(21,40)(22,35)(31,41)                   
#> [9] (4,11)(9,12)(22,25)(23,28)(24,42)(33,39,38)(34,41)            
```
