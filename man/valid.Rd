\name{valid}
\alias{validity}
\alias{singleword_valid}
\alias{cyclist_valid}
\title{
Functions to validate permutations
}
\description{

Functions to validate permutation objects: if valid, return \code{TRUE}
and if not valid, generate a \code{warning()} and return \code{FALSE}.

Function \code{singleword.valid()} takes an integer vector, interpreted
as a word, and checks that it is a permutation of
\code{seq_len(max(x))}.

Function \code{cycle.valid()} takes a cyclist and checks for disjoint
cycles of strictly positive integers with no repeats.
}
\usage{
singleword_valid(w)
cyclist_valid(x)
}
\arguments{
  \item{x}{In function \code{cycle_valid()}, a cyclist}
  \item{w}{In function \code{singleword_valid()}, an integer vector}
}
\value{
Returns either \code{TRUE}, or stops with an informative error message
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
