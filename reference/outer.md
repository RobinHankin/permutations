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
#>   [1] (145376)      (136475)      (136)(2547)   (143265)      (12547)(36)  
#>   [6] (17542)(36)   (25)(367)     (13642)       (135)(46)     (164)(23)    
#>  [11] (17)(2463)    (153)(24)(67) (1574263)     (172)(345)    (1426573)    
#>  [16] (123)(576)    (13)(26)(475) (156723)      (1536724)     (2567)(34)   
#>  [21] (1623)(457)   (175234)      (1734)(256)   (165247)      (134)(2567)  
#>  [26] (34)(567)     (125346)      (17)(34)      (17)(235)     (1427)       
#>  [31] (143)(57)     (173564)      (172354)      (147)(2563)   (12354)(67)  
#>  [36] (267354)      (16)(235)     (17)(264)(35) (17)(456)     (15327)(46)  
#>  [41] (3547)        (1456)        (145)(27)     (23)(567)     (127645)     
#>  [46] (15)(264)     (165274)      (1426)(57)    (143756)      (13246)(57)  
#>  [51] (1254673)     (14)(2576)    (14)(2675)    (12357)       (15264)      
#>  [56] (27645)       (17426)       (145627)      (1436257)     (1356247)    
#>  [61] (24)(3657)    (17246)       (17465)       (23476)       (14675)      
#>  [66] (16725)       (154)         (176)(25)     (176)(243)    (1345276)    
#>  [71] (1645)(27)    (27543)       (25643)       (1654)(37)    (1743256)    
#>  [76] (1324756)     (1463257)     (2473)        (27354)       (12)(37)     
#>  [81] (1276534)     (13627)       (13652)       (126)(374)    (1752)(36)   
#>  [86] (147)(25)(36) (1573642)     (13625)(47)   (13)(2746)    (1623745)    
#>  [91] (157)(2346)   (176523)      (173)(26)     (152)(47)     (13)(267)    
#>  [96] (143)(67)     (126453)      (1743)(56)    (174)(2365)   (274)(56)    
#> [coerced from word form]
```
