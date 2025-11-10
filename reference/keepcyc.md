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
#>  [1] (9,29)  (14,35) (4,23)  (3,23)  (4,20)  (8,15)  (12,13) (1,33)  (11,18)
#> [10] (7,28) 
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
#>   [1] (12)          ()            ()            ()            ()           
#>   [6] ()            ()            ()            (243)(56)     ()           
#>  [11] (23)          ()            (45)          ()            ()           
#>  [16] ()            ()            (46)          ()            ()           
#>  [21] ()            ()            (567)         ()            (123)        
#>  [26] ()            ()            ()            ()            ()           
#>  [31] ()            ()            ()            ()            ()           
#>  [36] (57)          ()            ()            ()            ()           
#>  [41] (57)          ()            (46)          ()            ()           
#>  [46] (13)          ()            ()            (56)          ()           
#>  [51] (35)          (35)          ()            ()            ()           
#>  [56] ()            (35)          (34)          (123)(46)(57) (67)         
#>  [61] ()            ()            (46)          ()            ()           
#>  [66] (45)          ()            ()            ()            ()           
#>  [71] ()            ()            ()            ()            (56)         
#>  [76] (12)(34)(567) ()            ()            ()            (24)         
#>  [81] ()            ()            ()            (35)          ()           
#>  [86] (13)          (57)          (24)(57)      (34)          (24)         
#>  [91] (23)          ()            ()            ()            ()           
#>  [96] ()            ()            ()            ()            ()           

f <- function(x,p){all(x<p) || all(x>p)}                  # keep only cycles with all entries either
keepcyc(rgivenshape(9,rep(2:3,9)),f,p=20)                 #  all < 20 or all >20
#> [1] (1,7)(9,17)(22,34)(27,36)(33,38,44)(35,41)                    
#> [2] (6,10)(22,34,32)(28,31)(33,39)                                
#> [3] (7,17)(14,19)(21,22,26)(23,42)(24,37)(30,43)(31,41)           
#> [4] (1,8)(2,10)(11,12)(13,16,14)(21,34,35)(24,26)(27,42)(28,45,31)
#> [5] (24,45)(27,34)                                                
#> [6] (3,4)(7,18,16)(28,36,45)(29,31)(30,34)(32,38)                 
#> [7] (1,19,17)(4,9,8)(21,44)(22,25,37)(26,43,30)(28,29)(34,42)     
#> [8] (1,13)(2,7)(21,37)(22,33)(23,36)(24,26,29)(25,41,35)          
#> [9] (3,12)(7,15)(10,17,18)(21,40)(22,35)(31,41)                   
```
