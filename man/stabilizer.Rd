\name{stabilizer}
\alias{stabilizer}
\alias{stabilizes}
\alias{stabilized}
\alias{is.stabilizer}
\title{Stabilizer of a permutation}
\description{

  A permutation \eqn{\phi} is said to \dfn{stabilize} a set \eqn{S} if
  the image of \eqn{S} under {\eqn{\phi}} is a subset of \eqn{S}, that
  is, if \eqn{\left\lbrace\left. \phi(s)\right|s\in S
  \right\rbrace\subseteq S}{omitted}.  This may be written
  \eqn{\phi(S)\subseteq S}{omitted}.  Given a vector \eqn{G} of
  permutations, we define the \dfn{stabilizer} of \eqn{S} in \eqn{G} to
  be those elements of \eqn{G} that stabilize \eqn{S}.

  Given \eqn{S}, it is clear that the identity permutation stabilizes
  \eqn{S}, and if \eqn{\phi,\psi} stabilize \eqn{S}, then so do
  \eqn{\phi\psi}{omitted} and \eqn{\psi\phi}{omitted}, and so does
  \eqn{\phi^{-1}}{omitted} [\eqn{\phi} is a bijection from \eqn{S} to
  itself].

}
\usage{
stabilizes(a,s)
stabilizer(a,s)
}
\arguments{
  \item{a}{Permutation (coerced to class \code{cycle})}
  \item{s}{Subset of \eqn{\left\lbrace
      1,\ldots,n\right\rbrace}{omitted}, to be stabilized}
}
\value{

A boolean vector [\code{stabilizes()}] or a vector of permutations in
cycle form [\code{stabilizer()}]

}
\note{

The identity permutation stabilizes any set.

Functions \code{stabilizes()} and \code{stabilizer()} coerce their
arguments to cycle form.

}
\author{Robin K. S. Hankin}
\examples{

a <- rperm(200)
stabilizer(a,3:4)

all_perms_shape(c(1,1,2,2)) |> stabilizer(2:3)  # some include (23), some don't


}
