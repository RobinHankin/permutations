\name{sgn}
\alias{sgn}
\alias{is.even}
\title{
Sign of a permutation
}
\description{
The sign of a permutation is \eqn{\pm 1}{+/-1} depending on whether it
is even or odd
}
\usage{
sgn(x)
is.even(x)
}
\arguments{
  \item{x}{permutation object}
}
\details{
Coerces to cycle form
}
\author{
Robin K. S. Hankin
}
\seealso{
\code{\link{shape}}
}
\examples{

sgn(id)  # always problematic

sgn(rperm(10,5))

x <- rperm(40,6)
y <- rperm(40,6)


stopifnot(all(sgn(x*y) == sgn(x)*sgn(y)))   # sgn() is a homomorphism


z <- as.cycle(rperm(20,9,5))
z[is.even(z)]

}

