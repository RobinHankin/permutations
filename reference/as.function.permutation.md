# Coerce a permutation to a function

Coerce a permutation to an executable function with domain
\\\left\lbrace 1,\ldots,n\right\rbrace\\.

The resulting function is vectorised.

## Usage

``` r
# S3 method for class 'permutation'
as.function(x, ...)
```

## Arguments

- x:

  permutation

- ...:

  further arguments (currently ignored)

## Details

This functionality is sometimes known as *group action*. Formally,
suppose we have a set \\X\\, a group \\G\\, and a function
\\\alpha\colon X\times G\longrightarrow X\\. Then we say \\\alpha\\ is a
group action if \\\alpha(x,e)=e\\ and
\\\alpha(\alpha(x,g),h)=\alpha(x,gh)\\. Writing \\x\cdot g\\ for
\\\alpha(x,g)\\ we have \\x\cdot e=x\\ and \\(x\cdot g)\cdot
h=x\cdot(gh)\\. The dot may be omitted giving us \\(xg)h=x(gh)\\. If the
group is a permutation group on \\X\\, then it is natural to choose
\\\alpha(x,g)=g(x)\\.

In package idiom, given permutation `g` \[considered as an element of
the symmetric group \\S_n\\\], `as.function(g)` returns the function
with domain \\\left\[n\right\]=\left\lbrace 1,\ldots,n\right\rbrace\\
mapping \\x\in\[n\]\\ to \\\alpha(g,x)=g(x)=xg\\. For example, if
\\g=(172)(45)\\ then \\\alpha(g,7)=g(7)=7g=2\\ and similarly
\\\alpha(g,4)=5\\.

Package idiom allows one to explicitly coerce `g` to a function, or to
use the overloaded caret:

        (g <- as.cycle("(172)(45)"))
        #> [1] (172)(45)
        as.function(g)(7)
        #> [1] 2
        7^g
        #> [1] 2
      

## Author

Robin K. S. Hankin

## Note

Multiplication of permutations loses associativity when using functional
notation; see examples.

Also, note that the coerced function will not take an argument greater
than the size (qv) of the permutation.

Vignette `vignettes/groupaction.Rmd` discusses this issue.

## Examples

``` r
x <- cyc_len(3)
y <- cyc_len(5)

xfun <- as.function(x)
yfun <- as.function(y)

stopifnot(xfun(yfun(2)) == as.function(y*x)(2)) # note transposition of x & y

# postfix notation has the very appealing result x(fg) == (xf)g
# Carets are good too, in that x^(fg) == (x^f)^g.

a <- rperm()
b <- rperm()
stopifnot(2^(a*b) == (2^a)^b)

# it's fully vectorized:
as.function(rperm(10,9))(1)
#>  [1] 7 7 9 1 7 5 6 3 8 4
as.function(as.cycle(1:9))(sample(9))
#> [1] 2 7 3 8 6 1 9 4 5
as.function(allcyc(5:8))(1:6)
#> [1] 1 2 3 4 8 5

# standard recycling rules apply:
f <- as.function(allperms(3))
all(f(1:3) == f(c(1:3,1:3)))
#> [1] TRUE
```
