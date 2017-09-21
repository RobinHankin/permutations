\name{derangement}
\alias{derangement}
\alias{is.derangement}
\title{
Tests for a permutation being a derangement.
}
\description{
  A \dfn{derangement} is a permutation which leaves no element fixed.
}
\usage{
is.derangement(x)
}
\arguments{
  \item{x}{Object to be tested}
}
\value{
A vector of Booleans corresponding to whether the permutations are
derangements or not.
}
\note{
The identity permutation is problematic because it potentially has zero
size.

The identity element is not a derangement, although the (zero-size) identity
cycle and permutation both return \code{TRUE} under the natural R idiom
\code{all(P != seq_len(size(P)))}. 
}
\author{
Robin K. S. Hankin
}
\seealso{\code{id}}
\examples{
is.derangement(rperm(16,4))
}
