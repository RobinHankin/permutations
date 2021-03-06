\name{commutator}
\alias{commutator}
\title{
Group-theoretic commutator and group action
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

}
