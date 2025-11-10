# Cayley tables for permutation groups

Produces a nice Cayley table for a subgroup of the symmetric group on
\\n\\ elements

## Usage

``` r
cayley(x)
```

## Arguments

- x:

  A vector of permutations in cycle form

## Value

A square matrix giving the group operation

## Details

Cayley's theorem states that every group G is isomorphic to a subgroup
of the symmetric group acting on G. In this context it means that if we
have a vector of permutations that comprise a group, then we can nicely
represent its structure using a table.

If the set `x` is not closed under multiplication and inversion (that
is, if `x` is not a group) then the function may misbehave. No argument
checking is performed, and in particular there is no check that the
elements of `x` are unique, or even that they include an identity.

## Author

Robin K. S. Hankin

## Examples

``` r
## cyclic group of order 4:
cayley(as.cycle(1:4)^(0:3))
#>            ()         (1,2,3,4)  (1,3)(2,4) (1,4,3,2) 
#> ()         ()         (1,2,3,4)  (1,3)(2,4) (1,4,3,2) 
#> (1,2,3,4)  (1,2,3,4)  (1,3)(2,4) (1,4,3,2)  ()        
#> (1,3)(2,4) (1,3)(2,4) (1,4,3,2)  ()         (1,2,3,4) 
#> (1,4,3,2)  (1,4,3,2)  ()         (1,2,3,4)  (1,3)(2,4)

## Klein group:
K4 <- as.cycle(c("()","(12)(34)","(13)(24)","(14)(23)"))
names(K4) <- c("00","01","10","11")
cayley(K4)
#>    00 01 10 11
#> 00 00 01 10 11
#> 01 01 00 11 10
#> 10 10 11 00 01
#> 11 11 10 01 00


## S3, the symmetric group on 3 elements:
S3 <- as.cycle(c(
    "()",
    "(12)(35)(46)", "(13)(26)(45)",
    "(14)(25)(36)", "(156)(243)", "(165)(234)"
))
names(S3) <- c("()","(ab)","(ac)","(bc)","(abc)","(acb)")
cayley(S3)
#>       ()    (ab)  (ac)  (bc)  (abc) (acb)
#> ()    ()    (ab)  (ac)  (bc)  (abc) (acb)
#> (ab)  (ab)  ()    (acb) (abc) (bc)  (ac) 
#> (ac)  (ac)  (abc) ()    (acb) (ab)  (bc) 
#> (bc)  (bc)  (acb) (abc) ()    (ac)  (ab) 
#> (abc) (abc) (ac)  (bc)  (ab)  (acb) ()   
#> (acb) (acb) (bc)  (ab)  (ac)  ()    (abc)


## Now an example from the onion package, the quaternion group:
if (FALSE) { # \dontrun{
 library(onion)
 a <- c(H1,-H1,Hi,-Hi,Hj,-Hj,Hk,-Hk)
 X <- word(sapply(1:8,function(k){sapply(1:8,function(l){which((a*a[k])[l]==a)})}))
 cayley(X)  # a bit verbose; rename the vector:
 names(X) <- letters[1:8]
 cayley(X)  # more compact
} # }
```
