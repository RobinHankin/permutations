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
#>  [1] (245637)      (14)(276)(35) (146)(2735)   (1376)(254)   (2456)       
#>  [6] (124)(3765)   (345)         (274)         (13)(257)(46) (1346)(25)   
#> [coerced from word form]
as.cycle(rperm(30, 9))
#>  [1] (178394)(26)    (192756)(34)    (1796)(345)     (37)(69)       
#>  [5] (16)(2384957)   (15893)(247)    (1867)(2395)    (19)(2358)(67) 
#>  [9] (126589743)     (13)(2689)(475) (17825)(394)    (17453286)     
#> [13] (18624)(3957)   (1745269)(38)   (1649)(2873)    (1736954)      
#> [17] (19)(23867)     (172386)(45)    (14837)(2956)   (187269534)    
#> [21] (1285)(3697)    (162345)        (135628974)     (15974386)     
#> [25] (14587)(23)(69) (1765843)(29)   (187945263)     (165)(37)(489) 
#> [29] (145869273)     (14826)(3597)  
rperm(10, 9, 2)
#>  [1] (48) ()   ()   ()   (68) (34) ()   (34) ()   ()  
#> [coerced from word form]

rcyc(20, 5)
#>  [1] (12543) (14235) (14523) (12345) (12435) (15423) (12354) (12453) (12435)
#> [10] (13425) (14325) (14253) (14352) (14352) (13524) (12534) (15342) (15324)
#> [19] (13425) (14532)
rcyc(20, 5, 9)
#>  [1] (13472) (29546) (17856) (46758) (39865) (16243) (16253) (24386) (24856)
#> [10] (16874) (29874) (12847) (39785) (13284) (14285) (13697) (16538) (24839)
#> [19] (25864) (27389)

rgivenshape(10, c(2,3))     # size 5
#>  [1] (135)(24) (125)(34) (153)(24) (154)(23) (15)(243) (13)(254) (14)(253)
#>  [8] (12)(354) (132)(45) (143)(25)
rgivenshape(10, c(2,3,1,1)) # size 7
#>  [1] (13)(475) (364)(57) (364)(57) (12)(365) (176)(45) (137)(24) (167)(45)
#>  [8] (136)(45) (125)(67) (176)(35)

rgivenshape(1:9)
#> [1] (1,39,28)(2,43,30,42)(3,40,7,20,35,38,18)(4,11,6,34,9,25,37,45)(5,36,16,17,26,41,15,27,32)(8,12,22,24,21)(10,14)(13,44,29,33,31,23)

allpermslike(rgivenshape(c(1, 1, 3, 4)))
#>  [1] (246)(3785) (264)(3785) (246)(3758) (264)(3758) (246)(3857) (264)(3857)
#>  [7] (246)(3875) (264)(3875) (246)(3578) (264)(3578) (246)(3587) (264)(3587)
```
