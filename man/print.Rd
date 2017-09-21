\name{print}
\alias{print.permutation}
\alias{print.word}
\alias{print.cycle}
\alias{as.character.cycle}
\alias{as.character_cyclist}
\title{
Print methods for permutation objects
}
\description{
Print methods for permutation objects with matrix-like printing for
words and bracket notation for cycle objects.
}
\usage{
\method{print}{cycle}(x, ...)
\method{print}{word}(x, h = getOption("print_word_as_cycle"), ...)
as.character_cyclist(y,comma=TRUE)
}

\arguments{
  \item{x}{Object of class \code{permutation} with \code{word}s
    dispatched to \code{print.word()} and \code{cycle}s dispatched to
    \code{print.cycle()}}
  \item{h}{Boolean, with default \code{TRUE} meaning to coerce words
    to cycle form before printing.  See details}
  \item{...}{Further arguments (currently ignored)}
  \item{y,comma}{In \code{as.character.cyclist()}, argument \code{y}
    is a list of cycles (a cyclist); and \code{comma} is Boolean,
    specifying whether to include a comma in the output}
}
\value{
Returns its argument invisibly, after printing it.
}

\details{

  Printing of word objects is controlled by
  \code{options("print_word_as_cycle")}.  The default behaviour is to
  coerce a word to cycle form and print that, with a notice that the
  object itself was coerced from word.
  
  If \code{options("print_word_as_cycle")} is \code{FALSE}, then objects
  of class word are printed as a matrix with rows being the permutations
  and fixed points indicated with a dot.

}

\author{
Robin K. S. Hankin
}
\seealso{
\code{\link{nicify_cyclist}}
}
\examples{
x <- rperm(4,9)
as.word(x)
as.cycle(x)
}
\keyword{symbolmath}
