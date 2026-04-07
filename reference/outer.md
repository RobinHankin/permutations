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
#>   [1] (265)(374)    (4756)        (153)(2746)   (17)(36)      (1245)(36)   
#>   [6] (1243576)     (263574)      (1572)(364)   (167)(25)     (16542)(37)  
#>  [11] (1762453)     (172354)      (12)(376)     (23465)       (1342657)    
#>  [16] (1326745)     (1765)(243)   (127345)      (146)(35)     (143)(2756)  
#>  [21] (1462)(375)   (1472365)     (1275634)     (174523)      (13)(254)    
#>  [26] (13257)(46)   (1432)(57)    (1246573)     (36745)       (24376)      
#>  [31] (1734)(56)    (175263)      (15)(24)(37)  (14326)       (16)(23)(457)
#>  [36] (1672354)     (173546)      (154)(2763)   (125643)      (127)(3465)  
#>  [41] (25)(3467)    (36)          (173)(2456)   (14357)       (1235)(47)   
#>  [46] (1237546)     (254)(37)     (172)(3546)   (1527)(364)   (15342)(67)  
#>  [51] (17)(246)(35) (17236)(45)   (125637)      (15234)       (1342)(57)   
#>  [56] (132)(467)    (17)(243)     (127346)      (14)(365)     (1435)(276)  
#>  [61] (236)(475)    (246537)      (12643)(57)   (167)(245)    (1425)(67)   
#>  [66] (1473256)     (23)(567)     (12)(47)(56)  (137)(45)     (1362)       
#>  [71] (16)(374)     (1647)(25)    (274)(365)    (176325)      (156324)     
#>  [76] (157243)      (163)(457)    (2643)(57)    (12)(67)      (126)(37)(45)
#>  [81] (13)(4567)    (135264)      (1742)        (26573)       (1653247)    
#>  [86] (1637245)     (137465)      (17645)(23)   (127356)      (123)(4675)  
#>  [91] (12346)(57)   (127)(365)    (243)(567)    (145)(27)     (174)(25)    
#>  [96] (173)(2546)   (123)(475)    (465)         (1364572)     (13476)      
#> [coerced from word form]
```
