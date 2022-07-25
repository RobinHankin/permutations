\name{size}
\alias{size}
\alias{size.cycle}
\alias{size<-.cycle}
\alias{size.word}
\alias{size<-}
\alias{size<-.word}
\alias{addcols}
\title{
Gets or sets the size of a permutation
}
\description{
The \sQuote{size} of a permutation is the cardinality of the set for
which it is a bijection.
}
\usage{
size(x)
addcols(M,n)
\method{size}{word}(x)
\method{size}{cycle}(x)
\method{size}{word}(x) <- value
\method{size}{cycle}(x) <- value
}
\arguments{
  \item{x}{A permutation object}
  \item{M}{A matrix that may be coerced to a word}
  \item{n,value}{the size to set to, an integer}
}

\details{
For a \code{word} object, the \dfn{size} is equal to the number of columns.
For a \code{cycle} object, it is equal to the largest element of any
cycle.

Function \code{addcols()} is a low-level function that operates on, and
returns, a matrix.  It just adds columns to the right of \code{M}, with
values equal to their column numbers, thus corresponding to fixed
elements.  The resulting matrix has \code{n} columns.  This function
cannot remove columns, so if \code{n<ncol(M)} an error is returned.

Setting functions cannot decrease the size of a permutation; use
\code{trim()} for this.

It is meaningless to change the size of a \code{cycle} object.  Trying
to do so will result in an error.  But you can coerce cycle objects to
\code{word} form, and change the size of that.

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{fixed}}}
\examples{

size(as.cycle(c("(17)","(123)(45)")))  # should be 7

x <- as.word(as.cycle("123"))
print_word(x)
size(x) <- 9
print_word(x)


size(as.cycle(1:5) + as.cycle(100:101))

size(id)
}
\keyword{symbmath}
