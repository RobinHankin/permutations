\name{permutation}
\alias{permutation}
\alias{is.permutation}
\alias{cycle}
\alias{as.cycle}
\alias{is.cycle}
\alias{word}
\alias{as.word}
\alias{is.word}
\alias{cycle2word}
\alias{char2cycle}
\alias{cyc_len}
\alias{as.matrix}
\alias{as.matrix.word}
\title{
Functions to create and coerce word objects and cycle objects
}
\description{
Functions to create permutation objects.  \code{permutation} is a
virtual class. 
}
\usage{
word(M)
is.permutation(x)
cycle(x)
is.word(x)
is.cycle(x)
as.word(x,n=NULL)
as.cycle(x)
cycle2word(x,n=NULL)
char2cycle(char)
cyc_len(n)
\method{as.matrix}{word}(x,...)
}
\arguments{
  \item{M}{In function \code{word()}, a matrix with rows corresponding
    to permutations in word form}
  \item{x}{See details}
  \item{n}{In functions \code{as.word()} and \code{cycle2word()}, the
    size of the word to return; in function \code{cyc_len()}, the length
  of the cycle to return}
  \item{char}{In function \code{char2cycle()} a character vector which
    is coerced to a cycle object}
  \item{...}{Further arguments passed to \code{as.matrix()}}
}
\details{

Functions \code{word()} and \code{cycle()} are rather formal functions
which make no attempt to coerce their arguments into sensible forms.
The user should use \code{as.word()} and \code{as.cycle()}, which are
much more user-friendly.

Functions \code{word()} and \code{cycle()} are the only functions in the
package which assign class \code{word} or \code{cycle} to an
object.   

A \emph{word} is a matrix whose rows correspond to permutations in word
format.  

A \dfn{cycle} is a list whose elements correspond to permutations in
cycle form.  A \code{cycle} object comprises elements which are
informally dubbed \sQuote{cyclists}.  A cyclist is a list of integer
vectors corresponding to the cycles of the permutation.

Function  \code{cycle2word()} converts cycle objects to word objects.

Function \code{cyc_len()} is a convenience wrapper for
\code{as.cycle(seq_len(n))}.

It is a very common error (at least, it is for me) to use \code{cycle()}
when you meant \code{as.cycle()}.

The print method is sensitive to the value of option
\sQuote{\code{print_word_as_cycle}}, documented at \code{print.Rd}.

}
\value{
Returns a \code{cycle} object or a \code{word object}
}
\author{Robin K. S. Hankin}
\seealso{
\code{\link{cyclist}}
}
\examples{
word(matrix(1:8,7,8))    # default print method displays cycle form


cycle(list(list(c(1,8,2),c(3,6)),list(1:2, 4:8)))

char2cycle(c("(1,4)(6,7)","(3,4,2)(8,19)", "(56)","(12345)(78)","(78)"))

jj <- c(4,2,3,1)

as.word(jj)
as.cycle(jj)

as.cycle(1:2)*as.cycle(1:8) == as.cycle(1:8)*as.cycle(1:2)  # FALSE!

x <- rperm(10,7)
y <- rperm(10,7)
as.cycle(commutator(x,y))

cycle(sapply(seq_len(9),cyc_len))

}
\keyword{symbmath}
