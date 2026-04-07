\name{Extract}
\alias{Extract}
\alias{Replace}
\alias{[.permutation}
\alias{[.word}
\alias{[.cycle}
\alias{[<-.permutation}
\alias{[<-.word}
\alias{[<-.cycle}
\alias{[<-}
\title{Extract or Replace elements of permutation vectors}
\description{
   Methods for \code{"["} and  \code{"[<-"}, i.e., extraction or
   subsetting of permutation vectors.
 }
\value{
Extraction and methods return an onion or onionmat.  Replacement methods
return an object of the same class as the right hand side.
}
\details{

 Extraction and replacement for word form uses array-based indexing.
 Cycle form uses list-based indexing and is thus less flexible.
  }
\author{Robin K. S. Hankin}
\note{Notes here}
\examples{

(a <- rperm(9))
a[1:3]
a[5:7] <- id  # word form: multiple replacements allowed.
a

x <- as.cycle(rperm(9))
x
x[5] <- x[4] * x[6]  # cycle form: replacement takes only a single index.
x

}
