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
#>  [1] -1 -1  1 -1  1  1 -1  1  1 -1

x <- rperm(40,6)
y <- rperm(40,6)


stopifnot(all(sgn(x*y) == sgn(x)*sgn(y)))   # sgn() is a homomorphism


z <- as.cycle(rperm(20,9,5))
z[is.even(z)]
#> [1] (16753)  (38764)  (59768)  (16875)  (28)(67) (679)    (28476) 
z[is.odd(z)]
#>  [1] (2389)    (1846)    (379)(45) (164)(35) (58)      (28)(367) (146)(37)
#>  [8] (3897)    (18)      (29)      (1687)    (45)      (367)(58)
```
