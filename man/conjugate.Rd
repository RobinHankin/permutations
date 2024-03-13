\name{conjugate}
\alias{conjugate}
\alias{are_conjugate}
\alias{are_conjugate}
\alias{are_conjugate_single}
\alias{\%~\%}
\alias{\%~\%.permutation}
\title{
Are two permutations conjugate?
}
\description{\loadmathjax
Returns \code{TRUE} if two permutations are conjugate and \code{FALSE}
otherwise.
}
\usage{
are_conjugate(x, y)
are_conjugate_single(a,b)
}
\arguments{
  \item{x,y,a,b}{Objects of class permutation, coerced to cycle form}
}
\details{
  Two permutations are conjugate if and only if they have the same shape.
  Function \code{are_conjugate()} is vectorized and user-friendly;
  function \code{are_conjugate_single()} is lower-level and operates
  only on length-one permutations.

  The reason  that \code{are_conjugate_single()} is a separate function
  and not bundled inside \code{are_conjugate()} is that dealing with the
  identity permutation is a pain in the arse.
}
\value{Returns a vector of Booleans}
\author{Robin K. S. Hankin}
\note{
The functionality detects conjugateness by comparing the shapes of two
permutations; permutations are coerced to cycle form because function
\code{shape()} does.

The group action of conjugation, that is \mjseqn{x^y} or \code{y^-1 x
 y}, is documented at \link{conjugation}.

\preformatted{ are_conjugate(x,conjugate(x^y))  }

is always \code{TRUE}.

}

\seealso{\code{\link{conjugation}},\code{\link{shape}}}
\examples{

as.cycle("(123)(45)") \%~\% as.cycle("(89)(712)")  # same shape
as.cycle("(123)(45)") \%~\% as.cycle("(89)(7124)") # different shape

are_conjugate(rperm(20,3),rperm(20,3))

rperm(20,3) \%~\% as.cycle(1:3)

z <- rperm(300,4)
stopifnot(all(are_conjugate(z,id)==is.id(z)))

data(megaminx)
stopifnot(all(are_conjugate(megaminx,megaminx^as.cycle(sample(129)))))
}
