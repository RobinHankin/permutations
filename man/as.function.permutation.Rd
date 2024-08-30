\name{as.function.permutation}
\alias{as.function.permutation}
\alias{as.function.word}
\alias{as.function.cycle}
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

  This functionality is sometimes known as group action.  Formally, if
  \eqn{\alpha\colon X\times G\longrightarrow X}{omitted} is a function,
  it is a \dfn{group action} if \eqn{\alpha(x,e)=e}{omitted} and
  \eqn{\alpha(\alpha(x,h),h)=\alpha(x,gh)}{omitted}.  Writing
  \eqn{x\cdot g}{x.g} for \eqn{\alpha(x,g)}{omitted} we have \eqn{x\cdot
  e=x}{x.e=x} and \eqn{(x\cdot g)\cdot h=x\cdot(gh)}{(x.g).h=x.(gh)}.
  In package idiom, given permutation \code{g} [considered as an element
  of the symmetric group \eqn{S_n}], we return the function with domain
  \eqn{\left[n\right]=\left\lbrace 1,\ldots,n\right\rbrace}{omitted}
  mapping \eqn{x\in[n]}{omitted} to \eqn{\alpha(g,x)}.  For example, if
  \eqn{g=(172)(45)} then \eqn{\alpha(g,7)=2}{omitted} and
  \eqn{\alpha(g,4)=5}.  Package idiom allows one to explicitly coerce
  \code{g} to a function, or to use the overloaded caret:

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
}

