\name{as.function.permutation}
\alias{as.function.permutation}
\alias{as.function.word}
\alias{as.function.cycle}
\title{
Coerce a permutation to a function
}
\description{
Coerce a permutation to an executable function
}
\usage{
\method{as.function}{permutation}(x, ...)
}
\arguments{
  \item{x}{permutation}
  \item{\dots}{further arguments (currently ignored)}
}
\author{
Robin K. S. Hankin
}
\note{
Multiplication of permutations loses associativity when using functional
notation; see examples.

Also, note that the coerced function will not take an argument greater
than the size (qv) of the permutation.

}
\examples{
x <- cyc_len(3)
y <- cyc_len(5)

xfun <- as.function(x)
yfun <- as.function(y)

stopifnot(xfun(yfun(2)) == as.function(y*x)(2)) # note transposition of x & y

# written in postfix notation one has the very appealing form x(fg) = (xf)g

# it's vectorized:
as.function(rperm(10,9))(1)   
as.function(as.cycle(1:9))(sample(9))
}

