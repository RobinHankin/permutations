\name{allperms}
\alias{allperms}
\alias{allcyc}
\alias{allcycn}
\alias{allcycles}
\title{All permutations of a given size and all cycles of a given length}

\description{\loadmathjax

Given a non-negative integer \code{n}, \code{allperms(n)} returns all
\mjseqn{n!} permutations of a set of \mjseqn{n} elements, here
\mjeqn{[n]=\left\lbrace1,2,\ldots,n\right\rbrace}{omitted}.

Function \code{allcycn()} returns all \mjseqn{(n-1)!}  permutations of
\mjseqn{[n]} comprising a single cycle of length \mjseqn{n}.  Given a
set \mjseqn{s}, \code{allcyc(s)} returns all single-cycle permutations
of \mjseqn{s}.  If \mjseqn{s} has a repeated value, it returns an opaque
error message.

}

\usage{
allperms(n)
allcycn(n)
allcyc(s)
}
\arguments{
  \item{s}{A set of integers}
  \item{n}{The size of the permutation}
}
\details{
Function \code{allperms()} is very basic (the idiom is
\code{word(t(partitions::perms(n)))}) but is here for completeness.

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{allperms}}}
\references{M. C. Er 1989 \dQuote{Efficient
  enumeration of cyclic permutations in situ}.  \emph{International
  Journal of Computer Mathematics}, volume 29:2-4, pp121-129.
}
\note{Function \code{allcyc()} is taken directly from Er's
  \dQuote{fine-tuned} algorithm.  It should really be implemented in
  \proglang{C} as part of the \pkg{partitions} package but I have not
  yet got round to this.
}
\examples{

allperms(5)

allcycn(5)

allcyc(c(5,6,8,3))

}
