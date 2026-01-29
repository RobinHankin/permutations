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
#>   [1] (13)(25)(47)  (1452736)     (2537)(46)    (1436)(25)    (12)(47)     
#>   [6] (1345)(67)    (142763)      (1365)(247)   (15)(27346)   (142)(56)    
#>  [11] (1527436)     (147523)      (164)(27)     (145273)      (126)(3574)  
#>  [16] (156347)      (1423657)     (1567243)     (1756234)     (1426735)    
#>  [21] (1735)(246)   (13265)       (157)(24)(36) (1324765)     (2546)(37)   
#>  [26] (172)         (1354)(267)   (17)(23)(46)  (1426)        (13764)(25)  
#>  [31] (172653)      (1246)(35)    (26)(3457)    (126)(35)(47) (1372)(56)   
#>  [36] (175)(23)(46) (1243)(567)   (1735)        (163245)      (12)(374)    
#>  [41] (1432657)     (235746)      (126)(45)     (26)(357)     (17)(34)(56) 
#>  [46] (1463)(275)   (23)(4756)    (14352)       (1674523)     (347)        
#>  [51] (163)(2475)   (15276)       (2437)(56)    (15246)       (12)(36)(475)
#>  [56] (16735)       (154273)      (164725)      (1435)(276)   (153642)     
#>  [61] (176)(25)     (163)(245)    (134)(257)    (163)(25)(47) (12376)      
#>  [66] (17)(3645)    (167)(24)     (172653)      (153624)      (165)(2374)  
#>  [71] (164)(25)(37) (13452)(67)   (172563)      (13467)(25)   (127364)     
#>  [76] (16)(457)     (13742)       (1657234)     (15762)       (1365427)    
#>  [81] (1753462)     (153264)      (142)(3657)   (1532)(476)   (1375)(246)  
#>  [86] (172354)      (15)(267)(34) (1732546)     (26354)       (1524376)    
#>  [91] (1352)(476)   (1652734)     (15372)       (1652)(34)    (125)(476)   
#>  [96] (13674)       (1635)(274)   (134726)      (2736)        (16)(254)    
#> [coerced from word form]
```
