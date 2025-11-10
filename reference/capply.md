# Apply functions to elements of a cycle

Function `capply()` means “cycle apply” and is modelled on
[`lapply()`](https://rdrr.io/r/base/lapply.html). It applies a function
to every element in the cycles of its argument.

## Usage

``` r
capply(X, fun, ...)
```

## Arguments

- X:

  Permutation, coerced to cycle

- fun:

  Function to be applied to each element of `X`

- ...:

  Further arguments to `fun()`

## Details

This function is just a convenience wrapper really.

## Value

Returns a permutation in cycle form

## Author

Robin K. S. Hankin

## Note

Function [`allcyc()`](allperms.md) is a nice application of `capply()`.

## See also

[`allcyc`](allperms.md)

## Examples

``` r

(x <- rperm())
#>  [1] (1325)(67)    (1657234)     (1753264)     (1763254)     (137)(25)(46)
#>  [6] (1536274)     (375)         (14)(257)     (24756)       (1647325)    
#> [coerced from word form]
capply(x,range)
#>  [1] (15)(67)     (17)         (17)         (17)         (17)(25)(46)
#>  [6] (17)         (37)         (14)(27)     (27)         (17)        

capply(x,function(x){x+100})
#>  [1] (101,103,102,105)(106,107)      (101,106,105,107,102,103,104)  
#>  [3] (101,107,105,103,102,106,104)   (101,107,106,103,102,105,104)  
#>  [5] (101,103,107)(102,105)(104,106) (101,105,103,106,102,107,104)  
#>  [7] (103,107,105)                   (101,104)(102,105,107)         
#>  [9] (102,104,107,105,106)           (101,106,104,107,103,102,105)  

capply(x,rev)
#>  [1] (1523)(67)    (1432756)     (1462357)     (1452367)     (173)(25)(46)
#>  [6] (1472635)     (357)         (14)(275)     (26574)       (1523746)    
all(is.id(capply(x,rev)*x))  # should be TRUE
#> [1] TRUE

capply(rcyc(20,5,9),sort)
#>  [1] (13479) (12468) (12346) (12389) (12367) (12346) (12456) (23579) (23459)
#> [10] (12678) (13467) (13468) (35679) (24689) (13678) (12369) (35789) (12389)
#> [19] (12578) (23679)

capply(rcyc(20,5,9),sample)  # still 5-cycles
#>  [1] (17234) (38957) (18459) (15936) (16579) (15724) (17895) (39854) (36784)
#> [10] (26897) (13862) (13259) (39746) (23946) (39586) (19745) (28594) (17938)
#> [19] (35678) (25894)


capply(cyc_len(1:9),\(x)x[x>4])
#> [1] ()      ()      ()      ()      ()      (56)    (567)   (5678)  (56789)

capply(cyc_len(1:9),\(x)x^2)
#> [1] ()                        (1,4)                    
#> [3] (1,4,9)                   (1,4,9,16)               
#> [5] (1,4,9,16,25)             (1,4,9,16,25,36)         
#> [7] (1,4,9,16,25,36,49)       (1,4,9,16,25,36,49,64)   
#> [9] (1,4,9,16,25,36,49,64,81)

```
