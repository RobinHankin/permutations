# The identity permutation

The identity permutation leaves every element fixed

## Usage

``` r
is.id(x)
is.id_single_cycle(x)
# S3 method for class 'cycle'
is.id(x)
# S3 method for class 'list'
is.id(x)
# S3 method for class 'word'
is.id(x)
```

## Arguments

- x:

  Object to be tested

## Details

The identity permutation is problematic because it potentially has zero
size.

## Value

The variable `id` is a *cycle* as this is more convenient than a
zero-by-one matrix.

Function `is.id()` returns a Boolean with `TRUE` if the corresponding
element is the identity, and `FALSE` otherwise. It dispatches to either
`is.id.cycle()` or `is.id.word()` as appropriate.

Function `is.id.list()` tests a cyclist for identityness.

## Author

Robin K. S. Hankin

## Note

The identity permutations documented here are distinct from the null
permutations documented at `nullperm.Rd`.

## See also

[`is.derangement`](derangement.md),[`nullperm`](nullperm.md)

## Examples

``` r
is.id(id)
#> [1] TRUE

as.word(id)  # weird
#> [1] ()
#> [coerced from word form]

x <- rperm(10,4)
x[3] <- id
is.id(x*inverse(x))
#>  [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
```
