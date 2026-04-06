\name{caydist}
\alias{caydist}
\alias{nmoved}
\alias{nfixed}
\alias{ncyc}
\title{Cayley distance}
\description{Cayley distance and associated metrics for permutations}
\usage{
nmoved(a)
nfixed(a)
ncyc(a, discard1 = TRUE)
caydist(a, b = id)
}
\arguments{
  \item{a, b}{Permutations, coerced to cycle form}
  \item{discard1}{Boolean, with default \code{TRUE} meaning to discard
    length-1 cycles and return the number of cycles with length \eqn{>1}}
}
\value{Generally return non-negative integers}
\details{

  These functions support \code{caydist()}.

  Given a permutation \code{a}, \code{nfixed(a)} returns the number of
  elements mapped to themselves and \code{nmoved(a)} returns the number
  of elements moved [that is, elements not mapped to themselves];
  \code{ncyc(a)} returns the number of cycles, and \code{caydist()}
  returns the minimum number of transpositions needed to convert
  \code{a} to \code{b}.
  
}
\note{

Function \code{ncyc(a, TRUE)} returns the number of nontrivial cycles.
Thus, if \code{a} is \eqn{(12)(567)}, then \code{ncyc(a, TRUE)} returns
2.  If argument \code{discard1} is \code{FALSE}, then length-1 cycles
are not discarded and \code{ncyc(a, FALSE)} returns 4 [because \code{a}
is equivalent to \eqn{(12)(3)(4)(567)}, which has 4 cycles].

The Cayley distance between two permutations \eqn{a} and \eqn{b} is
defined a the least number of swaps to go from \eqn{a} to \eqn{b}.
Operationally:

\deqn{d_\mathrm{Cayley}(a,b) = n-c(a^{-1}b)}
  
where \eqn{c(x)} is \code{ncyc(a, FALSE)}.  Actually it uses
\eqn{d_\mathrm{Cayley}(a,b) = n-c(ab^{-1})} internally, for efficiency
reasons.  This does not matter, for the shape of \eqn{ab} is the same as
the shape of \eqn{ba}: for any permutations \eqn{x,y} we have
\eqn{\operatorname{shape}(x) = \operatorname{shape}(x^{-1})} and
\eqn{\operatorname{shape}(x)=\operatorname{shape}(y^{-1}xy)}.  Then

\deqn{\operatorname{shape}(ab) = \operatorname{shape}(b^{-1}a^{-1}) =
\operatorname{shape}(bb^{-1}a^{-1}b^{-1}) =
\operatorname{shape}(a^{-1}b^{-1}) = \operatorname{shape}(ba).}

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{tidy}}}
\examples{

x <- rperm()
x

nmoved(x)
nfixed(x)
ncyc(x, discard1 = TRUE)
ncyc(x, discard1 = FALSE)

y <- rperm()

caydist(x,y)
all(caydist(x, y) == caydist(y, x))

z <- rperm()
all(caydist(x, z) <= caydist(x, y) + caydist(y, z))

mean(caydist(rperm(100,100)))  # compare 100 - log(100) - gamma ~= 94.82


}
\keyword{symbolmath}
