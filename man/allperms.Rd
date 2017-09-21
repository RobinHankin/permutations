\name{allperms}
\alias{allperms}
\title{
All permutations of a given size
}
\description{
Returns all n factorial permutations of a set
	}
\usage{
allperms(n)
}
\arguments{
  \item{n}{The size of the set, integer}
}
\details{

The function is very basic (the idiom is \code{word(t(partitions::perms(n)))}) but is here for completeness.
}

\author{
Robin K. S. Hankin
}
\examples{

as.cycle(allperms(5))


}
