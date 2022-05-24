\name{tidy}
\alias{tidy}
\alias{trim}
\title{
Utilities to neaten permutation objects
}
\description{
Various utilities to neaten word objects by removing fixed elements
}
\usage{
tidy(x)
trim(x)
}
\arguments{
  \item{x}{Object of class \code{word}, or in the case of
    \code{tidy()}, coerced to class \code{word}}
  }
\details{
Function \code{trim()} takes a \code{word} and, starting from the right,
strips off columns corresponding to fixed elements until it finds a
non-fixed element.  This makes no sense for \code{cycle} objects; if
\code{x} is of class \code{cycle}, an error is returned.

Function \code{tidy()} is more aggressive.  This firstly removes
\emph{all} fixed elements, then renames the non-fixed ones to match the
new column numbers.  The map is an isomorphism (sic) with respect to
composition.

}
\value{
Returns an object of class \code{word}
}

\author{
Robin K. S. Hankin
}
\note{
Results in empty (that is, zero-column) words if a vector of identity
permutations is given
}
\seealso{
\code{\link{fixed}},\code{\link{size}},\code{\link{nicify_cyclist}}
}
\examples{
as.cycle(5:3)+as.cycle(7:9)
tidy(as.cycle(5:3)+as.cycle(7:9))

as.cycle(tidy(c(as.cycle(1:2),as.cycle(6:7))))


nicify_cyclist(list(c(4,6), c(7), c(2,5,1), c(8,3)))

data(megaminx)
tidy(megaminx)  # has 120 columns, not 129
stopifnot(all(unique(sort(unlist(as.cycle(tidy(megaminx)),recursive=TRUE)))==1:120))

jj <- megaminx*megaminx[1]
stopifnot(identical(shape(jj),shape(tidy(jj))))  #tidy() does not change shape

}

\keyword{symbolmath}
