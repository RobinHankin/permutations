# Sign of a permutation

Returns the sign of a permutation

## Usage

``` r
sgn(x)
is.even(x)
is.odd(x)
```

## Arguments

- x:

  permutation object

## Details

The sign of a permutation is \\\pm 1\\ depending on whether it is even
or odd. A permutation is even if it can be written as a product of an
even number of transpositions, and odd if it can be written as an odd
number of transpositions. The map \\\operatorname{sgn}\colon
S_n\longrightarrow\left\lbrace +1,-1\right\rbrace\\ is a homomorphism;
see examples.

## Author

Robin K. S. Hankin

## Note

Internally, function `sgn()` coerces to cycle form.

The sign of the null permutation is `NULL`.

## See also

[`shape`](shape.md)

## Examples

``` r
sgn(id)  # always problematic
#> [1] 1

sgn(rperm(10,5))
#>  [1] -1 -1 -1  1 -1  1  1 -1  1 -1

x <- rperm(40,6)
y <- rperm(40,6)


stopifnot(all(sgn(x*y) == sgn(x)*sgn(y)))   # sgn() is a homomorphism


z <- as.cycle(rperm(20,9,5))
z[is.even(z)]
#>  [1] (23489)  (15942)  (154)    (17368)  (15476)  (498)    (19)(34) (485)   
#>  [9] (248)    (35687)  (13264)  (13469) 
z[is.odd(z)]
#> [1] (3849)    (1923)    (1352)    (37)(568) (127)(46) (1678)    (1392)   
#> [8] (15)(347)
```
