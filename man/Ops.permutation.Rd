\name{Ops.permutation}
\alias{Ops.permutation}
\alias{Ops.permutations}
\alias{Ops}
\alias{cycle_sum}
\alias{group_action}
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
group_action(e1,e2)
word_equal(e1,e2)
word_prod(e1,e2)
word_prod_single(e1,e2)
permprod(x)
vps(vec,pow)
ccps(n,pow)
helper(e1,e2)
}
\arguments{
  \item{x,e1,e2}{Objects of class \dQuote{\code{permutation}}}
  \item{c1,c2}{Objects of class \code{cycle}}
  \item{pow}{Integer vector of powers}
  \item{vec}{In function \code{vps()}, a vector of integers
    corresponding to a cycle}
  \item{n}{In function \code{ccps()}, the integer power to which
    \code{cycle(seq_len(n))} is to be raised; may be positive or
    negative.}
  }
\details{

  The function \code{Ops.permutation()} passes binary arithmetic
  operators (\dQuote{\code{+}}, \dQuote{\code{*}}, \dQuote{\code{/}},
  \dQuote{\code{^}}, and \dQuote{\code{==}}) to the appropriate
  specialist function.

  Multiplication, as in \code{a*b}, is effectively
  \code{word_prod(a,b)}; it coerces its arguments to word form (because
  \code{a*b = b[a]}).

  Raising permutations to integer powers, as in \code{a^n}, is
  \code{cycle_power(a,n)}; it coerces \code{a} to cycle form and returns
  a cycle. Negative and zero values of \code{n} operate as expected.
  Function \code{cycle_power()} is vectorized; it calls
  \code{cycle_power_single()}, which is not. This calls \code{vps()}
  (\dQuote{Vector Power Single}), which checks for simple cases such as
  \code{pow=0} or the identity permutation; and function \code{vps()}
  calls function \code{ccps()} which performs the actual
  number-theoretic manipulation to raise a cycle to a power.

  Raising a permutation to the power of another permutation, as in
  \code{a^b}, is idiom for \code{inverse(b)*a*b}, sometimes known as
  \dfn{group action}; the notation is motivated by the identities
  \code{x^(yz)=(x^y)^z} and \code{(xy)^z=x^z*y^z}.

  Permutation addition, as in \code{a+b}, is defined if the cycle
  representations of the addends are disjoint.  The sum is defined as
  the permutation given by juxtaposing the cycles of \code{a} with those
  of \code{b}.  Note that this operation is commutative.  If \code{a}
  and \code{b} do not have disjoint cycle representations, an error is
  returned.  This is useful if you want to guarantee that two
  permutations commute (NB: permutation \code{a} commutes with
  \code{a^i} for \code{i} any integer, and in particular \code{a}
  commutes with itself.  But \code{a+a} returns an error: the operation
  checks for disjointness, not commutativity).

  Permutation \dQuote{division}, as in \code{a/b}, is
  \code{a*inverse(b)}.  Note that \code{a/b*c} is evaluated left to
  right so is equivalent to \code{a*inverse(b)*c}.  See note.
  
  Function \code{helper()} sorts out recycling for binary functions, the
  behaviour of which is inherited from \code{cbind()}, which also
  handles the names of the returned permutation.

}

\value{
  None of these functions are really intended for the end user:
  use the ops as shown in the examples section.
}
\note{
  The class of the returned object is the appropriate one.

  It would be nice to define a unary operator which inverted a
  permutation.  I do not like \dQuote{\code{id/x}} to represent a
  permutation inverse: the idiom introduces an utterly redundant object
  (\dQuote{\code{id}}), and forces the use of a binary operator where a
  unary operator is needed.
  
  The natural unary operator would be the exclamation mark, \code{!x}.
  However, redefining the exclamation mark to give permutation inverses,
  while possible, is not desirable because its precedence is too low.
  One would like \code{!x*y} to return \code{inverse(x)*y} but instead
  standard precendence rules means that it returns \code{inverse(x*y)}.
  This caused such severe cognitive dissonance that I removed it.
  
  There does not appear to be a way to define a new unary operator due
  to the construction of the parser.
  
}
\author{
  Robin K. S. Hankin
}
\examples{
x <- rperm(20,9) # word form
y <- rperm(20,9) # word form

x*y  # word form

x^5  # coerced to cycle form

x^as.cycle(1:5)  # group action; coerced to word.

x*inverse(x) == id  # all TRUE



# the 'sum' of two permutations is defined if their cycles are disjoint:
as.cycle(1:4) + as.cycle(7:9)

data(megaminx)
megaminx[1] + megaminx[7:12] 



}
\keyword{symbolmath}
