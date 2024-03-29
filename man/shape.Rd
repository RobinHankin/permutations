\name{shape}
\alias{shape}
\alias{padshape}
\alias{shape_cyclist}
\alias{shapepart}
\alias{cycletype}
\alias{cycle_type}
\alias{shapepart_cyclist}
\title{Shape of a permutation}
\description{
Returns the shape of a permutation.  If given a word, it coerces to
cycle form.
}
\usage{
shape(x, drop = TRUE,id1 = TRUE,decreasing = FALSE)
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
  \item{decreasing}{In function \code{shape()}, Boolean with default
  \code{FALSE} meaning to return the cycle lengths in the order given by
  \code{nicify_cyclist()} and \code{TRUE} meaning to sort in decreasing
  order}
}

\value{
  Function \code{shape()} returns a list with elements representing the
  lengths of the component cycles.

  Function \code{shapepart()} returns an object of class
  \code{partition} showing the permutation as a set partition of
  disjoint cycles.

  Function \code{padshape()} returns a list of shapes but padded with
  ones so the total is the size of the permutation.

 \code{shapepart_cyclist()} and \code{shapepart_cyclist()} are low-level
  helper functions.
}
\author{Robin K. S. Hankin}
\note{
  What I call \dQuote{shape}, others call the \dQuote{cycle type}, so
  you will sometimes see \dQuote{cycle type determines conjugacy class}
  as a theorem.
}
\seealso{\code{\link{size}},\code{\link{conjugate}}}
\examples{

jj <- as.cycle(c("123","","(12)(34)","12345"))
jj
shape(jj)

shape(rperm(10,9)) # coerced to cycle

a <- rperm()
identical(shape(a,dec=TRUE),shape(a^cyc_len(2),dec=TRUE))


data(megaminx)
shape(megaminx)

jj <- megaminx*megaminx[1]
identical(shape(jj),shape(tidy(jj)))  #tidy() does not change shape


allperms(3)
shapepart(allperms(3))
shapepart(rperm(10,5))

shape_cyclist(list(1:4,8:9))
shapepart_cyclist(list(1:4,8:9))

}
