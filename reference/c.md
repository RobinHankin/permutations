# Concatenation of permutations

Concatenate words or cycles together

## Usage

``` r
# S3 method for class 'word'
c(...)
# S3 method for class 'cycle'
c(...)
# S3 method for class 'permutation'
rep(x, ...)
```

## Arguments

- ...:

  In the methods for `c()`, objects to be concatenated, which all must
  be of the same type: either all `word`, or all `cycle`

- x:

  In the method for [`rep()`](https://rdrr.io/r/base/rep.html), a
  permutation object

## Author

Robin K. S. Hankin

## Note

The methods for `c()` do not attempt to detect which type (word or
cycle) you want as conversion is expensive.

Function `rep.permutation()` behaves like
[`base::rep()`](https://rdrr.io/r/base/rep.html) and takes the same
arguments, eg `times` and `each`.

## See also

[`size`](size.md)

## Examples

``` r
x <- as.cycle(1:5)
y <- cycle(list(list(1:4,8:9), list(1:2)))


# concatenate cycles:
c(x,y)
#> [1] (12345)    (1234)(89) (12)      

# concatenate words:
c(rperm(5,3),rperm(6,9))   # size adjusted to maximum size of args
#>  [1] (13)         (23)         (23)         ()           (23)        
#>  [6] (148935267)  (14395)(278) (174629538)  (146275398)  (168975)(34)
#> [11] (2384)(596) 
#> [coerced from word form]


# repeat words:
rep(x, times=3)
#> [1] (12345) (12345) (12345)

# c(id, rperm())  # fails: elements are of different types, one cycle, one word.
c(as.word(id), rperm())   # works: coerce id [which is a cycle] to word form
#>  [1] ()         (142)(576) (1247)(36) (2345)(67) (124753)   (173256)  
#>  [7] (15637)    (1576324)  (12)(57)   (254)(367) (172456)  
#> [coerced from word form]
c(id, as.cycle(rperm()))  # works: coerce rperm() [which is a word] to cycle form
#>  [1] ()          (17436)     (1472)(365) (126)(3547) (17)(465)   (1456327)  
#>  [7] (1367452)   (254736)    (12643)(57) (1437256)   (1725)(364)
```
