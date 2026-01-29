\name{c}
\alias{c}
\alias{c.word}
\alias{c.cycle}
\alias{rep.permutation}
\title{
Concatenation of permutations
}
\description{
Concatenate words or cycles together 
}
\usage{
\method{c}{word}(...)
\method{c}{cycle}(...)
\method{rep}{permutation}(x, ...)
}
\arguments{
  \item{\dots}{In the methods for \code{c()}, objects to be
    concatenated, which all must be of the same type: either all
    \code{word}, or all \code{cycle}}
  \item{x}{In the method for \code{rep()}, a permutation object}
}
\author{
Robin K. S. Hankin
}
\note{

The methods for \code{c()} do not attempt to detect which type (word or
cycle) you want as conversion is expensive.

Function \code{rep.permutation()} behaves like \code{base::rep()} and
takes the same arguments, eg \code{times} and \code{each}.
  
}
\seealso{
\code{\link{size}}
}
\examples{
x <- as.cycle(1:5)
y <- cycle(list(list(1:4,8:9), list(1:2)))


# concatenate cycles:
c(x,y)

# concatenate words:
c(rperm(5,3),rperm(6,9))   # size adjusted to maximum size of args


# repeat words:
rep(x, times=3)

# c(id, rperm())  # fails: elements are of different types, one cycle, one word.
c(as.word(id), rperm())   # works: coerce id [which is a cycle] to word form
c(id, as.cycle(rperm()))  # works: coerce rperm() [which is a word] to cycle form

}
