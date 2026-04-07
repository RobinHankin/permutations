# The Symmetric Group: Permutations of a Finite Set

Manipulates invertible functions from a finite set to itself. Can
transform from word form to cycle form and back. To cite the package in
publications please use Hankin (2020) "Introducing the permutations R
package", SoftwareX, volume 11 \<doi:10.1016/j.softx.2020.100453\>.

## Details

The DESCRIPTION file: This package was not yet installed at build
time.  
Index: This package was not yet installed at build time.  

## Author

Robin K. S. Hankin \[aut, cre\] (ORCID:
\<https://orcid.org/0000-0001-5982-0415\>), Paul Egeler \[ctb\] (ORCID:
\<https://orcid.org/0000-0001-6948-9498\>)

Maintainer: Robin K. S. Hankin \<hankin.robin@gmail.com\>

## Examples

``` r
a <- rperm(10,5)
b <- rperm(10,5)

a*b
#>  [1] (135)     (1453)    (1245)    (143)     (142)(35) (14253)   (35)     
#>  [8] (15243)   (14)      (254)    
#> [coerced from word form]

inverse(a)
#>  [1] (15)(234) (12543)   (12354)   (13254)   (15)(243) (2354)    (145)    
#>  [8] (15423)   (15)(23)  (2354)   
#> [coerced from word form]

```
