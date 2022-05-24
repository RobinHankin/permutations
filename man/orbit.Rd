\name{orbit}
\alias{orbit}
\alias{orbit_single}
\title{
Orbits of integers
}
\description{
Finds the orbit of a given integer
}
\usage{
orbit_single(c1,n1)
orbit(cyc,n)
}
\arguments{
  \item{c1,n1}{In (low-level) function \code{orbit_single()}, a cyclist
    and an integer vector respectively}
  \item{cyc,n}{In (vectorized) function \code{orbit()}, \code{cyc} is
    coerced to a cycle, and \code{n} is an integer vector}
}
\value{

  Given a cyclist \code{c1} and integer \code{n1}, function
  \code{orbit_single()} returns the single cycle containing integer
  \code{n1}.  This is a low-level function, not intended for the
  end-user.

  Function \code{orbit()} is the vectorized equivalent of
  \code{orbit_single()}.  Vectorization is inherited from
  \code{cbind()}. 
  
}
\author{
Robin K. S. Hankin
}
\seealso{
\code{\link{fixed}}
}
\examples{

orbit(as.cycle("(123)"),1:5)
orbit(as.cycle(c("(12)","(123)(45)","(2345)")),1)
orbit(as.cycle(c("(12)","(123)(45)","(2345)")),1:3)

data(megaminx)
orbit(megaminx,13)

}
\keyword{symbolmath}
