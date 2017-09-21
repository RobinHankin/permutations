\name{fbin}
\alias{fbin}
\alias{fbin_single}
\alias{fbin_inv}
\alias{standard}
\alias{standard_cyclist}
\title{
  The fundamental bijection
}
\description{
  Stanley defines the \dfn{fundamental bijection} on page 30. 

Given \eqn{w=(14)(2)(375)(6)}, Stanley writes it in standard form
(specifically: each cycle is written with its largest element first;
cycles are written in increasing order of their largest element).  Thus
we obtain \eqn{(2)(41)(6)(753)}.

Then we obtain \eqn{w^*}{w*} from \eqn{w} by writing it in standard form
an erasing the parentheses (that is, viewing the numbers as a
\emph{word}); here \eqn{w^*=2416753}{w* = 2416753}.

Given this, \eqn{w} may be recoverd by inserting a left parenthesis
preceding every left-to-right maximum, and right parentheses where
appropriate.

}
\usage{
standard(cyc,n=NULL)
standard_cyclist(x,n=NULL)
fbin_single(vec)
fbin(W)
fbin_inv(cyc)
}

\arguments{
  \item{vec}{In function \code{fbin_single()}, an integer vector}
  \item{W}{In functions \code{fbin()} and \code{fbin_inv()}, an object
    of class permutation, coerced to word and cycle form respectively}
  \item{cyc}{In functions \code{fbin_single()} and \code{standard()},
    permutation object coerced to cycle form}
  \item{n}{In function \code{standard()} and \code{standard_cyclist()},
    size of the partition to assume, with default \code{NULL} meaning to
    use the largest element of any cycle}
  \item{x}{In function \code{standard_cyclist()}, a cyclist}
}
\details{

  The user-friendly functions are \code{fbin()} and \code{fbin_inv()}
  which perform Stanley's \dQuote{fundamental bijection}.  Function
  \code{fbin()} takes a word object and returns a cycle; function
  \code{fbin_inv()} takes a cycle and returns a word.

  The other functions are low-level helper functions that are not really
  intended for the user (except possibly \code{standard()}, which puts a
  cycle object in standard order in list form).
}
\references{
  R. P. Stanley 2011 \emph{Enumerative Combinatorics}
}
\author{
Robin K. S. Hankin
}
\seealso{\code{\link{nicify_cyclist}}}
\examples{

# Stanley's example w:
standard(cycle(list(list(c(1,4),c(3,7,5)))))

w_hat <- c(2,4,1,6,7,5,3)

fbin(w_hat)
fbin_inv(fbin(w_hat))


x <- rperm(40,9)
stopifnot(all(fbin(fbin_inv(x))==x))
stopifnot(all(fbin_inv(fbin(x))==x))

}
