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
#>  [1] (31,34) (3,30)  (23,26) (20,25) (6,27)  (15,23) (9,31)  (19,34) (1,11) 
#> [10] (8,15) 
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
#>   [1] ()           ()           ()           ()           ()          
#>   [6] (576)        (12)         ()           (46)         ()          
#>  [11] ()           (12)(567)    ()           ()           ()          
#>  [16] (23)         ()           (12)(57)     ()           ()          
#>  [21] ()           ()           (67)         ()           (13)(45)    
#>  [26] ()           (46)         (23)(57)     (132)        ()          
#>  [31] (24)         (23)         ()           (56)         ()          
#>  [36] (13)         ()           (56)         ()           (34)        
#>  [41] ()           ()           ()           (56)         (24)(57)    
#>  [46] (243)        ()           (46)         ()           ()          
#>  [51] ()           ()           (45)         ()           (23)(57)    
#>  [56] (12)         ()           ()           ()           ()          
#>  [61] ()           ()           ()           ()           ()          
#>  [66] (12)(34)(67) ()           ()           ()           ()          
#>  [71] (67)         ()           (56)         ()           ()          
#>  [76] ()           (243)        (34)(57)     (12)         ()          
#>  [81] (13)         (123)        ()           ()           (67)        
#>  [86] ()           ()           ()           ()           (35)        
#>  [91] (23)         ()           ()           (12)         ()          
#>  [96] ()           (34)(67)     ()           ()           (13)        

f <- function(x, p){all(x < p) || all(x > p)}             # keep only cycles with all entries either
keepcyc(rgivenshape(9,rep(2:3,9)), f, p=20)               #  all < 20 or all >20
#> [1] (1,19,11)(2,10,8)(5,17)(23,33)(24,27,26)(28,29)(32,36,41)(38,43)
#> [2] (2,7)(13,16)(29,42)(33,40,37)(39,45,41)                         
#> [3] (1,10,7)(4,12,17)(15,19,18)(24,33)(25,36)(26,34)(32,38)(40,44)  
#> [4] (3,15)(5,19,18)(23,42)(25,36)(30,38,35)(34,44,40)               
#> [5] (1,6)(22,30)(23,44,35)(25,34,37)(28,39)(40,43)                  
#> [6] (6,15)(14,16)(23,40,27)(25,35,31)(29,41,45)(34,43)              
#> [7] (6,12,17)(23,45)(26,39,35)(27,33)(30,44,40)                     
#> [8] (1,12,17)(4,11)(10,18)(22,28,37)(24,44,33)(29,45)(30,39,34)     
#> [9] (3,14)(5,16,11)(7,8,17)(21,24,44)(22,45)(25,34)(35,43)          
```
