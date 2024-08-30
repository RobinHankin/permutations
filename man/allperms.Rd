\name{allperms}
\alias{allperms}
\alias{allcyc}
\alias{allcycn}
\alias{allcycles}
\alias{allpermslike}
\alias{some_perms_shape}
\alias{all_cyclic_shuffles}
\alias{all_perms_shape}
\title{All permutations with given characteristics}
\description{

  Functionality to enumerate permutations given different
  characteristics.  In the following, \code{n} is assumed to be a
  non-negative integer.  Permutations, in general, are coerced to cycle
  form.

  \itemize{
    \item\code{allperms(n)} returns all \eqn{n!} permutations
    of \eqn{[n]}.

    \item\code{allcycn()} returns all \eqn{(n-1)!}  permutations of
    \eqn{[n]} comprising a single cycle of length \eqn{n}.

    \item\code{allcyc(s)} returns all single-cycle permutations of set
    \eqn{s}.  If \eqn{s} has a repeated value, an opaque error
    message is returned.

    \item\code{allpermslike(o)} takes a length-one vector \code{o} of
    permutations and returns a vector comprising permutations with the
    same shape and cycle sets as it argument.

    \item\code{some_perms_shape(part)} takes an integer partition
    \code{part}, as in a set of non-negative integers, and returns a
    vector comprising every permutation of size \code{sum(part)} with
    shape \code{part} that has its cycles in increasing order.

    \item\code{all_cyclic_shuffles(u)} takes a permutation \code{u} and
    returns a vector comprising of all permutations with the same shape
    and cycle sets.  It is vectorized so that argument \code{u} may be a
    vector of permutations.

    \item\code{all_perms_shape(p)} takes a permutation \code{p} and
    returns a vector of all permutations of size \code{sum(p)} and shape
    \code{p}.
  }
}
\usage{
allperms(n)
allcycn(n)
allcyc(s)
allpermslike(o)
some_perms_shape(shape)
all_cyclic_shuffles(o)
all_perms_shape(shape)
}
\arguments{
  \item{shape}{A set of strictly positive integers, interpreted as the
    shape of a partition}
  \item{s}{A set of strictly positive integers, interpreted as a set on
    which permutations are defined}
  \item{n}{The size of the permutation}
  \item{o}{A vector of permutations, coerced to cycle form.  Function
    \code{allpermslike()} considers only the first element}
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

allpermslike(as.cycle("(12)(34)(5678)"))
allpermslike(rgivenshape(c(1,1,3,4)))
some_perms_shape(c(2,2,4))
all_cyclic_shuffles(cyc_len(3:5))

all_perms_shape(c(2,2,3))
all_perms_shape(c(2,2,1,1))  # size 6 (length-1 cycles vanish)
}
