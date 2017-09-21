\name{shape}
\alias{shape}
\alias{padshape}
\alias{shape_cyclist}
\alias{shapepart}
\alias{shapepart_cyclist}
\title{Shape of a permutation}
\description{
Returns the shape of a permutation.  If given a word, it coerces to
cycle form.
}
\usage{
shape(x, drop = TRUE,id1=TRUE)
shape_cyclist(cyc,id1=TRUE)
padshape(x, drop = TRUE, n=NULL)
shapepart(x)
shapepart_cyclist(cyc,n=NULL)
}
\arguments{
  \item{x}{Object of class \code{cycle} (if not, coerced)}
  \item{cyc}{A cyclist}
  \item{n}{Integer governing the size of the partition assumed, with
    default \code{NULL} meaning to use the largest element}
  \item{drop}{Boolean, with default \code{TRUE} meaning to unlist if
    possible}
  \item{id1}{Boolean, with default \code{TRUE} in function
    \code{shape_cyclist()} meaning that the shape of the identity is
    \dQuote{1} and \code{FALSE} meaning that the shape is \code{NULL}}
}
\value{

  Function \code{shape()} returns a list with elements representing the
  lengths of the component cycles.

  Function \code{shapepart()} returns an object of class
  \code{partition} showing the permutation as a set partition of
  disjoint cycles.
  
}
\author{
Robin K. S. Hankin
}
\note{
  Function \code{shape()} returns the lengths of the cycles in the order
  returned by \code{nicify_cyclist()}, so not necessarily in increasing
  or decreasing order.
}
\seealso{
\code{\link{size}}
}
\examples{
shape(rperm(10,9)) # coerced to cycle



data(megaminx)

shape(megaminx)
jj <- megaminx*megaminx[1]

stopifnot(identical(shape(jj),shape(tidy(jj))))  #tidy() does not change shape

shapepart(rperm(10,5))

shape_cyclist(list(1:4,8:9))
shapepart_cyclist(list(1:4,8:9))

}
