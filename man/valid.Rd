\name{valid}
\alias{valid}
\alias{validity}
\alias{singleword_valid}
\alias{cyclist_valid}
\title{
Functions to validate permutations
}
\description{

Functions to validate permutation objects: if valid, return \code{TRUE}
and if not valid, generate a \code{warning()} and return \code{FALSE}.

Function \code{singleword_valid()} takes an integer vector, interpreted
as a word, and checks that it is a permutation of
\code{seq_len(max(x))}.

Function \code{cyclist_valid()} takes a cyclist and checks that its
argument corresponds to a meaningful permutation: the elements must be
vectors of strictly positive integers with no repeated values and empty
pairwise intersection.  Compare \code{nicify_cyclist()} [documented at
\code{cyclist.Rd}] which is more cosmetic, converting its argument into
a standard form.

}
\usage{
singleword_valid(w)
cyclist_valid(x)
}
\arguments{
  \item{w}{In function \code{singleword_valid()}, an integer vector}
  \item{x}{In function \code{cyclist_valid()}, a cyclist}
}
\value{
Returns either \code{TRUE}, or gives a warning and returns \code{FALSE}
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{cyclist}}}
\examples{

singleword_valid(sample(1:9))      # TRUE
singleword_valid(c(3L,4L,2L,1L))   # TRUE
singleword_valid(c(3,4,2,1))       # FALSE (not integer)
singleword_valid(c(3L,3L,2L,1L))   # FALSE (3 repeated)

cyclist_valid(list(c(1,8,2),c(3,6))) # TRUE
cyclist_valid(list(c(1,8,2),c(3,6))) # FALSE ('8' is repeated)
cyclist_valid(list(c(1,8,1),c(3,6))) # FALSE ('1' is repeated)
cyclist_valid(list(c(0,8,2),c(3,6))) # FALSE (zero element)

}
\keyword{symbmath}
