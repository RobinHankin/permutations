# Random permutations

Function `rperm()` creates a word object of random permutations.
Function `rcyc()` creates random permutations comprising a single
(group-theoretic) cycle of a specified length. Functions `r1cyc()` and
`rgs1()` are low-level helper functions.

## Usage

``` r
rperm(n=10, r=7, moved=NA)
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

  In function `rperm()`, integer specifying how many elements can move
  (that is, how many elements do not map to themselves), with default
  `NA` meaning to choose a permutation at random. This is useful if you
  want a permutation that has a compact cycle representation

- vec:

  Vector of integers to generate a cycle from

- s, size:

  Shape and size of permutations to create

## Details

Function `rperm()` returns a vector of random permutations.

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
#>  [1] (13)(26)    (1457)(236) (1256)      (1573246)   (13425)(67) (124)(67)  
#>  [7] (16)(2475)  (13746)(25) (176352)    (12763)(45)
#> [coerced from word form]
as.cycle(rperm(30,9))
#>  [1] (19)(278)       (1743625)(89)   (13)(27)(4856)  (18634529)     
#>  [5] (12)(3549687)   (298)(35647)    (17932856)      (138)(274596)  
#>  [9] (276538)        (12453968)      (1248965)       (17486)(29)    
#> [13] (136978)(25)    (16)(258793)    (192756)(34)    (1796)(345)    
#> [17] (37)(69)        (16)(2384957)   (15893)(247)    (1867)(2395)   
#> [21] (19)(2358)(67)  (126589743)     (13)(2689)(475) (17825)(394)   
#> [25] (17453286)      (18624)(3957)   (1745269)(38)   (1649)(2873)   
#> [29] (1736954)       (19)(23867)    
rperm(10,9,2)
#>  [1] ()   (14) ()   ()   (68) ()   (28) ()   ()   ()  
#> [coerced from word form]

rcyc(20,5)
#>  [1] (14352) (12354) (14325) (12453) (13254) (12435) (14325) (14352) (12543)
#> [10] (14532) (15324) (13425) (12543) (14235) (14523) (12345) (12435) (15423)
#> [19] (12354) (12453)
rcyc(20,5,9)
#>  [1] (23485) (19483) (14729) (16539) (36857) (16247) (36587) (19358) (24568)
#> [10] (12859) (39567) (34769) (24769) (29546) (17856) (46758) (39865) (16243)
#> [19] (16253) (24386)

rgivenshape(10,c(2,3))   # size 5
#>  [1] (153)(24) (125)(34) (154)(23) (134)(25) (134)(25) (13)(245) (13)(245)
#>  [8] (15)(243) (135)(24) (14)(235)
rgivenshape(10,c(2,3,1,1)) # size 7
#>  [1] (12)(456) (23)(465) (246)(35) (145)(23) (153)(47) (175)(46) (176)(24)
#>  [8] (125)(36) (12)(347) (13)(456)

rgivenshape(1:9)
#> [1] (1,45,44,11,9,23,42)(2,26)(3,7,38,13,30,41,39,31)(4,19,12,22,27,5,32,40,14)(6,37,15,18)(10,34,25)(16,21,29,17,28,36)(20,35,33,43,24)

allpermslike(rgivenshape(c(1,1,3,4)))
#>  [1] (284)(5697) (248)(5697) (284)(5679) (248)(5679) (284)(5976) (248)(5976)
#>  [7] (284)(5967) (248)(5967) (284)(5769) (248)(5769) (284)(5796) (248)(5796)
```
