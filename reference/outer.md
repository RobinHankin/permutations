# Outer product of vectors of permutations

The outer product of two vectors of permutations is the pairwise product
of each element of the first with each element of the second.

## Details

It works in much the same way as
[`base::outer()`](https://rdrr.io/r/base/outer.html). The third
argument, `FUN`, as in `outer(X,Y,FUN="*")` is regular group-theoretic
multiplication but can be replaced with `+` if you are sure that the
cycles of `X` and `Y` are distinct, see the examples. Each element of
the returned matrix is a one-element list.

The print method may have room for improvement.

## Author

Robin K. S. Hankin

## Examples

``` r
(M <- outer(rperm(),rperm()))
#>       [,1]          [,2]          [,3]          [,4]          [,5]         
#>  [1,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [2,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [3,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [4,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [5,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [6,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [7,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [8,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [9,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#> [10,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>       [,6]          [,7]          [,8]          [,9]          [,10]        
#>  [1,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [2,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [3,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [4,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [5,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [6,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [7,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [8,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#>  [9,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
#> [10,] permutation,7 permutation,7 permutation,7 permutation,7 permutation,7
outer(cyc_len(4) + 0:3, cyc_len(4) + 100:101,"+")  # OK because the cycles are distinct
#>      [,1]                           [,2]                          
#> [1,] 1, 2, 3, 4, 101, 102, 103, 104 1, 2, 3, 4, 102, 103, 104, 105
#> [2,] 2, 3, 4, 5, 101, 102, 103, 104 2, 3, 4, 5, 102, 103, 104, 105
#> [3,] 3, 4, 5, 6, 101, 102, 103, 104 3, 4, 5, 6, 102, 103, 104, 105
#> [4,] 4, 5, 6, 7, 101, 102, 103, 104 4, 5, 6, 7, 102, 103, 104, 105

do.call("c",M) # c(M) gives a list and unlist(a) gives a numeric vector
#>   [1] (162543)      (15)(246)(37) (164)(237)    (2754)        (1364)(27)   
#>   [6] (152643)      (1273645)     (34)(576)     (14)(35)(67)  (253476)     
#>  [11] (142)(67)     (25367)       (14365)       (132647)      (1265)(34)   
#>  [16] (24)(576)     (1726534)     (1356)(274)   (152743)      (1352)(467)  
#>  [21] (235674)      (134)(267)    (345)         (156)(2473)   (12453)      
#>  [26] (135742)      (17243)       (15427)(36)   (164527)      (152367)     
#>  [31] (15)(37)      (12)(457)     (152476)      (1723465)     (1476)(235)  
#>  [36] (1256)(37)    (16)(23574)   (1753)(26)    (263)(475)    (17543)      
#>  [41] (174562)      (26)(3475)    (1725)(34)    (13567)(24)   (15)(2437)   
#>  [46] (2745)        (124)(375)    (136)(45)     (1643)        (1362)       
#>  [51] (1765)        (12)(365)(47) (1752436)     (1345)(267)   (1437526)    
#>  [56] (1276)        (1537426)     (13)(256)     (2543)        (13)(465)    
#>  [61] (25637)       (1574)(263)   (2473)        (1756)(34)    (1473)       
#>  [66] (15372)       (13)(457)     (17)(2365)    (1623547)     (17)(254)(36)
#>  [71] (2547)(36)    (156324)      (273)(46)     (16)(3754)    (173)(46)    
#>  [76] (1536472)     (13)(456)     (1652347)     (1462357)     (1634257)    
#>  [81] (13452)(67)   (36754)       (13625)       (147)(2635)   (15)(26)     
#>  [86] (234576)      (1754)(26)    (1456)(273)   (1273)        (146732)     
#>  [91] (23)(4675)    (13524)(67)   (264)(35)     (1254736)     (164253)     
#>  [96] (132)(46)(57) (17643)(25)   (127)(346)    (1427)(56)    (1234567)    
#> [coerced from word form]
```
