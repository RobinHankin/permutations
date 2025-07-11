\name{Ops.permutation}
\alias{Ops.permutation}
\alias{Ops.permutations}
\alias{Ops}
\alias{cycle_sum}
\alias{word_equal}
\alias{word_prod}
\alias{word_prod_single}
\alias{permprod}
\alias{cycle_sum_single}
\alias{cycle_power}
\alias{cycle_power_single}
\alias{vps}
\alias{ccps}
\alias{helper}
\alias{cycle_plus_integer_elementwise}
\alias{conjugation}
\title{Arithmetic Ops Group Methods for permutations}
\description{
  Allows arithmetic operators to be used for manipulation of permutation objects
  such as addition, multiplication, division, integer powers, etc.
}
\usage{
\method{Ops}{permutation}(e1, e2)
cycle_power(x,pow)
cycle_power_single(x,pow)
cycle_sum(e1,e2)
cycle_sum_single(c1,c2)
word_equal(e1,e2)
word_prod(e1,e2)
word_prod_single(e1,e2)
permprod(x)
vps(vec,pow)
ccps(n,pow)
helper(e1,e2)
cycle_plus_integer_elementwise(x,y)
conjugation(e1,e2)
}
\arguments{
  \item{x,e1,e2}{Objects of class \dQuote{\code{permutation}}}
  \item{c1,c2}{Objects of class \code{cycle}}
  \item{pow}{Integer vector of powers}
  \item{vec}{In function \code{vps()}, a vector of integers
    corresponding to a cycle}
  \item{n}{In function \code{ccps()}, the integer power to which
    \code{cycle(seq_len(n))} is to be raised; may be positive or
    negative}
  \item{y}{In experimental function
    \code{cycle_plus_integer_elementwise()}, an integer}
}
\details{

  Function \code{Ops.permutation()} dispatches binary arithmetic
  operators (\dQuote{\code{+}}, \dQuote{\code{*}}, \dQuote{\code{/}},
  \dQuote{\code{^}}, and \dQuote{\code{==}}) to the appropriate
  specialist function.

  Multiplication, as in \code{a*b}, is equivalent to
  \code{word_prod(a,b)}; it coerces its arguments to word form (because
  \code{a*b = b[a]}).

  Raising permutations to integer powers, as in \code{a^n}, is
  \code{cycle_power(a,n)}; it coerces \code{a} to cycle form and returns
  a cycle (even if \eqn{n=1}).  Negative and zero values of \code{n}
  operate as expected.  Function \code{cycle_power()} is vectorized; it
  calls \code{cycle_power_single()}, which is not.  This calls
  \code{vps()} (\dQuote{Vector Power Single}), which checks for simple
  cases such as \code{pow=0} or the identity permutation; and function
  \code{vps()} calls function \code{ccps()} which performs the actual
  number-theoretic manipulation to raise a cycle to a power.

  Group-theoretic conjugation is implemented: in package idiom,
  \code{a^b} gives \code{inverse(b)*a*b}.  The notation is motivated by
  the identities \code{x^(yz)=(x^y)^z} and \code{(xy)^z=x^z*y^z} [or
  \eqn{x^{yz}=(x^y)^z}{omitted} and \eqn{(xy)^z=x^zy^z}{omitted}].
  Internally, \code{conjugation()} is called.  The concept of conjugate
  \emph{permutations} [that is, permutations with the same
  \code{shape()}] is discussed at \link{conjugate}.

  The caret \dQuote{\code{^}} also indicates group action [there is some
  discussion at \code{as.function.permutation.Rd}].  Given an integer
  \code{n} and a permutation \code{g}, idiom \code{n^g} returns the
  group action of \code{g} acting on \code{n}.  The notation is
  motivated by the identity \code{n^(ab) == (n^a)^b}.

  The \dfn{sum} of two permutations \code{a} and \code{b}, as in
  \code{a+b}, is defined if the cycle representations of the addends are
  disjoint.  The sum is defined as the permutation given by juxtaposing
  the cycles of \code{a} with those of \code{b}.  Note that this
  operation is commutative.  If \code{a} and \code{b} do not have
  disjoint cycle representations, an error is returned.  If \code{a+b}
  is defined we have

  \code{a^n + b^n == (a+b)^n == a^n * b^n == (a*b)^n}

  for any \eqn{n\in\mathbb{Z}}{omitted}.  Using \dQuote{\code{+}} in
  this way is useful if you want to guarantee that two permutations
  commute (NB: permutation \code{a} commutes with \code{a^i} for
  \code{i} any integer, and in particular \code{a} commutes with itself.
  But \code{a+a} returns an error: the operation checks for
  disjointness, not commutativity).

  Permutation \dQuote{division}, as in \code{a/b}, is
  \code{a*inverse(b)}.  Note that \code{a/b*c} is evaluated left to
  right so is equivalent to \code{a*inverse(b)*c}.  See note.

  Function \code{helper()} sorts out recycling for binary functions, the
  behaviour of which is inherited from \code{cbind()}, which also
  handles the names of the returned permutation.

  Experimental functionality is provided to define the \dQuote{sum} of a
  permutation and an integer.  If \eqn{x} is a permutation in cycle
  form with \eqn{x=(abc)}, say, and \eqn{n} an integer, then
  \eqn{x+n=(a+n,b+n,c+n)}: each element of each cycle of \eqn{x}
  is increased by \eqn{n}.  Note that this has associativity
  consequences.  For example, \code{x+(x+n)} might be defined but not
  \code{(x+x)+n}, as the two \dQuote{\code{+}} operators have different
  interpretations.  Distributivity is similarly broken (see the
  examples).  Package idiom includes \code{x-n} [defined as \code{x +
  (-n)}] and \code{n+x} but not \code{n-x} as inverses are defined
  multiplicatively.  The implementation is vectorized.

}

