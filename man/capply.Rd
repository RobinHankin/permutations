\name{capply}
\alias{capply}
\title{Apply functions to elements of a cycle}
\description{
  Function \code{capply()} means \dQuote{cycle apply} and is modelled on
  \code{lapply()}.  It applies a function to every element in the cycles
  of its argument.
}
\usage{capply(X, fun, ...)}
\arguments{
  \item{X}{Permutation, coerced to cycle}
  \item{fun}{Function to be applied to each element of \code{X}}
  \item{...}{Further arguments to \code{fun()}}
}
\details{This function is just a convenience wrapper really.}
\value{Returns a permutation in cycle form}
\author{Robin K. S. Hankin}
\note{Function \code{allcyc()} is a nice application of
  \code{capply()}.
}
\seealso{\code{\link{allcyc}}}
\examples{


(x <- rperm())
capply(x,range)

capply(x,function(x){x+100})

capply(x,rev)
all(is.id(capply(x,rev)*x))  # should be TRUE

capply(rcyc(20,5,9),sort)

capply(rcyc(20,5,9),sample)  # still 5-cycles


capply(cyc_len(1:9),\(x)x[x>4])

capply(cyc_len(1:9),\(x)x^2)


}
