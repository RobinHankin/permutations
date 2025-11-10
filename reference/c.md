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

  In the methods for `c()`, objects to be concatenated. Must all be of
  the same type: either all `word`, or all `cycle`

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
y <- cycle(list(list(1:4,8:9),list(1:2)))


# concatenate cycles:
c(x,y)
#> [1] (12345)    (1234)(89) (12)      

# concatenate words:
c(rperm(5,3),rperm(6,9))   # size adjusted to maximum size of args
#>  [1] (23)            (23)            (12)            ()             
#>  [5] ()              (159)(34867)    (12349)(5678)   (18593)(24)(67)
#>  [9] (156298)(347)   (184927)(365)   (12467385)     
#> [coerced from word form]


# repeat words:
rep(x, times=3)
#> [1] (12345) (12345) (12345)


```