\value{
  None of these functions are really intended for the end user:
  use the ops as shown in the examples section.
}
\note{
  The class of the returned object is the appropriate one.

  Unary operators to invert a permutation are problematic in the
  package.  I do not like using \dQuote{\code{id/x}} to represent a
  permutation inverse: the idiom introduces an utterly redundant
  object (\dQuote{\code{id}}), and forces the use of a binary operator
  where a unary operator is needed.  Similar comments apply to
  \dQuote{\code{x^-1}}, which again introduces a redundant object
  (\code{-1}) and uses a binary operator.

  Currently, \dQuote{\code{-x}} returns the multiplicative inverse of
  \code{x}, but this is not entirely satisfactory either, as it uses
  additive notation: the rest of the package uses multiplicative
  notation.  Thus \code{x*-x == id}, which looks a little odd but OTOH
  noone has a problem with \code{x^-1} for inverses.

  I would like to follow \proglang{APL} and use \dQuote{\code{/x}},
  but this does not seem to be possible in \proglang{R}.  The natural
  unary operator would be the exclamation mark \dQuote{\code{!x}}.
  However, redefining the exclamation mark to give permutation
  inverses, while possible, is not desirable because its precedence is
  too low.  One would like \code{!x*y} to return \code{inverse(x)*y}
  but instead standard precedence rules means that it returns
  \code{inverse(x*y)}.  Earlier versions of the package interpreted
  \code{!x} as \code{inverse(x)}, but it was a disaster: to implement
  the commutator \eqn{[x,y]=x^{-1}y^{-1}xy}{[x,y]=x^(-1)y^(-1)xy},
  for example, one would like to use \code{!x*!y*x*y}, but this is
  interpreted as \code{!(x*(!y*(x*y)))}; one has to use
  \code{(!x)*(!y)*x*y}.  I found myself having to use heaps of
  brackets everywhere.  This caused such severe cognitive dissonance
  that I removed exclamation mark for inverses from the package.  I
  might reinstate it in the future.  There does not appear to be a way
  to define a new unary operator due to the construction of the
  parser.

}
\author{Robin K. S. Hankin}
\examples{


x <- rperm(10,9) # word form
y <- rperm(10,9) # word form

x*y  # products are given in word form but the print method coerces to cycle form
print_word(x*y)

x^5  # powers are given in cycle form

x^as.cycle(1:5)  # conjugation (not integer power!); coerced to word.

x*inverse(x) == id  # all TRUE


# the 'sum' of two permutations is defined if their cycles are disjoint:
as.cycle(1:4) + as.cycle(7:9)

data(megaminx)
megaminx[1] + megaminx[7:12]

rperm() + 100

z <- cyc_len(4)
z
z+100
z + 0:5
(z + 0:5)*z

w <- cyc_len(7) + 1
(w+1)*(w-1)

}
\keyword{symbolmath}
