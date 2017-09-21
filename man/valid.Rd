\name{valid}
\alias{validity}
\alias{singleword_valid}
\alias{cyclist_valid}
\title{
Functions to validate permutations
}
\description{
Functions to validate permutation objects.

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
\seealso{
\code{\link{cyclist}}
}
\examples{

singleword_valid(sample(1:9))

\dontrun{
singleword_valid(c(5,6,3,9,7,8,2,1))   # returns an error (no '4')
singleword_valid(c(5,6,3,4,9,7,8,2,1)) # returns an error (not integer)
}

cyclist_valid(list(c(1,8,2),c(3,6))) # should be TRUE
singleword_valid(c(5L,6L,3L,4L,9L,7L,8L,2L,1L)) # should be TRUE

\dontrun{
cyclist_valid(list(c(1,8,2),c(8,6))) # returns an error ('8' is repeated)
}
}
\keyword{symbmath}
