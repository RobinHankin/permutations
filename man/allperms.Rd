\name{allperms}
\alias{allperms}
\alias{allcyc}
\alias{allcycles}
\title{All permutations of a given size and all cycles of a given length}
\description{\loadmathjax
Function \code{allperms()} returns all \mjseqn{n} factorial permutations
of a set.  Function \code{allcyc()} returns all \mjseqn{(n-1)!}
permutations comprising a single cycle of length \mjseqn{n}.
}
\usage{
allperms(n)
allcyc(n)
}
\arguments{
  \item{n}{The size of the set, integer}
}
\details{
The function is very basic (the idiom is \code{word(t(partitions::perms(n)))}) but is here for completeness.
}
\author{Robin K. S. Hankin}
\note{Function \code{allcyc()} is taken directly from the
  \dQuote{fine-tuned} algorithm of M. C. Er 1989 \dQuote{Efficient
  enumeration of cyclic permutations in situ}.  \emph{International
  Journal of Computer Mathematics}, volume 29:2-4, pp121-129.  It should
  really be implemented in \proglang{C} as part of the \pkg{partitions}
  package but I have not yet got round to this.
}
\examples{

as.cycle(allperms(5))

allcyc(5)

}
