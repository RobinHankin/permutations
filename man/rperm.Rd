\name{rperm}
\alias{rperm}
\alias{rword}
\alias{rcycle}
\alias{rcyc}
\alias{r1cyc}
\alias{rgs1}
\alias{rgivenshape}
\title{
Random permutations
}
\description{
  Function \code{rperm()} creates a word object of random permutations.
  Function \code{rcyc()} creates random permutations comprising a single
  (group-theoretic) cycle of a specified length.  Functions
  \code{r1cyc()} and \code{rgs1()} are low-level helper functions.
}
\usage{
rperm(n=10,r=7,moved=NA)
rcyc(n,len,r=len)
r1cyc(len,vec)
rgs1(s)
rgivenshape(n,s,size=sum(s))
}
\arguments{
  \item{n}{Number of permutations to create}
  \item{r}{Size of permutations}
  \item{len}{Length of cycles in \code{rcyc()} and \code{r1cyc()}}
  \item{moved}{In function \code{rperm()}, integer specifying how many
    elements can move (that is, how many elements do not map to
    themselves), with default \code{NA} meaning to choose a permutation
    at random.  This is useful if you want a permutation that has a
    compact cycle representation}
  \item{vec}{Vector of integers to generate a cycle from}
  \item{s,size}{Shape and size of permutations to create}
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
  might be lower (as some elements might map to themselves).  You can
  control the number of non-fixed elements precisely with argument
  \code{len} of function \code{rcyc()}, although this will give only
  permutations with a single (group-theoretic) cycle.

  Argument \code{s} of function \code{rgivensize()} can include 1s
  (ones).  Although length-one cycles are dropped from the resulting
  permutation, it is sometimes useful to include them to increase the
  size of the result, see examples.

}
\seealso{
\code{\link{size}}
}
\examples{
rperm()
as.cycle(rperm(30,9))
rperm(10,9,2)

rcyc(20,5)
rcyc(20,5,9)

rgivenshape(10,c(2,3))   # size 5
rgivenshape(10,c(2,3,1,1)) # size 7
}
\keyword{symbolmath}
