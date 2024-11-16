\name{as.function.permutation}
\alias{as.function.permutation}
\alias{as.function.word}
\alias{as.function.cycle}
\alias{as.function}
\title{
Coerce a permutation to a function
}
\description{

Coerce a permutation to an executable function with domain
\eqn{\left\lbrace 1,\ldots,n\right\rbrace}{1...n}.

The resulting function is vectorised.

}
\usage{
\method{as.function}{permutation}(x, ...)
}
\arguments{
  \item{x}{permutation}
  \item{\dots}{further arguments (currently ignored)}
}
\details{

This functionality is sometimes known as \emph{group action}.  Formally,
suppose we have a set \eqn{X}, a group \eqn{G}, and a function
\eqn{\alpha\colon X\times G\longrightarrow X}{omitted}.  Then we say
\eqn{\alpha}{omitted} is a \dfn{group action} if
\eqn{\alpha(x,e)=e}{omitted} and
\eqn{\alpha(\alpha(x,g),h)=\alpha(x,gh)}{omitted}.  Writing \eqn{x\cdot
g}{x.g} for \eqn{\alpha(x,g)}{omitted} we have \eqn{x\cdot e=x}{x.e=x}
and \eqn{(x\cdot g)\cdot h=x\cdot(gh)}{(x.g).h=x.(gh)}.  The dot may be
omitted giving us \eqn{(xg)h=x(gh)}{(xg)h=x(gh)}.  If the group is a
permutation group on \eqn{X}, then it is natural to choose
\eqn{\alpha(x,g)=g(x)}{omitted}.

In package idiom, given permutation \code{g} [considered as an element
of the symmetric group \eqn{S_n}], \code{as.function(g)} returns the
function with domain \eqn{\left[n\right]=\left\lbrace
1,\ldots,n\right\rbrace}{omitted} mapping \eqn{x\in[n]}{omitted} to
\eqn{\alpha(g,x)=g(x)=xg}.  For example, if \eqn{g=(172)(45)} then
\eqn{\alpha(g,7)=g(7)=7g=2}{omitted} and similarly \eqn{\alpha(g,4)=5}.

Package idiom allows one to explicitly coerce \code{g} to a function, or
to use the overloaded caret:

  \preformatted{
    (g <- as.cycle("(172)(45)"))
    #> [1] (172)(45)
    as.function(g)(7)
    #> [1] 2
    7^g
    #> [1] 2
  }


}

\author{Robin K. S. Hankin}
\note{
Multiplication of permutations loses associativity when using functional
notation; see examples.

Also, note that the coerced function will not take an argument greater
than the size (qv) of the permutation.

Vignette \code{vignettes/groupaction.Rmd} discusses this issue.

}
\examples{
x <- cyc_len(3)
y <- cyc_len(5)

xfun <- as.function(x)
yfun <- as.function(y)

stopifnot(xfun(yfun(2)) == as.function(y*x)(2)) # note transposition of x & y

# postfix notation has the very appealing result x(fg) == (xf)g
# Carets are good too, in that x^(fg) == (x^f)^g.

a <- rperm()
b <- rperm()
stopifnot(2^(a*b) == (2^a)^b)

# it's fully vectorized:
as.function(rperm(10,9))(1)
as.function(as.cycle(1:9))(sample(9))
as.function(allcyc(5:8))(1:6)

# standard recycling rules apply:
f <- as.function(allperms(3))
all(f(1:3) == f(c(1:3,1:3)))

}

