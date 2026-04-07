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
#>  [1] (4,26)  (14,15) (17,23) (12,34) (1,3)   (20,28) (4,16)  (2,27)  (1,16) 
#> [10] (9,25) 
keepcyc(megaminx,function(x){any(x == 100)})              # retains just cycles modifying facet #100
#>  [1] ()                    ()                    ()                   
#>  [4] ()                    ()                    ()                   
#>  [7] ()                    ()                    ()                   
#> [10] (100,102,104,106,108) ()                    (74,86,98,100,112)   
keepcyc(rperm(100),function(x){max(x)-min(x) < 3})        # retains just cycles with range<3
#>   [1] ()           ()           ()           ()           ()          
#>   [6] ()           ()           ()           ()           ()          
#>  [11] ()           ()           ()           ()           (576)       
#>  [16] ()           (67)         ()           (13)(45)     ()          
#>  [21] (46)         (23)(57)     (132)        ()           (24)        
#>  [26] (23)         ()           (56)         ()           (13)        
#>  [31] ()           (56)         ()           (34)         ()          
#>  [36] ()           ()           (56)         (24)(57)     (243)       
#>  [41] ()           (46)         ()           ()           ()          
#>  [46] ()           (45)         ()           (23)(57)     (12)        
#>  [51] ()           ()           ()           ()           ()          
#>  [56] ()           ()           ()           ()           (12)(34)(67)
#>  [61] ()           ()           ()           ()           (67)        
#>  [66] ()           (56)         ()           ()           ()          
#>  [71] (243)        (34)(57)     (12)         ()           (13)        
#>  [76] (123)        ()           ()           (67)         ()          
#>  [81] ()           ()           ()           (35)         (23)        
#>  [86] ()           ()           (12)         ()           ()          
#>  [91] (34)(67)     ()           ()           (13)         ()          
#>  [96] ()           ()           ()           (24)         ()          

f <- function(x, p){all(x < p) || all(x > p)}             # keep only cycles with all entries either
keepcyc(rgivenshape(9,rep(2:3,9)), f, p=20)               #  all < 20 or all >20
#> [1] (2,3)(7,18)(30,38)(34,36,37)(41,44)                                      
#> [2] (3,17)(4,11)(7,12)(8,9)(21,25,43)(22,33,39)(23,41)(24,45,37)(28,38,34)   
#> [3] (3,7,11)(10,15)(21,28,36)(23,30,24)(35,37)                               
#> [4] (7,15)(14,18,16)(23,37)(28,32)(29,35,41)(36,42)                          
#> [5] (4,19)(5,18,8)(10,15)(21,38,42)(22,33)(25,43)(29,34)(32,41)              
#> [6] (1,15)(16,18)(24,32,36)(28,43)(29,44)(34,45,41)                          
#> [7] (4,6,7)(9,17,14)(22,40,33)(24,37,44)(25,45)(28,42,43)(30,31)(36,41)      
#> [8] (11,14)(32,33)                                                           
#> [9] (1,8)(5,13)(7,14,9)(15,16,17)(21,41,36)(22,35)(25,26,43)(27,32,39)(33,37)
```
