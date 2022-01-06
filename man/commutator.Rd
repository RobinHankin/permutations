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
\title{
Group-theoretic commutator and group action; the dot object
}
\description{
Group-theoretic commutator, defined as \eqn{[x,y]=x^{-1}y^{-1}xy}{[x,y]=x^(-1)y^(-1)xy}
}
\usage{
commutator(x, y)
}
\arguments{
  \item{x,y}{Permutation objects, coerced to word}
}
\author{
Robin K. S. Hankin
}
\seealso{\code{\link{group_action}}}
\examples{

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
