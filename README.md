
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Overview

The permutations package provides R-centric functionality for working
with . It includes cross products and wedge products and a variety of
use-cases. An extensive vignette is provided in the package; this
document is here for discoverability.

# Installation

You can install the released version of permutations from
[CRAN](https://CRAN.R-project.org) with:

``` r
# install.packages("permutations")  # uncomment this to use the package
library("permutations")
#> 
#> Attaching package: 'permutations'
#> The following object is masked from 'package:stats':
#> 
#>     cycle
```

The package is maintained on
[github](https://github.com/RobinHankin/permutations).

# The `permutations` package in use

Random permutations on a finite set are given by the `rperm()` command:

``` r
rperm(10,9)
#>  [1] (149736)(28)    (13)(2987)(465) (149237)(58)    (18765)        
#>  [5] (12684)(37)(59) (139)(276)(45)  (1438756)(29)   (125963)(487)  
#>  [9] (15786)(49)     (14526)(3897)
```

The result is printed in cycle form but we can print in word form if we
wish:

``` r
options(print_word_as_cycle=FALSE)  # override default
as.word(rperm(10,9,3))
#>      {1} {2} {3} {4} {5} {6} {7} {8} {9}
#> [1]  .   .   .   9   .   .   4   .   7  
#> [2]  9   .   .   .   .   .   .   .   1  
#> [3]  .   .   .   .   .   .   .   .   .  
#> [4]  .   .   .   5   8   .   .   4   .  
#> [5]  .   .   .   .   9   .   .   .   5  
#> [6]  5   .   .   .   1   .   .   .   .  
#> [7]  .   .   .   8   .   .   .   4   .  
#> [8]  2   8   .   .   .   .   .   1   .  
#> [9]  .   .   .   .   .   .   .   .   .  
#> [10] .   .   6   .   .   3   .   .   .
options(print_word_as_cycle=TRUE)  # usually want to print a cycle irregardless
```

(A dot indicates a fixed point). The package uses arithmetic operations
`*` to combine permutations and `^` for conjugation:

``` r
(a <- as.word(c(4,2,3,1,5,7,6)))
#> [1] (14)(67)
(b <- as.cycle(1:4))
#> [1] (1234)
a*b
#> [1] (234)(67)
b*a
#> [1] (123)(67)
```

# The megaminx

The *megaminx* is a dodecahedral puzzle with similar construction to the
Rubik cube puzzle that has 50 movable pieces and 132 coloured stickers
(\`\`facets’’). The permutations package includes functionality to
simulate the megaminx and exhibits an 82-turn superflip. The vignette
gives an extended discussion.
