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
#>  [1] (1425)(37)    (176)(254)    (2456)        (124)(3765)   (345)        
#>  [6] (274)         (13)(257)(46) (1346)(25)    (126473)      (1542)(37)   
#> [coerced from word form]
as.cycle(rperm(30, 9))
#>  [1] (1479285)       (1796)(345)     (37)(69)        (16)(2384957)  
#>  [5] (15893)(247)    (1867)(2395)    (19)(2358)(67)  (126589743)    
#>  [9] (13)(2689)(475) (17825)(394)    (17453286)      (18624)(3957)  
#> [13] (1745269)(38)   (1649)(2873)    (1736954)       (19)(23867)    
#> [17] (172386)(45)    (14837)(2956)   (187269534)     (1285)(3697)   
#> [21] (162345)        (135628974)     (15974386)      (14587)(23)(69)
#> [25] (1765843)(29)   (187945263)     (165)(37)(489)  (145869273)    
#> [29] (14826)(3597)   (1863957)(24)  
rperm(10, 9, 2)
#>  [1] ()   (68) (34) ()   (34) ()   ()   ()   (69) (48)
#> [coerced from word form]

rcyc(20, 5)
#>  [1] (13524) (13452) (12453) (13452) (12453) (14532) (14253) (14523) (14523)
#> [10] (15432) (15432) (14235) (14352) (13524) (12534) (15342) (15324) (13425)
#> [19] (14532) (12543)
rcyc(20, 5, 9)
#>  [1] (29546) (17856) (46758) (39865) (16243) (16253) (24386) (24856) (16874)
#> [10] (29874) (12847) (39785) (13284) (14285) (13697) (16538) (24839) (25864)
#> [19] (27389) (23948)

rgivenshape(10, c(2,3))     # size 5
#>  [1] (152)(34) (124)(35) (12)(354) (14)(253) (134)(25) (153)(24) (145)(23)
#>  [8] (12)(354) (12)(354) (125)(34)
rgivenshape(10, c(2,3,1,1)) # size 7
#>  [1] (146)(27) (173)(56) (132)(57) (14)(267) (124)(56) (374)(56) (15)(247)
#>  [8] (156)(34) (16)(345) (276)(45)

rgivenshape(1:9)
#> [1] (1,37)(2,15,12,17,22,34,43)(3,13,36,40,42,16,26,5,14)(4,32,31,7,18)(6,10,8,23,44,20,9,35)(11,21,19,41,24,30)(25,38,45,27)(28,39,29)

allpermslike(rgivenshape(c(1, 1, 3, 4)))
#>  [1] (2573)(486) (2537)(486) (2735)(486) (2753)(486) (2357)(486) (2375)(486)
#>  [7] (2573)(468) (2537)(468) (2735)(468) (2753)(468) (2357)(468) (2375)(468)
```
