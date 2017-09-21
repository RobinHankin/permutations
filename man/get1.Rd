\name{get1}
\alias{get1}
\alias{get_cyc}
\title{
Retrieve particular cycles or components of cycles
}
\description{
Given an object of class \code{cycle}, function \code{get1()} returns a
representative of each of the disjoint cycles in the object's elements.
Function \code{get_cyc()} returns the cycle containing a specific element.
}
\usage{
get1(x,drop=TRUE)
get_cyc(x,elt)
}
\arguments{
  \item{x}{permutation object (coerced to \code{cycle} class)}
  \item{drop}{In function \code{get1()}, argument \code{drop} controls
    the behaviour if \code{x} is length 1.  If \code{drop} is
    \code{TRUE}, then a vector of representative elements is returned;
    if \code{FALSE}, then a list with one vector element is returned}
  \item{elt}{Length-one vector interpreted as a permutation object}
}
\author{
Robin K. S. Hankin
}
\examples{
data(megaminx)
get1(megaminx)
get1(megaminx[1])
get1(megaminx[1],drop=TRUE)

get_cyc(megaminx,11) 

}
