
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![Build
Status](https://travis-ci.org/RobinHankin/permutations.svg?branch=master)](https://travis-ci.org/RobinHankin/permutations)
<!-- badges: end -->

# Overview

The permutations package provides R-centric functionality for working
with permutations of a finite set. It includes group-theoretic
composition of permutations and can transform from word form to cycle
form and back.

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
#>  [1] (248659)(37)    (12569874)      (183)(24756)    (1256)(38)(479)
#>  [5] (17)(2495)(68)  (1627359)(48)   (129465738)     (286)(45)(79)  
#>  [9] (19)(28346)(57) (174385)(26)
```

The result is printed in cycle form but we can print in word form if we
wish:

``` r
options(print_word_as_cycle=FALSE)  # override default
as.word(rperm(10,9,3))
#>      {1} {2} {3} {4} {5} {6} {7} {8} {9}
#> [1]  4   .   .   8   .   .   .   1   .  
#> [2]  6   .   .   .   .   1   .   .   .  
#> [3]  .   4   .   9   .   .   .   .   2  
#> [4]  4   .   .   5   1   .   .   .   .  
#> [5]  .   .   .   .   .   .   .   .   .  
#> [6]  .   8   .   .   2   .   .   5   .  
#> [7]  .   .   9   .   .   .   .   .   3  
#> [8]  .   7   .   .   .   .   2   .   .  
#> [9]  .   .   8   .   .   .   .   3   .  
#> [10] 3   .   1   .   .   .   .   .   .
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
