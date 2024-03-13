\name{commutator}
\alias{commutator}
\alias{dot}
\alias{.}
\alias{dot-class}
\alias{permutation-class}
\alias{extract}
\alias{commutator}
\alias{jacobi}
\alias{dot_error}
\alias{[.dot}
\alias{[,dot-method}
\alias{[,dot,ANY,ANY-method}
\alias{[,dot,ANY,missing-method}
\alias{[,dot,missing,ANY-method}
\alias{[,dot,missing,missing-method}
\alias{[,dot,matrix,matrix-method}
\alias{[,dot,permutation,permutation-method}
\alias{[,dot,permutation,permutation,ANY-method}
\title{Group-theoretic commutator: the dot object}
\description{\loadmathjax


In the \pkg{permutations} package, the dot is defined as the
\strong{Group-theoretic commutator}:
\mjeqn{[x,y]=x^{-1}y^{-1}xy}{[x,y]=x^(-1)y^(-1)xy}.  This is a bit of an
exception to the usual definition of \code{xy-yx} (along with the
\pkg{freegroup} package).  Package idiom is \code{commutator(x,y)} or
\code{.[x,y]}.

The Jacobi identity does not make sense in the context of the
\pkg{permutations} package, but the Hall-Witt identity is obeyed.

The \dQuote{dot} object is defined and discussed in \code{inst/dot.Rmd},
which creates file \code{data/dot.rda}.
}
\usage{
commutator(x, y)
}
\arguments{
  \item{x,y}{Permutation objects, coerced to word}
}
\author{Robin K. S. Hankin}
\examples{

.[as.cycle("123456789"),as.cycle("12")]


x <- rperm(10,7)
y <- rperm(10,8)
z <- rperm(10,9)

uu <- 
commutator(commutator(x,y),z^x) *
commutator(commutator(z,x),y^z) *
commutator(commutator(y,z),x^y) 

stopifnot(all(is.id(uu)))  # this is the  Hall-Witt identity


.[x,y]

is.id(.[.[x,y],z^x] * .[.[z,x],y^z] * .[.[y,z],x^y])
is.id(.[.[x,-y],z]^y * .[.[y,-z],x]^z * .[.[z,-x],y]^x)
}
