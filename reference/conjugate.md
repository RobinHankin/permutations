# Are two permutations conjugate?

Returns `TRUE` if two permutations are conjugate and `FALSE` otherwise.

## Usage

``` r
are_conjugate(x, y)
are_conjugate_single(a,b)
```

## Arguments

- x,y,a,b:

  Objects of class permutation, coerced to cycle form

## Details

Two permutations are conjugate if and only if they have the same shape.
Function
[`are_conjugate()`](https://robinhankin.github.io/permutations/reference/conjugate.html)
is vectorized and user-friendly; function `are_conjugate_single()` is
lower-level and operates only on length-one permutations.

The reason that `are_conjugate_single()` is a separate function and not
bundled inside
[`are_conjugate()`](https://robinhankin.github.io/permutations/reference/conjugate.html)
is that dealing with the identity permutation is a pain in the arse.

## Value

Returns a vector of Booleans

## Author

Robin K. S. Hankin

## Note

The functionality detects conjugateness by comparing the shapes of two
permutations; permutations are coerced to cycle form because function
[`shape()`](shape.md) does.

The group action of conjugation, that is \\x^y\\ or `y^-1 x y`, is
documented at [conjugation](Ops.permutation.md).

     all(are_conjugate(x,x^y)) 

is always `TRUE`.

## See also

[`conjugation`](Ops.permutation.md),[`shape`](shape.md)

## Examples

``` r
as.cycle("(123)(45)") %~% as.cycle("(89)(712)")  # same shape
#> [1] TRUE
as.cycle("(123)(45)") %~% as.cycle("(89)(7124)") # different shape
#> [1] FALSE

are_conjugate(rperm(20,3),rperm(20,3))
#>  [1] FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
#> [13] FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE

rperm(20,3) %~% as.cycle(1:3)
#>  [1]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [13] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE

z <- rperm(300,4)
stopifnot(all(are_conjugate(z,id)==is.id(z)))

z <- rperm(20)
stopifnot(all(z %~% capply(z,sample)))

data(megaminx)
stopifnot(all(are_conjugate(megaminx,megaminx^as.cycle(sample(129)))))
```
