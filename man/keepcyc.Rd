\name{keepcyc}
\alias{keepcyc}
\title{Keep or discard some cycles of a permutation}
\description{

  Given a permutation and a function that returns a Boolean specifying
  whether a cycle is acceptable, return a permutation retaining only the
  acceptable cycles.

}
\usage{keepcyc(a, func, ...)}
\arguments{
  \item{a}{Permutation, coerced to cycle}
  \item{func}{Function to be applied to each element of \code{a}}
  \item{...}{Further arguments to \code{fun()}}
}
\value{Returns a permutation in cycle form}
\author{Robin K. S. Hankin}
\note{
  Function \code{keepcyc()} is idempotent.
  }
\seealso{\code{\link{allcyc}}}
\examples{

keepcyc(rgivenshape(10,2:8),function(x){length(x) == 2})  # retains just transpositions
keepcyc(megaminx,function(x){any(x == 100)})              # retains just cycles modifying facet #100
keepcyc(rperm(100),function(x){max(x)-min(x) < 3})        # retains just cycles with range<3

f <- function(x,p){all(x<p) || all(x>p)}
keepcyc(rgivenshape(9,rep(2:3,9)),f,p=20)                 # only cycles with all entries either <20 or >20

}
