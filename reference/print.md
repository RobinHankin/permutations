# Print methods for permutation objects

Print methods for permutation objects with matrix-like printing for
words and bracket notation for cycle objects.

## Usage

``` r
# S3 method for class 'cycle'
print(x, give_string=FALSE, ...)
# S3 method for class 'word'
print(x, h = getOption("print_word_as_cycle"), ...)
as.character_cyclist(y,comma=TRUE)
```

## Arguments

- x:

  Object of class `permutation` with `word` objects dispatched to
  `print.word()` and `cycle` objects dispatched to `print.cycle()`

- h:

  Boolean, with default `TRUE` meaning to coerce words to cycle form
  before printing. See details

- ...:

  Further arguments (currently ignored)

- y,comma:

  In `as.character.cyclist()`, argument `y` is a list of cycles (a
  cyclist); and `comma` is Boolean, specifying whether to include a
  comma in the output

- give_string:

  In function

## Value

Returns its argument invisibly, after printing it (except for
`print.cycle(x, give_string = TRUE)`, in which case a character vector
is returned).

## Details

Printing of word objects is controlled by
`options("print_word_as_cycle")`. The default behaviour is to print any
permutation object, whether of class cycle or class word, in cycle form.
Cycle objects are printed as is; word objects are coerced to cycle form
and printed, with a notice that the object itself was coerced from word.

If `options("print_word_as_cycle")` is `FALSE`, then objects of class
word are printed as a matrix with rows being the permutations and fixed
points indicated with a dot.

Function `as.character_cyclist()` is an internal function used by
`print.cycle()`, and is not really designed for the end-user. It takes a
cyclist and returns a character string.

Function `print_word()` and `print_cycle()` are provided for power
users. These functions print their argument directly as word or cycle
form; they coerce to the appropriate form. Use `print_word()` if you
have a permutation in word form and want to inspect it as a word form
but (for some reason) do not want to set
`options("print_word_as_cycle")`. See `size.Rd` for a use-case.

To see permutations in one-line form, use
`print_word(x, use_dots=FALSE)`.

Coercing a cycle to a character vector can be done with
[`as.character()`](https://rdrr.io/r/base/character.html), which returns
a character vector that is suitable for [`as.cycle()`](permutation.md),
so if `a` is a cycle `all(as.cycle(as.character(a)) == a)` will return
`TRUE`. If you want to use the options of the print method, use
`print.cycle(..., give_string = TRUE)`, which respects the print options
discussed below. Neither of these give useful output if their argument
is in word form.

The print method includes experimental functionality to display
permutations of sets other than the default of integers \\1, 2, \ldots,
n\\. Both cycle and word print methods are sensitive to option
`perm_set`: the default value of `NULL` means to use integers. The
symbols may be the elements of any character vector; use idiom such as

    options("perm_set" = letters)

to override the default. But beware! If the permutation includes numbers
greater than the length of `perm_set`, then `NA` will be printed. It is
possible to use vectors with elements of more than one character (e.g.
`state.abb`).

In the printing of cycle objects, commas are controlled with option
`"comma"`. The default `NULL` means including commas in the
representation if the size of the permutation exceeds 9. This works well
for integers but is less helpful if using letters or state
abbreviations. Force the use of commas by setting the option to `TRUE`
or `FALSE`, e.g.

    options("comma" = TRUE)

The print method does not change the internal representation of word or
cycle objects, it only affects how they are printed.

The print method for cycle objects is sensitive to experimental option
`print_in_length_order` (via function `as.character_cyclist()`). If
`TRUE`, permutations will be printed with their cycles in increasing
length order. Set it with

    options("print_in_length_order" = TRUE)

There is a package vignette (type
[`vignette("print")`](../articles/print.md) at the command line) which
gives more details and long-form documentation.

## Author

Robin K. S. Hankin

## See also

[`nicify_cyclist`](cyclist.md)

## Examples

``` r
# generate a permutation in *word* form:
x <- rperm(4,9)

# default behaviour is to print in cycle form irregardless:
x
#> [1] (15879423)   (164973825)  (14698257)   (14)(265973)
#> [coerced from word form]

# change default using options():
options(print_word_as_cycle = FALSE)

# objects in word form now printed using matrix notation:
x
#>     1 2 3 4 5 6 7 8 9
#> [1] 5 3 1 2 8 . 9 7 4
#> [2] 6 5 8 9 1 4 3 2 7
#> [3] 4 5 . 6 7 9 1 2 8
#> [4] 4 6 2 1 9 5 3 . 7

# printing of cycle form objects not altered:
as.cycle(x)
#> [1] (15879423)   (164973825)  (14698257)   (14)(265973)

# restore default:
options(print_word_as_cycle = TRUE)

as.character_cyclist(list(1:4, 10:11, 20:33))  # x a cyclist;
#> [1] "(1,2,3,4)(10,11)(20,21,22,23,24,25,26,27,28,29,30,31,32,33)"
as.character_cyclist(list(c(1,5,4), c(2,2)))  # does not check for consistency
#> [1] "(1,5,4)(2,2)"
as.character_cyclist(list(c(1,5,4), c(2,9)),comma=FALSE)
#> [1] "(154)(29)"

options("perm_set" = letters)
rperm(r = 9)
#>  [1] (af)(cdh)(egi) (ahgd)(beifc)  (acihdb)(eg)   (aeigbdfhc)    (ahigdf)(bc)  
#>  [6] (aehb)(cgf)    (adbihec)(fg)  (agi)(bfhde)   (aeghdcfi)     (agdc)(bh)(fi)
#> [coerced from word form]
options("perm_set" = NULL)  # restore default
```
