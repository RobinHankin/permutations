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
#>  [1] (1324756)   (15)(2743)  (15264)(37) (132)(46)   (24)(567)   (163257)   
#>  [7] (267345)    (1352)      (146)(23)   (253)(476) 
#> [coerced from word form]
as.cycle(rperm(30, 9))
#>  [1] (2895763)       (189)(3754)     (136)(24)(58)   (1268795)(34)  
#>  [5] (15)(2463)(78)  (23)(46958)     (1698473)       (2693754)      
#>  [9] (1732)(5689)    (17845)(2693)   (178364)(59)    (1257)(3946)   
#> [13] (154367)(298)   (18576329)      (1269784)(35)   (134276)(59)   
#> [17] (1395846)       (13)(29)(58)    (146582)(79)    (1768)(23549)  
#> [21] (14)(2857)(36)  (19684725)      (1763)(295)(48) (1476)(359)    
#> [25] (1734596)(28)   (196872534)     (246)(375)(89)  (179)(2546)    
#> [29] (162945387)     (25378)(49)    
rperm(10, 9, 2)
#>  [1] ()   (45) ()   ()   ()   ()   (56) (18) (89) ()  
#> [coerced from word form]

rcyc(20, 5)
#>  [1] (15234) (14253) (13245) (13452) (15423) (13425) (15342) (15324) (15423)
#> [10] (15243) (12345) (15324) (14532) (14253) (14325) (12534) (15423) (13254)
#> [19] (12453) (14523)
rcyc(20, 5, 9)
#>  [1] (28937) (16378) (15847) (18342) (19857) (35984) (17456) (13654) (28936)
#> [10] (12487) (29376) (38764) (17583) (18326) (16472) (18634) (16943) (13792)
#> [19] (35698) (12873)

rgivenshape(10, c(2,3))     # shape (3,2), size 5
#>  [1] (14)(253) (145)(23) (145)(23) (12)(345) (13)(245) (153)(24) (134)(25)
#>  [8] (15)(234) (145)(23) (154)(23)
rgivenshape(10, c(2,3,1,1)) # shape (3,2), but size 7
#>  [1] (132)(45) (135)(67) (163)(24) (143)(26) (35)(476) (34)(567) (164)(27)
#>  [8] (263)(47) (14)(276) (267)(35)

rgivenshape(1:9)
#> [1] (1,33,40,18,4,3,35,22,9)(2,10,26,38,19,43,20,36)(5,25)(6,29,45,32,42,30,12)(7,28,34,16,31,15)(8,17,11,13,27)(14,23,37)(21,41,44,39)

allpermslike(rgivenshape(c(1, 1, 3, 4)))
#>  [1] (143)(2876) (134)(2876) (143)(2867) (134)(2867) (143)(2768) (134)(2768)
#>  [7] (143)(2786) (134)(2786) (143)(2687) (134)(2687) (143)(2678) (134)(2678)
```
