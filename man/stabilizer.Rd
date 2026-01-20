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

  Function \code{stabilizes(G,S)} returns a Boolean vector \code{V} with
  \code{V[i]} being \code{TRUE} if \code{G[i]} stabilizes \code{S} and
  \code{FALSE} otherwise.  Function \code{stabilizer(G,S)} returns
  \code{G[stabilizes(G,S)]}.

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

  Note that if \eqn{\phi} stabilizes \eqn{S}, then the elements of
  \code{S} may be permuted by \eqn{\phi}; thus some elements of
  \code{S[i]^stabilizer(G,S)} [equivalently,
  \code{as.function(stabilizer(G,S))(S[i])}] may not be equal to
  \code{S[i]}.

}
\author{Robin K. S. Hankin}
\examples{

a <- rperm(200)
s <- stabilizer(a, 3:4)

3^s   # all these in {3,4}

all_perms_shape(c(1,1,2,2)) |> stabilizer(2:3)  # some include (23), some don't


}
