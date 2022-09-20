\name{perm_matrix}
\alias{perm_matrix}
\alias{permmatrix}
\alias{permutation_matrix}
\alias{is.perm_matrix}
\alias{as.perm_matrix}
\alias{pm_to_perm}
\title{Permutation matrices}
\description{
Given a permutation, coerce to word form and return the corresponding
permutation matrix
}
\usage{
perm_matrix(p,s=size(p))
is.perm_matrix(M)
pm_to_perm(M)
}
\arguments{
  \item{p}{Permutation, coerced to word form, of length 1}
  \item{s}{Size of permutation matrix or permutation}
  \item{M}{Permutation matrix}
}
\details{

  Given a permutation \code{p} of size \eqn{s}, function
  \code{perm_matrix()} returns a square matrix with \eqn{s} rows and
  \eqn{s} columns.  Entries are either 0 or 1; each row and each column
  has exactly one entry of 1 and the rest zero.

  Row and column names of the permutation matrix are integers; this
  makes the printed version more compact.

  Function \code{pm_to_perm()} takes a permutation matrix and returns
  the equivalent permutation in word form.
}
\note{

  Given a word \code{p} with size \code{s}, the idiom for
  \code{perm_matrix()} boils down to

  \preformatted{
    M <- diag(s)
    M[p,]
  }

  This is used explicitly in the \code{representations} vignette.  There
  is another way:

  \preformatted{
    M <- diag(s)
    M[cbind(seq_len(s),p)] <- 1
    M
  }

  which might be useful sometime.

  See also the \code{representation} and \code{order_of_ops} vignettes, which
  discuss permutation matrices.
  
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{permutation}}}
\examples{

perm_matrix(rperm(1,9))


p1 <- rperm(1,40)
M1 <- perm_matrix(p1)
p2 <- rperm(1,40)
M2 <- perm_matrix(p2)

stopifnot(is.perm_matrix(M1))

stopifnot(all(solve(M1) == perm_matrix(inverse(p1))))
stopifnot(all(M1 \%*\% M2 == perm_matrix(p1*p2)))


stopifnot(p1 == pm_to_perm(perm_matrix(p1)))

data("megaminx")
image(perm_matrix(permprod(megaminx)),asp=1,axes=FALSE)

}
\keyword{symbolmath}
