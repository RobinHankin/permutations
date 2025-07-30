\name{permorder}
\alias{permorder}
\title{
The order of a permutation
}
\description{
Returns the order of a permutation \eqn{P}: the smallest strictly
positive integer \eqn{n} for which \eqn{P^n} is the identity.
}
\usage{
permorder(x, singly = TRUE)
}
\arguments{
  \item{x}{Permutation, coerced to \code{cycle} form}
  \item{singly}{Boolean, with default \code{TRUE} meaning to return the
    order of each element of the vector, and \code{FALSE} meaning to
    return the order of the vector itself (that is, the smallest
    strictly positive integer for which \code{all(x^n == id)}).
}
}
\details{
  Coerces its argument to cycle form.
  
  The order of the identity permutation is 1.
}
\author{Robin K. S. Hankin}
\note{
  Uses \code{mLCM()} from the \code{numbers} package.
}
\seealso{
\code{\link{sgn}}
}
\examples{
x <- rperm(5,20)
permorder(x)
permorder(x,FALSE)

stopifnot(all(is.id(x^permorder(x))))
stopifnot(is.id(x^permorder(x,FALSE)))
}
