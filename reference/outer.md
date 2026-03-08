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
#>   [1] (1654)(237)   (1672354)     (27564)       (135)(2647)   (1256)(47)   
#>   [6] (1235)        (132476)      (1357642)     (14)(2367)    (17462)      
#>  [11] (16)(247)(35) (1653)(247)   (17)(25634)   (1457263)     (12)(34567)  
#>  [16] (1243)(57)    (145)(23)(67) (142763)      (1365)(247)   (15)(27346)  
#>  [21] (2437)        (24367)       (1342765)     (1472)(365)   (1263475)    
#>  [26] (124536)      (147)(2563)   (1423657)     (1567243)     (1756234)    
#>  [31] (1234657)     (12357)(46)   (167524)      (13567)       (25)         
#>  [36] (2356)(47)    (13)(27)      (1354)(267)   (17)(23)(46)  (1426)       
#>  [41] (15736)       (1573)        (143267)      (1254673)     (132)(46)    
#>  [46] (13)(4765)    (1275)(46)    (1243)(567)   (1735)        (163245)     
#>  [51] (154362)      (15432)       (13)(2647)    (253)(46)     (17463)      
#>  [56] (176532)      (246375)      (23)(4756)    (14352)       (1674523)    
#>  [61] (1347256)     (13)(25647)   (17)(24)(35)  (15723)       (12)(35)(67) 
#>  [66] (1257463)     (15)(2673)    (154273)      (164725)      (1435)(276)  
#>  [71] (26357)       (2657)        (1425)(367)   (1672)(45)    (123645)     
#>  [76] (126)(475)    (1645327)     (167)(24)     (172653)      (153624)     
#>  [81] (14)(23567)   (14)(237)(56) (254)         (137245)      (1276)(45)   
#>  [86] (12375)(46)   (1326)(457)   (13742)       (1657234)     (15762)      
#>  [91] (12573)(46)   (1257346)     (1674352)     (156734)      (13524)      
#>  [96] (1347)(256)   (154)(27)     (15)(267)(34) (1732546)     (26354)      
#> [coerced from word form]
```
