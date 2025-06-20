\name{megaminx_superflip}
\alias{megaminx_superflip}
\alias{superflip}
\alias{edge_facets}
\alias{is.flip_pair}
\alias{is.flip_singleperm}
\alias{is.flip}
\alias{is.superflip}
\title{The Megaminx Superflip}
\description{

On the megaminx, a \dfn{flip} is a a sequence of moves whose only effect
is to flip one or more edge pieces in place (the number of edges flipped
must be even).  The \emph{superflip} is the operation that flips each of
the 30 edges of the puzzle.

Object \code{edge_facets} is a 30 row, two-column matrix with each row
representing an edge facet.

}
\usage{
is.flip_pair(pair)
is.flip(p)
is.flip(p)
is.superflip(p)
}
\arguments{
  \item{pair}{Integer vector of length two corresponding to a pair of facets}
  \item{p}{Vector iof permutations, coerced to cycle form}
}
\value{Returns a boolean vector}
\author{Robin K. S. Hankin}
\seealso{\code{\link{megaminx}}}
\examples{

stopifnot(all(
 is.flip_pair(c(10,46)),
 is.flip_pair(c(98,124)),
!is.flip_pair(c(10,98)),
!is.flip_pair(c(11,98))
))

is.flip(c(
    as.cycle("(10,46)(44,50)(56,62)"),
    as.cycle("74,121)")),
    as.cycle("74,120)"))

}
