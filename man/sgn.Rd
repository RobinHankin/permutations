\name{sgn}
\alias{sgn}
\alias{is.even}
\alias{is.odd}
\title{Sign of a permutation}
\description{
Returns the sign of a permutation
}
\usage{
sgn(x)
is.even(x)
is.odd(x)
}
\arguments{\item{x}{permutation object}}
\details{

The sign of a permutation is \eqn{\pm 1}{+/-1} depending on whether it
is even or odd.  A permutation is \dfn{even} if it can be written as a
product of an even number of transpositions, and \dfn{odd} if it can be
written as an odd number of transpositions.  The map
\eqn{\operatorname{sgn}\colon S_n\longrightarrow\left\lbrace
+1,-1\right\rbrace}{omitted} is a homomorphism; see examples.}
\author{Robin K. S. Hankin} \note{Internally, function \code{sgn()}
coerces to cycle form.

The sign of the null permutation is \code{NULL}.
}
\seealso{\code{\link{shape}}}
\examples{

sgn(id)  # always problematic

sgn(rperm(10,5))

x <- rperm(40,6)
y <- rperm(40,6)


stopifnot(all(sgn(x*y) == sgn(x)*sgn(y)))   # sgn() is a homomorphism


z <- as.cycle(rperm(20,9,5))
z[is.even(z)]
z[is.odd(z)]

}

