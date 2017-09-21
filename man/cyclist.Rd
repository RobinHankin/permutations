\name{cyclist}
\alias{cyclist}
\alias{vec2cyclist_single}
\alias{vec2cyclist_single_cpp}
\alias{char2cyclist_single}
\alias{cyclist2word_single}
\alias{nicify_cyclist}
\alias{nicify}
\alias{remove_length_one}
\title{
details of cyclists
}
\description{
  Various functionality to deal with cyclists 
}
\usage{
vec2cyclist_single(p)
vec2cyclist_single_cpp(p)
remove_length_one(x)
cyclist2word_single(cyc,n)
nicify_cyclist(x,rm1=TRUE, smallest_first=TRUE)
}
\arguments{
  \item{p}{Integer vector, interpreted as a word}
  \item{x,cyc}{A cyclist}
  \item{n}{In function \code{cycle2word_single()}, the size of
    the permutation to induce}
  \item{rm1,smallest_first}{In function \code{nicify_cyclist()},
    Boolean, governing whether or not to remove length-1 cycles, and
    whether or not to place the smallest element in each cycle first
    (non-default values are used by \code{standard_cyclist()})}
}
\details{

A \dfn{cyclist} is an object corresponding to a permutation P.  It is a
list with elements that are integer vectors corresponding to the cycles
of P.  This object is informally known as a cyclist, but there is no S3
class corresponding to it.

An object of S3 class \dfn{cycle} is a (possibly named) list of
cyclists.  NB: there is an unavoidable notational clash here.  When
considering a single permutation, \dQuote{cycle} means group-theoretic
cycle; when considering R objects, \dQuote{cycle} means \dQuote{an R
object of class \dfn{cycle} whose elements are permutations written in
cycle form}.

The elements of a cyclist are the disjoint group-theoretic cycles.  Note the
redundancies inherent: firstly, because the cycles commute, their order
is immaterial (and a list is ordered); and secondly, the cycles
themselves are invariant under cyclic permutation.  Heigh ho.

A cyclist may be poorly formed in a number of ways: the cycles may
include repeats, or contain elements which are common to more than one
cycle.  Such problems are detected by \code{cycle.valid()}.  Also, there
are less serious problems: the cycles may include length-one cycles; the
cycles may start with an element that is not the smallest.  These issues
are dealt with by \code{nicify_cyclist()}.

\itemize{

  \item Function \code{nicify_cyclist()} takes a cyclist and puts it in
  a nice form but does not alter the permutation.  It takes a cyclist
  and removes length-one cycles; then orders each cycle so that the
  smallest element appears first (that is, it changes \code{(523)} to
  \code{(235)}).  It then orders the cycles by the smallest element.

  \item Function \code{remove_length_one()} takes a cyclist and removes
  length-one cycles from it.

  \item Function \code{vec2cyclist_single()} takes a vector of integers,
  interpreted as a word, and converts it into a cyclist.  Length-one
  cycles are discarded.

  \item Function \code{vec2cyclist_single_cpp()} is a placeholder for a
  function that is not yet written.

  \item Function \code{cyclist2word_single()} takes a cyclist and
  returns a vector corresponding to a single word.  This function is not
  intended for everyday use; function \code{cycle2word()} is much more
  user-friendly.
  
  \item Function \code{char2cyclist_single()} takes a character string
  like \dQuote{\code{(342)(19)}} and turns it into a cyclist, in this
  case \code{list(c(3,4,2),c(1,9))}.  This function returns a cyclist
  which is not necessarily canonicalized: it might have length-one
  cycles, and the cycles themselves might start with the wrong number or
  be incorrectly ordered.  It attempts to deal with absence of commas in
  a sensible way, so \dQuote{\code{(18,19)(2,5)}} is dealt with
  appropriately too.  The function is insensitive to spaces.  Also, one
  can give it an argument which does not correspond to a cycle object,
  eg \code{char2cyclist_single("(94)(32)(19)(1)")} (in which \dQuote{9}
  is repeated).  The function does not return an error, but to catch
  this kind of problem use \code{char2cycle()} which calls the validity
  checks.

  The user should use \code{char2cycle()} which executes validity checks
  and coerces to a cycle object.
}
}

\author{
Robin K. S. Hankin
}
\seealso{
\code{\link{as.cycle}},\code{\link{fbin}}
}
\examples{
vec2cyclist_single(c(7,9,3,5,8,6,1,4,2))

char2cyclist_single("(342)(19)")

nicify_cyclist(list(c(4, 6), c(7), c(2, 5, 1), c(8, 3)))
nicify_cyclist(list(c(4, 6), c(7), c(2, 5, 1), c(8, 3)),rm1=TRUE)


cyclist2word_single(list(c(1,4,3),c(7,8)))


}
