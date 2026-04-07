# Extract or Replace elements of permutation vectors

Methods for `"["` and `"[<-"`, i.e., extraction or subsetting of
permutation vectors.

## Value

Extraction and methods return an onion or onionmat. Replacement methods
return an object of the same class as the right hand side.

## Details

Extraction and replacement for word form uses array-based indexing.
Cycle form uses list-based indexing and is thus less flexible.

## Author

Robin K. S. Hankin

## Note

Notes here

## Examples

``` r
(a <- rperm(9))
#> [1] (15376)(24) (1457263)   (1746)(253) (13625)     (1765)(243) (1764253)  
#> [7] (15673)     (165)(47)   (1253)(67) 
#> [coerced from word form]
a[1:3]
#> [1] (15376)(24) (1457263)   (1746)(253)
#> [coerced from word form]
a[5:7] <- id  # word form: multiple replacements allowed.
a
#> [1] (15376)(24) (1457263)   (1746)(253) (13625)     ()          ()         
#> [7] ()          (165)(47)   (1253)(67) 
#> [coerced from word form]

x <- as.cycle(rperm(9))
x
#> [1] (137)(46)   (165324)    (132)(56)   (17563)(24) (146)(37)   (13)(24567)
#> [7] (274)(356)  (2463)(57)  (1367254)  
x[5] <- x[4] * x[6]  # cycle form: replacement takes only a single index.
x
#> [1] (137)(46)   (165324)    (132)(56)   (17563)(24) (12576)     (13)(24567)
#> [7] (274)(356)  (2463)(57)  (1367254)  
```
