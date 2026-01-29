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
#>  [1] (8,19)  (5,19)  (19,22) (32,34) (9,12)  (11,35) (24,28) (14,18) (3,22) 
#> [10] (30,33)
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
#>   [1] (123)         ()            ()            ()            (123)        
#>   [6] ()            ()            ()            ()            ()           
#>  [11] ()            ()            ()            ()            ()           
#>  [16] (57)          ()            ()            ()            ()           
#>  [21] (57)          ()            (46)          ()            ()           
#>  [26] (13)          ()            ()            (56)          ()           
#>  [31] (35)          (35)          ()            ()            ()           
#>  [36] ()            (35)          (34)          (123)(46)(57) (67)         
#>  [41] ()            ()            (46)          ()            ()           
#>  [46] (45)          ()            ()            ()            ()           
#>  [51] ()            ()            ()            ()            (56)         
#>  [56] (12)(34)(567) ()            ()            ()            (24)         
#>  [61] ()            ()            ()            (35)          ()           
#>  [66] (13)          (57)          (24)(57)      (34)          (24)         
#>  [71] (23)          ()            ()            ()            ()           
#>  [76] ()            ()            ()            ()            ()           
#>  [81] ()            ()            ()            (456)         ()           
#>  [86] ()            (56)          ()            ()            ()           
#>  [91] ()            ()            ()            ()            ()           
#>  [96] ()            (34)          (13)(24)(576) ()            ()           

f <- function(x,p){all(x<p) || all(x>p)}                  # keep only cycles with all entries either
keepcyc(rgivenshape(9,rep(2:3,9)),f,p=20)                 #  all < 20 or all >20
#> [1] (7,19)(14,17)(21,29,42)(22,34)(25,33)(26,38,36)(35,45)(37,39,44)
#> [2] (6,16)(9,15,19)(21,41,40)(24,35)(26,42,36)(27,29)(30,34)        
#> [3] (15,17,18)(24,31)(25,30,41)(26,44)(32,35)(36,45)                
#> [4] (2,16)(26,42)(39,41)                                            
#> [5] (3,15)(17,18)(29,39)(31,36,35)(38,44)(40,41)                    
#> [6] (3,6,5)(4,8)(16,18)(23,33)(24,43,42)(27,32,36)(34,35)(38,45)    
#> [7] (1,5)(12,13)(21,28)(23,45)(26,27)(35,44,36)                     
#> [8] (3,19)(7,13,12)(22,40)(26,43)(27,44,35)(28,45,39)               
#> [9] (9,14)(35,42)(36,38)                                            
```
