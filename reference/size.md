# Gets or sets the size of a permutation

The ‘size’ of a permutation is the cardinality of the set for which it
is a bijection.

## Usage

``` r
size(x)
addcols(M,n)
# S3 method for class 'word'
size(x)
# S3 method for class 'cycle'
size(x)
# S3 method for class 'word'
size(x) <- value
# S3 method for class 'cycle'
size(x) <- value
```

## Arguments

- x:

  A permutation object

- M:

  A matrix that may be coerced to a word

- n,value:

  the size to set to, an integer

## Details

For a `word` object, the size is equal to the number of columns. For a
`cycle` object, it is equal to the largest element of any cycle.

Function `addcols()` is a low-level function that operates on, and
returns, a matrix. It just adds columns to the right of `M`, with values
equal to their column numbers, thus corresponding to fixed elements. The
resulting matrix has `n` columns. This function cannot remove columns,
so if `n<ncol(M)` an error is returned.

Setting functions cannot decrease the size of a permutation; use
[`trim()`](tidy.md) for this.

It is meaningless to change the size of a `cycle` object. Trying to do
so will result in an error. But you can coerce cycle objects to `word`
form, and change the size of that.

Function `size<-.word()` \[as in `size(x) <- 9`\] trims its argument
down with [`trim()`](tidy.md) and then adds fixed elements if necessary.
Compare `addcols()`, which works only on permutations in word form.

## Author

Robin K. S. Hankin

## See also

[`fixed`](fixed.md)

## Examples

``` r
size(as.cycle(c("(17)","(123)(45)")))  # should be 7
#> [1] 7

x <- as.word(as.cycle("123"))
print_word(x)
#>     1 2 3
#> [1] 2 3 1
size(x) <- 9
print_word(x)
#>     1 2 3 4 5 6 7 8 9
#> [1] 2 3 1 . . . . . .


size(as.cycle(1:5) + as.cycle(100:101))
#> [1] 101

size(id)
#> [1] 0
```
