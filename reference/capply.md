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
#>  [1] (165374)    (1256347)   (1467)(35)  (12)(57)    (254)(367)  (172456)   
#>  [7] (17436)     (1472)(365) (126)(3547) (17)(465)  
#> [coerced from word form]
capply(x,range)
#>  [1] (17)     (17)     (17)(35) (12)(57) (25)(37) (17)     (17)     (17)(36)
#>  [9] (16)(37) (17)(46)

capply(x,function(x){x+100})
#>  [1] (101,106,105,103,107,104)      (101,102,105,106,103,104,107) 
#>  [3] (101,104,106,107)(103,105)     (101,102)(105,107)            
#>  [5] (102,105,104)(103,106,107)     (101,107,102,104,105,106)     
#>  [7] (101,107,104,103,106)          (101,104,107,102)(103,106,105)
#>  [9] (101,102,106)(103,105,104,107) (101,107)(104,106,105)        

capply(x,rev)
#>  [1] (147356)    (1743652)   (1764)(35)  (12)(57)    (245)(376)  (165427)   
#>  [7] (16347)     (1274)(356) (162)(3745) (17)(456)  
all(is.id(capply(x,rev)*x))  # should be TRUE
#> [1] TRUE

capply(rcyc(20,5,9),sort)
#>  [1] (13469) (12679) (45789) (35789) (12389) (12578) (23679) (12347) (35789)
#> [10] (14589) (13569) (15679) (12457) (15789) (34589) (34678) (26789) (12368)
#> [19] (12359) (34679)

capply(rcyc(20,5,9),sample)  # still 5-cycles
#>  [1] (24396) (38965) (17459) (29584) (17938) (36857) (28495) (39657) (36948)
#> [10] (27693) (19647) (39764) (24657) (15837) (47658) (29678) (23856) (14532)
#> [19] (19236) (12674)


capply(cyc_len(1:9),\(x)x[x>4])
#> [1] ()      ()      ()      ()      ()      (56)    (567)   (5678)  (56789)

capply(cyc_len(1:9),\(x)x^2)
#> [1] ()                        (1,4)                    
#> [3] (1,4,9)                   (1,4,9,16)               
#> [5] (1,4,9,16,25)             (1,4,9,16,25,36)         
#> [7] (1,4,9,16,25,36,49)       (1,4,9,16,25,36,49,64)   
#> [9] (1,4,9,16,25,36,49,64,81)

```
