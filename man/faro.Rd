\name{faro}
\alias{faro}
\alias{faro_gen}
\alias{riffle}
\alias{shuffle}
\title{Faro shuffles}
\description{

A \dfn{faro shuffle}, \code{faro()},is a permutation of a deck of
\eqn{2n} cards.  The cards are split into two packs, \code{1:n} and
\code{(n+1):2n}, and interleaved: cards are taken alternately from top
of each pack and placed face down on the table.  A \dfn{faro
out-shuffle} takes the first card from \code{1:n} and a \dfn{faro
in-shuffle} takes the first card from \code{(n+1):(2*n)}.

A \dfn{generalized faro shuffle}, \code{faro_gen()}, splits the pack
into \code{m} equal parts and applies the same permutation (\code{p1})
to each pack, and then permutes the packs with \code{p2}, before
interleaving.  The interleaving itself is simply a matrix transpose; it
is possible to omit this step by passing \code{interleave=FALSE}.

}
\usage{
faro(n, out = TRUE)
faro_gen(n,m,p1=id,p2=id,interleave=TRUE)
}
\arguments{
  \item{n}{Number of cards in each pack}
  \item{m}{Number of packs}
  \item{p1,p2}{Permutations for cards and packs respectively, coerced to
    word form}
  \item{interleave}{Boolean, with default \code{TRUE} meaning to
    actually perform the interleaving and \code{FALSE} meaning not to}
  \item{out}{Boolean, with default \code{TRUE} meaning to return an
    out-shuffle and \code{FALSE} meaning to return an in-shuffle}
}
\value{Returns a permutation in word form}
\author{Robin K. S. Hankin}
\examples{
faro(4)
faro(4,FALSE)

## Do a perfect riffle shuffle 52 times, return pack to original order:
permorder(faro(26))

## 15 cards, split into 5 packs of 3, cyclically permute each pack:
faro_gen(3, 5, p1=cyc_len(3), interleave=FALSE)

## 15 cards, split into 5 packs of 3, permute the packs as (13542):
print_word(faro_gen(3, 5, p2=as.cycle("(13542)"), interleave=FALSE))


sapply(seq_len(10),function(n){permorder(faro(n,FALSE))}) # OEIS  A002326

plot(as.vector(as.word(faro(10))),type='b')
plot(as.vector(faro_gen(8,5,p1=cyc_len(8)^2,interleave=FALSE)))


}
