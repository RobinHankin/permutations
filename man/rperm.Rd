\name{rperm}
\alias{rperm}
\alias{rword}
\alias{rcycle}
\title{
Random permutations
}
\description{
Create a word object of random permutations
}
\usage{
rperm(n=10,r=7,moved=NA)
}
\arguments{
  \item{n}{Number of permutations to create}
  \item{r}{Size of permutations}
  \item{moved}{Integer specifying how many elements can move (that is,
    how many elements do not map to themselves), with default \code{NA}
    meaning to choose a permutation at random.  This is useful if you
    want a permutation that has a compact cycle representation}
}
\value{
Returns an object of class \code{word}
}
\author{
Robin K. S. Hankin
}
\note{
  Argument \code{moved} specifies a \emph{maximum} number of elements
  that do not map to themselves; the actual number of non-fixed elements
  might be lower (as some elements might map to themselves).
  }
\seealso{
\code{\link{size}}
}
\examples{
rperm()
as.cycle(rperm(30,9))


rperm(10,9,2)
}
\keyword{sybolmath}
