\name{id}
\alias{id}
\alias{is.id}
\alias{is.id.cycle}
\alias{is.id_single_cycle}
\alias{is.id.list}
\alias{is.id.word}
\title{
The identity permutation
}
\description{
  The \dfn{identity permutation} leaves every element fixed
}
\usage{
is.id(x)
is.id_single_cycle(x)
\method{is.id}{cycle}(x)
\method{is.id}{list}(x)
\method{is.id}{word}(x)
}
\arguments{
  \item{x}{Object to be tested}
}
\details{
The identity permutation is problematic because it potentially has zero size.
}
\value{
The variable \code{id} is a \emph{cycle} as this is more convenient
than a zero-by-one matrix.

Function \code{is.id()} returns a Boolean with \code{TRUE} if the
corresponding element is the identity, and \code{FALSE} otherwise.  It
dispatches to either \code{is.id.cycle()} or \code{is.id.word()} as
appropriate. 

Function \code{is.id.list()} tests a cyclist for identityness.
}
\author{
Robin K. S. Hankin
}
\note{
The identity permutations documented here are distinct from the null
permutations documented at \code{nullperm.Rd}.
}
  
\seealso{\code{is.derangement},\code{nullperm}}
\examples{
is.id(id)

as.word(id)  # weird

x <- rperm(10,4)
x[3] <- id
is.id(x*inverse(x))
}
