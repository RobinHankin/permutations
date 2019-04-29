\name{perm_matrix}
\alias{perm_matrix}
\alias{permutation_matrix}
\alias{is.perm_matrix}
\title{
Permutation matrices
}
\description{
Given a permutation, coerce to word form and return the corresponding
permutation matrix
}
\usage{
perm_matrix(p)
is.perm_matrix(M)
}
\arguments{
  \item{p}{Permutation, coerced to word form, of length 1}
  \item{M}{Permutation matrix}
}
\value{

  Given a permutation \code{p} of size $s$, function
  \code{perm_matrix()} returns a square matrix with $s$ rows and $s$
  columns.  Entries are either 0 or 1; each row and each column has
  exactly one entry of 1 and the rest zero.
  
  
}
\author{
Robin K. S. Hankin
}
\seealso{
\code{\link{permutation}}
}
\examples{

perm_matrix(rperm(1,9))


p1 <- rperm(1,40)
M1 <- perm_matrix(p1)
p2 <- rperm(1,40)
M2 <- perm_matrix(p2)

stopifnot(is.perm_matrix(M1))

stopifnot(all(solve(M1) == perm_matrix(inverse(p1))))
stopifnot(all(M1 \%*\% M2 == perm_matrix(p1*p2)))

data("megaminx")
image(perm_matrix(permprod(megaminx)),asp=1,axes=FALSE)

}
\keyword{symbolmath}
