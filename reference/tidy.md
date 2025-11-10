# Utilities to neaten permutation objects

Various utilities to neaten word objects by removing fixed elements

## Usage

``` r
tidy(x)
trim(x)
```

## Arguments

- x:

  Object of class `word`, or in the case of `tidy()`, coerced to class
  `word`

## Details

Function `trim()` takes a `word` and, starting from the right, strips
off columns corresponding to fixed elements until it finds a non-fixed
element. This makes no sense for `cycle` objects; if `x` is of class
`cycle`, an error is returned.

Function `tidy()` is more aggressive. This firstly removes *all* fixed
elements, then renames the non-fixed ones to match the new column
numbers. The map is an isomorphism (sic) with respect to composition.

## Value

Returns an object of class `word`

## Author

Robin K. S. Hankin

## Note

Results in empty (that is, zero-column) words if a vector of identity
permutations is given

## See also

[`fixed`](fixed.md),[`size`](size.md),[`nicify_cyclist`](cyclist.md)

## Examples

``` r
as.cycle(5:3)+as.cycle(7:9)
#> [1] (354)(789)
tidy(as.cycle(5:3)+as.cycle(7:9))
#> [1] (132)(456)
#> [coerced from word form]

as.cycle(tidy(c(as.cycle(1:2),as.cycle(6:7))))
#> [1] (12) (34)


nicify_cyclist(list(c(4,6), c(7), c(2,5,1), c(8,3)))
#> [[1]]
#> [1] 1 2 5
#> 
#> [[2]]
#> [1] 3 8
#> 
#> [[3]]
#> [1] 4 6
#> 

data(megaminx)
tidy(megaminx)  # has 120 columns, not 129
#>                                                                                          White 
#>                        (1,3,5,7,9)(2,4,6,8,10)(12,24,36,48,60)(13,25,37,49,51)(14,26,38,50,52) 
#>                                                                                         Purple 
#>                  (6,58,82,72,26)(7,59,83,73,27)(8,60,84,74,28)(11,13,15,17,19)(12,14,16,18,20) 
#>                                                                                     DarkYellow 
#>                 (8,20,80,70,38)(9,11,71,61,39)(10,12,72,62,40)(21,23,25,27,29)(22,24,26,28,30) 
#>                                                                                       DarkBlue 
#>              (1,23,69,109,41)(2,24,70,110,42)(10,22,68,108,50)(31,33,35,37,39)(32,34,36,38,40) 
#>                                                                                            Red 
#>               (2,34,106,96,52)(3,35,107,97,53)(4,36,108,98,54)(41,43,45,47,49)(42,44,46,48,50) 
#>                                                                                      DarkGreen 
#>                  (4,46,94,84,14)(5,47,95,85,15)(6,48,96,86,16)(51,53,55,57,59)(52,54,56,58,60) 
#>                                                                                     LightGreen 
#>         (21,79,111,101,31)(22,80,112,102,32)(30,78,120,110,40)(61,63,65,67,69)(62,64,66,68,70) 
#>                                                                                         Orange 
#>            (18,90,112,62,28)(19,81,113,63,29)(20,82,114,64,30)(71,73,75,77,79)(72,74,76,78,80) 
#>                                                                                      LightBlue 
#>            (16,56,92,114,74)(17,57,93,115,75)(18,58,94,116,76)(81,83,85,87,89)(82,84,86,88,90) 
#>                                                                                    LightYellow 
#>        (44,104,116,86,54)(45,105,117,87,55)(46,106,118,88,56)(91,93,95,97,99)(92,94,96,98,100) 
#>                                                                                           Pink 
#> (32,66,118,98,42)(33,67,119,99,43)(34,68,120,100,44)(101,103,105,107,109)(102,104,106,108,110) 
#>                                                                                           Grey 
#> (64,76,88,100,102)(65,77,89,91,103)(66,78,90,92,104)(111,113,115,117,119)(112,114,116,118,120) 
#> [coerced from word form]
stopifnot(all(unique(sort(unlist(as.cycle(tidy(megaminx)),recursive=TRUE)))==1:120))

jj <- megaminx*megaminx[1]
stopifnot(identical(shape(jj),shape(tidy(jj))))  #tidy() does not change shape
```
