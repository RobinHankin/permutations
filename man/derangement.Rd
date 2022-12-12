\name{derangement}
\alias{derangement}
\alias{is.derangement}
\title{Tests for a permutation being a derangement}
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
cycle and permutation both return \code{TRUE} under the natural \R idiom
\code{all(P != seq_len(size(P)))}. 
}
\author{
Robin K. S. Hankin
}
\seealso{\code{id}}
\examples{

allperms(4)
is.derangement(allperms(4))

M <- matrix(c(1,2,3,4, 2,3,4,1, 3,2,4,1),byrow=TRUE,ncol=4)
M
is.derangement(word(M))

is.derangement(rperm(16,4))

}
