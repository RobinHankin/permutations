\name{outer}
\alias{outer}
\alias{outer.cycle}
\alias{outer.word}
\alias{outer.permutation}
\alias{outer,permutation,permutation-method}
\title{Outer product of vectors of permutations}
\description{
The outer product of two vectors of permutations is the pairwise product
of each element of the first with each element of the second.
}
\details{

It works in much the same way as \code{base::outer()}.  The third
argument, \code{FUN}, as in \code{outer(X,Y,FUN="*")} is regular
group-theoretic multiplication but can be replaced with \code{+} if you
are sure that the cycles of \code{X} and \code{Y} are distinct, see the
examples.  Each element of the returned matrix is a one-element list.

The print method may have room for improvement.

}
\author{Robin K. S. Hankin}
\examples{

(M <- outer(rperm(),rperm()))
outer(cyc_len(4) + 0:3, cyc_len(4) + 100:101,"+")  # OK because the cycles are distinct

do.call("c",M) # c(M) gives a list and unlist(a) gives a numeric vector

}
\keyword{symbmath}
