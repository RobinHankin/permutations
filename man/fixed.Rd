\name{fixed}
\alias{fixed}
\alias{fixed.word}
\alias{fixed.cycle}
\title{
Fixed  elements
}
\description{
Finds which elements of a permutation object are fixed
}
\usage{
\method{fixed}{word}(x)
\method{fixed}{cycle}(x)
}
\arguments{
  \item{x}{Object of class \code{word} or \code{cycle}}
  \item{\dots}{further arguments (currently unused)}
}
\value{
Returns a Boolean vector corresponding to the fixed elements of a permutation.
}
\note{

The function is vectorized; if given a vector of permutations,
\code{fixed()} returns a Boolean vector showing which elements are fixed
by \emph{all} of the permutations.

This function has two methods: \code{fixed.word()} and
\code{fixed.cycle()}, neither of which coerce.
}
\author{
Robin K. S. Hankin
}
\seealso{
\code{\link{tidy}}
}
\examples{
fixed(as.cycle(1:3)+as.cycle(8:9))   # elements 4,5,6,7 are fixed
fixed(id)


data(megaminx)
fixed(megaminx)


}
\keyword{symbolmath}
