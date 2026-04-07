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
#>  [1] (27465)       (125)(34)(67) (17563)       (137)(2654)   (162574)     
#>  [6] (1465)(37)    (15436)(27)   (3467)        (1573)(24)    (12)(35746)  
#> [coerced from word form]
capply(x,range)
#>  [1] (27)         (15)(34)(67) (17)         (17)(26)     (17)        
#>  [6] (16)(37)     (16)(27)     (37)         (17)(24)     (12)(37)    

capply(x,function(x){x+100})
#>  [1] (102,107,104,106,105)           (101,102,105)(103,104)(106,107)
#>  [3] (101,107,105,106,103)           (101,103,107)(102,106,105,104) 
#>  [5] (101,106,102,105,107,104)       (101,104,106,105)(103,107)     
#>  [7] (101,105,104,103,106)(102,107)  (103,104,106,107)              
#>  [9] (101,105,107,103)(102,104)      (101,102)(103,105,107,104,106) 

capply(x,rev)
#>  [1] (25647)       (152)(34)(67) (13657)       (173)(2456)   (147526)     
#>  [6] (1564)(37)    (16345)(27)   (3764)        (1375)(24)    (12)(36475)  
all(is.id(capply(x,rev)*x))  # should be TRUE
#> [1] TRUE

capply(rcyc(20,5,9),sort)
#>  [1] (12678) (12369) (12458) (34578) (35689) (46789) (26789) (12368) (12359)
#> [10] (34679) (23469) (35689) (14579) (24589) (13789) (35678) (24589) (35679)
#> [19] (34689) (23679)

capply(rcyc(20,5,9),sample)  # still 5-cycles
#>  [1] (19764) (37694) (25674) (13785) (45876) (27698) (28365) (13245) (19326)
#> [10] (14672) (26597) (28569) (12798) (28356) (18764) (16483) (14297) (48759)
#> [19] (13246) (19537)


capply(cyc_len(1:9),\(x)x[x>4])
#> [1] ()      ()      ()      ()      ()      (56)    (567)   (5678)  (56789)

capply(cyc_len(1:9),\(x)x^2)
#> [1] ()                        (1,4)                    
#> [3] (1,4,9)                   (1,4,9,16)               
#> [5] (1,4,9,16,25)             (1,4,9,16,25,36)         
#> [7] (1,4,9,16,25,36,49)       (1,4,9,16,25,36,49,64)   
#> [9] (1,4,9,16,25,36,49,64,81)

```
