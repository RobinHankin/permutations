# Random permutations

Function `rperm()` creates a word object of random permutations.
Function `rcyc()` creates random permutations comprising a single
(group-theoretic) cycle of a specified length. Functions `r1cyc()` and
`rgs1()` are low-level helper functions.

## Usage

``` r
rperm(n=10, r=7, moved=NA)
rpermm(n=20, r=20, moved=NA)
rcyc(n, len, r=len)
r1cyc(len, vec)
rgs1(s)
rgivenshape(n, s, size=sum(s))
```

## Arguments

- n:

  Number of permutations to create

- r:

  Size of permutations

- len:

  Length of cycles in `rcyc()` and `r1cyc()`

- moved:

  In function `rperm()` and `rpermm()`, integer specifying how many
  elements can move (that is, how many elements do not map to
  themselves), with default `NA` meaning to choose a permutation at
  random. This is useful if you want a permutation that has a compact
  cycle representation

- vec:

  Vector of integers to generate a cycle from

- s, size:

  Shape and size of permutations to create

## Details

Function `rperm()` returns a simple vector of random permutations, and
`rperm()` gives a more complicated object.

Function `rgivenshape()` returns a random permutation with a given
shape. Argument `s`, specifying the shape, can include 1s (ones).
Although length-one cycles are dropped from the resulting permutation,
it is sometimes useful to include them to increase the size of the
result, see examples. If primary argument `n` is a vector of length
greater than 1, it is interpreted as the shape of the permutation, and a
single random permutation is returned. Setting print option
`print_in_length_order` to `TRUE` emphasises that every element of the
output of `rgivenshape()` has the same shape.

## Value

Returns a permutation object of class `cycle`, or class `word`
(`rperm()`)

## Author

Robin K. S. Hankin

## Note

In function `rperm()`, argument `moved` specifies a *maximum* number of
elements that do not map to themselves; the actual number of non-fixed
elements might be lower (as some elements might map to themselves). To
control the number of non-fixed elements precisely, use function
`rcyc()` or `rgivenshape()`.

## See also

[`size`](size.md), [`print.permutation`](print.md)

## Examples

``` r
rperm()
#>  [1] (13)(25)(67) (1243675)    (123467)     (13245)      (176)(34)   
#>  [6] (13)(4567)   (23674)      (137564)     (167453)     (15346)(27) 
#> [coerced from word form]
as.cycle(rperm(30, 9))
#>  [1] (2693754)       (1732)(5689)    (17845)(2693)   (178364)(59)   
#>  [5] (1257)(3946)    (154367)(298)   (18576329)      (1269784)(35)  
#>  [9] (134276)(59)    (1395846)       (13)(29)(58)    (146582)(79)   
#> [13] (1768)(23549)   (14)(2857)(36)  (19684725)      (1763)(295)(48)
#> [17] (1476)(359)     (1734596)(28)   (196872534)     (246)(375)(89) 
#> [21] (179)(2546)     (162945387)     (25378)(49)     (1893)(254)(67)
#> [25] (1894365)(27)   (23958)(467)    (142)(39857)    (12736)(48)    
#> [29] (15968472)      (164795238)    
rperm(10, 9, 2)
#>  [1] ()   ()   (17) ()   (13) (16) ()   ()   (69) ()  
#> [coerced from word form]

rcyc(20, 5)
#>  [1] (12534) (14523) (13245) (15324) (12345) (13524) (13425) (12534) (15423)
#> [10] (13254) (12453) (14523) (12345) (12354) (12534) (15324) (13524) (13254)
#> [19] (14253) (12543)
rcyc(20, 5, 9)
#>  [1] (38476) (28936) (12487) (29376) (38764) (17583) (18326) (16472) (18634)
#> [10] (16943) (13792) (35698) (12873) (12648) (24683) (27538) (18279) (13847)
#> [19] (25763) (26795)

rgivenshape(10, c(2,3))     # shape (3,2), size 5
#>  [1] (132)(45) (15)(243) (14)(253) (152)(34) (145)(23) (135)(24) (152)(34)
#>  [8] (142)(35) (15)(234) (14)(253)
rgivenshape(10, c(2,3,1,1)) # shape (3,2), but size 7
#>  [1] (15)(467) (126)(45) (154)(67) (267)(35) (15)(376) (256)(37) (257)(46)
#>  [8] (143)(25) (157)(36) (24)(365)

rgivenshape(1:9)
#> [1] (1,38,21,4,44,24,2,12)(3,30,25,31,15,13,16)(5,23,27,7)(6,42,11,36,34,33)(8,41)(10,39,29)(14,43,37,26,32)(17,18,22,20,45,19,35,28,40)

allpermslike(rgivenshape(c(1, 1, 3, 4)))
#>  [1] (1289)(365) (1298)(365) (1892)(365) (1829)(365) (1928)(365) (1982)(365)
#>  [7] (1289)(356) (1298)(356) (1892)(356) (1829)(356) (1928)(356) (1982)(356)
```
