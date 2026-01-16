\name{print}
\alias{print.permutation}
\alias{print.word}
\alias{print.cycle}
\alias{print_word}
\alias{print_word_as_cycle}
\alias{print_cycle}
\alias{print_oneline}
\alias{oneline}
\alias{as.character.cycle}
\alias{as.character_cyclist}
\title{
Print methods for permutation objects
}
\description{
Print methods for permutation objects with matrix-like printing for
words and bracket notation for cycle objects.
}
\usage{
\method{print}{cycle}(x, give_string=FALSE, ...)
\method{print}{word}(x, h = getOption("print_word_as_cycle"), ...)
as.character_cyclist(y,comma=TRUE)
}

\arguments{
  \item{x}{Object of class \code{permutation} with \code{word} objects
    dispatched to \code{print.word()} and \code{cycle} objects dispatched to
    \code{print.cycle()}}
  \item{h}{Boolean, with default \code{TRUE} meaning to coerce words
    to cycle form before printing.  See details}
  \item{...}{Further arguments (currently ignored)}
  \item{y,comma}{In \code{as.character.cyclist()}, argument \code{y}
    is a list of cycles (a cyclist); and \code{comma} is Boolean,
    specifying whether to include a comma in the output}
  \item{give_string}{In function}
}
\value{
  Returns its argument invisibly, after printing it (except for
  \code{print.cycle(x, give_string = TRUE)}, in which case a character
  vector is returned).
}
\details{

  Printing of word objects is controlled by
  \code{options("print_word_as_cycle")}.  The default behaviour is to
  print any permutation object, whether of class cycle or class word, in
  cycle form.  Cycle objects are printed as is; word objects are coerced
  to cycle form and printed, with a notice that the object itself was
  coerced from word.
  
  If \code{options("print_word_as_cycle")} is \code{FALSE}, then objects
  of class word are printed as a matrix with rows being the permutations
  and fixed points indicated with a dot.

  Function \code{as.character_cyclist()} is an internal function used by
  \code{print.cycle()}, and is not really designed for the end-user.  It
  takes a cyclist and returns a character string.

  Function \code{print_word()} and \code{print_cycle()} are provided for
  power users.  These functions print their argument directly as word or
  cycle form; they coerce to the appropriate form.  Use
  \code{print_word()} if you have a permutation in word form and want to
  inspect it as a word form but (for some reason) do not want to set
  \code{options("print_word_as_cycle")}.  See \code{size.Rd} for a
  use-case.

  To see permutations in one-line form, use \code{print_word(x,
  use_dots=FALSE)}.

  Coercing a cycle to a character vector can be done with
  \code{as.character()}, which returns a character vector that is
  suitable for \code{as.cycle()}, so if \code{a} is a cycle
  \code{all(as.cycle(as.character(a)) == a)} will return \code{TRUE}.
  If you want to use the options of the print method, use
  \code{print.cycle(..., give_string = TRUE)}, which respects the print
  options discussed below.  Neither of these give useful output if their
  argument is in word form.

  The print method includes experimental functionality to display
  permutations of sets other than the default of integers
  \eqn{1, 2, \ldots, n}{1, 2, ..., n}.  Both cycle and word print methods
  are sensitive to option \code{perm_set}: the default value of
  \code{NULL} means to use integers.  The symbols may be the elements of
  any character vector; use idiom such as

  \preformatted{options("perm_set" = letters)}

  to override the default.  But beware!  If the permutation includes
  numbers greater than the length of \code{perm_set}, then \code{NA}
  will be printed.  It is possible to use vectors with elements of more
  than one character (e.g. \code{state.abb}).

  In the printing of cycle objects, commas are controlled with option
  \code{"comma"}.  The default \code{NULL} means including commas in the
  representation if the size of the permutation exceeds 9.  This works
  well for integers but is less helpful if using letters or state
  abbreviations.  Force the use of commas by setting the option to
  \code{TRUE} or \code{FALSE}, e.g.

  \preformatted{options("comma" = TRUE)}

  The print method does not change the internal representation of word
  or cycle objects, it only affects how they are printed.

  The print method for cycle objects is sensitive to experimental option
  \code{print_in_length_order} (via function
  \code{as.character_cyclist()}).  If \code{TRUE}, permutations will be
  printed with their cycles in increasing length order.  Set it with
  
  \preformatted{options("print_in_length_order" = TRUE)}

  There is a package vignette (type \code{vignette("print")} at the
  command line) which gives more details and long-form documentation.

}

\author{Robin K. S. Hankin}
\seealso{\code{\link{nicify_cyclist}}}
\examples{

# generate a permutation in *word* form:
x <- rperm(4,9)

# default behaviour is to print in cycle form irregardless:
x

# change default using options():
options(print_word_as_cycle = FALSE)

# objects in word form now printed using matrix notation:
x

# printing of cycle form objects not altered:
as.cycle(x)

# restore default:
options(print_word_as_cycle = TRUE)

as.character_cyclist(list(1:4, 10:11, 20:33))  # x a cyclist;
as.character_cyclist(list(c(1,5,4), c(2,2)))  # does not check for consistency
as.character_cyclist(list(c(1,5,4), c(2,9)),comma=FALSE)

options("perm_set" = letters)
rperm(r = 9)
options("perm_set" = NULL)  # restore default
}
\keyword{symbolmath}
