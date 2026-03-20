\name{swap}
\alias{swap}
\title{Length-2 cycles; swap a pair of elements}
\description{Length-2 cycles; swap a pair of elements}
\usage{swap(a, b)}
\arguments{
  \item{a, b}{Integers}
}
\details{Swaps two elements.  Vectorized; uses standard recycling.}
\value{Returns a permutation in cycle form}
\author{Robin K. S. Hankin}
\note{
  If the first argument equals the second, the identity permutation is
  returned.

  Cycles of the form \eqn{(1n)}, that is, \code{swap(1, n)}, are used
  extensively in \code{inst/outer_automorphisms_of_S6.Rmd}.

  }
\seealso{\code{\link{as.cycle}}}
\examples{

swap(2, 8)

swap(5, 1:9)

swap(1:8, 8:1)

swap(sample(9), sample(9))

rcyc(10,4)^swap(1,9)


}
