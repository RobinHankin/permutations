# Functions to create and coerce word objects and cycle objects

Functions to create permutation objects. `permutation` is a virtual
class.

## Usage

``` r
word(M)
permutation(x)
is.permutation(x)
cycle(x)
is.word(x)
is.cycle(x)
as.word(x,n=NULL)
as.cycle(x)
cycle2word(x,n=NULL)
char2cycle(char)
cyc_len(n)
shift_cycle(n)
# S3 method for class 'word'
as.matrix(x,...)
```

## Arguments

- M:

  In function `word()`, a matrix with rows corresponding to permutations
  in word form

- x:

  See details

- n:

  In functions `as.word()` and `cycle2word()`, the size of the word to
  return; in function `cyc_len()`, the length of the cycles to return

- char:

  In function `char2cycle()` a character vector which is coerced to a
  cycle object

- ...:

  Further arguments passed to `as.matrix()`

## Details

Functions `word()` and `cycle()` are rather formal functions which make
no attempt to coerce their arguments into sensible forms. The user
should use `permutation()`, which detects the form of the input and
dispatches to `as.word()` or `as.cycle()`, which are much more
user-friendly and try quite hard to Do The Right Thing (tm).

Functions `word()` and `cycle()` are the only functions in the package
which assign class `word` or `cycle` to an object.

Function `word()` takes a matrix and returns a word object; silently
coerces to integer.

Function `cycle()` takes a “cyclist”, that is, a list whose elements are
lists whose elements are vectors (which are disjoint cycles); and
returns an object of class “`cycle`”. It nicifies its input with
[`nicify_cyclist()`](cyclist.md) before returning it.

A *word* is a matrix whose rows correspond to permutations in word
format.

A cycle is a list whose elements correspond to permutations in cycle
form. A `cycle` object comprises elements which are informally dubbed
‘cyclists’. A cyclist is a list of integer vectors corresponding to the
cycles of the permutation.

Function `cycle2word()` converts cycle objects to word objects.

Function `shift_cycle()` is a convenience wrapper for
`as.cycle(seq_len(n))`; `cyc_len()` is a synonym.

It is a very common error (at least, it is for me) to use `cycle()` when
you meant `as.cycle()`.

The print method is sensitive to the value of option
‘`print_word_as_cycle`’, documented at `print.Rd`.

Function `as.matrix.word()` coerces a vector of permutations in word
form to a matrix, each row of which is a word. To get a permutation
matrix (that is, a square matrix of ones and zeros with exactly one
entry of 1 in each row and each column), use
[`perm_matrix()`](perm_matrix.md).

In function `as.word()`, argument `n` cannot act to reduce the size of
the word, only increase it. If you want to reduce the size, use
[`trim()`](tidy.md) or [`tidy()`](tidy.md). This function does not call
`word()` except directly (e.g. it does not call `size<-.word()`, as this
would give a recursion).

## Value

Returns a `cycle` object or a `word object`

## Author

Robin K. S. Hankin

## See also

[`cyclist`](cyclist.md)

## Examples

``` r
word(matrix(1:8,7,8)) # default print method coerces to cycle form
#> [1] (28)(37)(46)     (12)(38)(47)(56) (13)(48)(57)     (14)(23)(58)(67)
#> [5] (15)(24)(68)     (16)(25)(34)(78) (17)(26)(35)    
#> [coerced from word form]

cycle(list(list(c(1,8,2),c(3,6)),list(1:2, 4:8)))
#> [1] (182)(36)   (12)(45678)

char2cycle(c("(1,4)(6,7)","(3,4,2)(8,19)", "(56)","(12345)(78)","(78)"))
#> [1] (1,4)(6,7)       (2,3,4)(8,19)    (5,6)            (1,2,3,4,5)(7,8)
#> [5] (7,8)           

jj <- c(4,2,3,1)

as.word(jj)
#> [1] (14)
#> [coerced from word form]
as.cycle(jj)
#> [1] (1423)

as.cycle(1:2)*as.cycle(1:8) == as.cycle(1:8)*as.cycle(1:2)  # FALSE!
#> [1] FALSE

x <- rperm(10,7)
y <- rperm(10,7)
as.cycle(commutator(x,y))
#>  [1] (13)(264)(57) (16374)       (13)(257)(46) (15672)       (134)(257)   
#>  [6] (1475263)     (1764)(35)    (1673245)     (12754)       (15472)      

cyc_len(1:9)
#> [1] ()          (12)        (123)       (1234)      (12345)     (123456)   
#> [7] (1234567)   (12345678)  (123456789)

```
