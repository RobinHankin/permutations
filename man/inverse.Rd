\name{inverse}
\alias{inverse}
\alias{inverse_word_single}
\alias{inverse_cyclist_single}
\alias{inverse.word}
\alias{inverse.cycle}
\title{Inverse of a permutation}
\description{
Calculates the inverse of a permutation in either word or cycle form
}
\usage{
inverse(x)
\method{inverse}{word}(x)
\method{inverse}{cycle}(x)
inverse_word_single(W)
inverse_cyclist_single(cyc)
}
\arguments{
  \item{x}{Object of class \code{permutation} to be inverted}
  \item{W}{In function \code{inverse_word_single()}, a vector
    corresponding to a permutation in word form (that is, one row of a
    \code{word} object)}
  \item{cyc}{In function \code{inverse_cyclist_single()}, a cyclist to
  be inverted}
}
\details{
The package provides methods to invert objects of class \code{word}
(the R idiom is \code{W[W] <- seq_along(W)}) and also objects of class
\code{cycle} (the idiom is
\code{lapply(cyc,function(o){c(o[1],rev(o[-1]))})}).

The user should use \code{inverse()} directly, which dispatches to
either \code{inverse.word()} or \code{inverse.cycle()} as appropriate.

Sometimes, using idiom such as \code{x^-1} or \code{id/x} gives neater
code, although these may require coercion between word form and cycle
form.

}
\value{
Function \code{inverse()} returns an object of the same class as its argument.
}
\author{
Robin K. S. Hankin
}
\seealso{
\code{\link{cycle_power}}
}
\examples{
x <- rperm(10,6)
x
inverse(x)

all(is.id(x*inverse(x)))  # should be TRUE

inverse(as.cycle(matrix(1:8,9,8)))

}
