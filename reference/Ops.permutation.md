# Arithmetic Ops Group Methods for permutations

Allows arithmetic operators to be used for manipulation of permutation
objects such as addition, multiplication, division, integer powers, etc.

## Usage

``` r
# S3 method for class 'permutation'
Ops(e1, e2)
cycle_power(x,pow)
cycle_power_single(x,pow)
cycle_sum(e1,e2)
cycle_sum_single(c1,c2)
word_equal(e1,e2)
word_prod(e1,e2)
word_prod_single(e1,e2)
permprod(x)
vps(vec,pow)
ccps(n,pow)
helper(e1,e2)
cycle_plus_integer_elementwise(x,y)
conjugation(e1,e2)
```

## Arguments

- x,e1,e2:

  Objects of class “`permutation`”

- c1,c2:

  Objects of class `cycle`

- pow:

  Integer vector of powers

- vec:

  In function `vps()`, a vector of integers corresponding to a cycle

- n:

  In function `ccps()`, the integer power to which `cycle(seq_len(n))`
  is to be raised; may be positive or negative

- y:

  In experimental function `cycle_plus_integer_elementwise()`, an
  integer

## Details

Function `Ops.permutation()` dispatches binary arithmetic operators
(“`+`”, “`*`”, “`/`”, “`^`”, and “`==`”) to the appropriate specialist
function.

Multiplication, as in `a*b`, is equivalent to `word_prod(a,b)`; it
coerces its arguments to word form (because `a*b = b[a]`).

Raising permutations to integer powers, as in `a^n`, is
`cycle_power(a,n)`; it coerces `a` to cycle form and returns a cycle
(even if \\n=1\\). Negative and zero values of `n` operate as expected.
Function `cycle_power()` is vectorized; it calls `cycle_power_single()`,
which is not. This calls `vps()` (“Vector Power Single”), which checks
for simple cases such as `pow=0` or the identity permutation; and
function `vps()` calls function `ccps()` which performs the actual
number-theoretic manipulation to raise a cycle to a power.

Group-theoretic conjugation is implemented: in package idiom, `a^b`
gives `inverse(b)*a*b`. The notation is motivated by the identities
`x^(yz)=(x^y)^z` and `(xy)^z=x^z*y^z` \[or \\x^{yz}=(x^y)^z\\ and
\\(xy)^z=x^zy^z\\\]. Internally, `conjugation()` is called. The concept
of conjugate *permutations* \[that is, permutations with the same
[`shape()`](shape.md)\] is discussed at [conjugate](conjugate.md).

The caret “`^`” also indicates group action \[there is some discussion
at `as.function.permutation.Rd`\]. Given an integer `n` and a
permutation `g`, idiom `n^g` returns the group action of `g` acting on
`n`. The notation is motivated by the identity `n^(ab) == (n^a)^b`.

The sum of two permutations `a` and `b`, as in `a+b`, is defined if the
cycle representations of the addends are disjoint. The sum is defined as
the permutation given by juxtaposing the cycles of `a` with those of
`b`. Note that this operation is commutative. If `a` and `b` do not have
disjoint cycle representations, an error is returned. If `a+b` is
defined we have

`a^n + b^n == (a+b)^n == a^n * b^n == (a*b)^n`

for any \\n\in\mathbb{Z}\\. Using “`+`” in this way is useful if you
want to guarantee that two permutations commute (NB: permutation `a`
commutes with `a^i` for `i` any integer, and in particular `a` commutes
with itself. But `a+a` returns an error: the operation checks for
disjointness, not commutativity).

Permutation “division”, as in `a/b`, is `a*inverse(b)`. Note that
`a/b*c` is evaluated left to right so is equivalent to `a*inverse(b)*c`.
See note.

Function `helper()` sorts out recycling for binary functions, the
behaviour of which is inherited from
[`cbind()`](https://rdrr.io/r/base/cbind.html), which also handles the
names of the returned permutation.

Experimental functionality is provided to define the “sum” of a
permutation and an integer. If \\x\\ is a permutation in cycle form with
\\x=(abc)\\, say, and \\n\\ an integer, then \\x+n=(a+n,b+n,c+n)\\: each
element of each cycle of \\x\\ is increased by \\n\\. Note that this has
associativity consequences. For example, `x+(x+n)` might be defined but
not `(x+x)+n`, as the two “`+`” operators have different
interpretations. Distributivity is similarly broken (see the examples).
Package idiom includes `x-n` \[defined as `x + (-n)`\] and `n+x` but not
`n-x` as inverses are defined multiplicatively. The implementation is
vectorized.

## Value

None of these functions are really intended for the end user: use the
ops as shown in the examples section.

## Note

The class of the returned object is the appropriate one.

Unary operators to invert a permutation are problematic in the package.
I do not like using “`id/x`” to represent a permutation inverse: the
idiom introduces an utterly redundant object (“`id`”), and forces the
use of a binary operator where a unary operator is needed. Similar
comments apply to “`x^-1`”, which again introduces a redundant object
(`-1`) and uses a binary operator.

Currently, “`-x`” returns the multiplicative inverse of `x`, but this is
not entirely satisfactory either, as it uses additive notation: the rest
of the package uses multiplicative notation. Thus `x*-x == id`, which
looks a little odd but OTOH noone has a problem with `x^-1` for
inverses.

I would like to follow APL and use “`/x`”, but this does not seem to be
possible in R. The natural unary operator would be the exclamation mark
“`!x`”. However, redefining the exclamation mark to give permutation
inverses, while possible, is not desirable because its precedence is too
low. One would like `!x*y` to return `inverse(x)*y` but instead standard
precedence rules means that it returns `inverse(x*y)`. Earlier versions
of the package interpreted `!x` as `inverse(x)`, but it was a disaster:
to implement the commutator \\\[x,y\]=x^{-1}y^{-1}xy\\, for example, one
would like to use `!x*!y*x*y`, but this is interpreted as
`!(x*(!y*(x*y)))`; one has to use `(!x)*(!y)*x*y`. I found myself having
to use heaps of brackets everywhere. This caused such severe cognitive
dissonance that I removed exclamation mark for inverses from the
package. I might reinstate it in the future. There does not appear to be
a way to define a new unary operator due to the construction of the
parser.

## Author

Robin K. S. Hankin

## Examples

``` r

x <- rperm(10,9) # word form
y <- rperm(10,9) # word form

x*y  # products are given in word form but the print method coerces to cycle form
#>  [1] (1572684)(39)   (1542936)(78)   (18726)(354)    (14732659)     
#>  [5] (1439685)       (17294536)      (126453987)     (1238)(456)(79)
#>  [9] (1432)(576)(89) (184)(293765)  
#> [coerced from word form]
print_word(x*y)
#>      1 2 3 4 5 6 7 8 9
#> [1]  5 6 9 1 7 8 2 4 3
#> [2]  5 9 6 2 4 1 8 7 3
#> [3]  8 6 5 3 4 1 2 7 .
#> [4]  4 6 2 7 9 5 3 . 1
#> [5]  4 . 9 3 1 8 . 5 6
#> [6]  7 9 6 5 3 1 2 . 4
#> [7]  2 6 9 5 3 4 1 7 8
#> [8]  2 3 8 5 6 4 9 1 7
#> [9]  4 1 2 3 7 5 6 9 8
#> [10] 8 9 7 1 2 5 6 4 3

x^5  # powers are given in cycle form
#>  [1] (15)(296)(387)  (162)(347)(598) (589)           (1735)(2846)   
#>  [5] (1965387)       (2679483)       (183)           (1923564)(78)  
#>  [9] (1963)(587)     (17693258)     

x^as.cycle(1:5)  # conjugation (not integer power!); coerced to word.
#>  [1] (12)(369)(478)  (189)(236)(475) (198)(23647)    (1274)(3856)   
#>  [5] (1768942)       (3947865)       (13597)(248)    (1245369)(78)  
#>  [9] (178)(2964)     (19236847)     
#> [coerced from word form]

x*inverse(x) == id  # all TRUE
#>  [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE


# the 'sum' of two permutations is defined if their cycles are disjoint:
as.cycle(1:4) + as.cycle(7:9)
#> [1] (1234)(789)

data(megaminx)
megaminx[1] + megaminx[7:12]
#>                                                                                                                                                                       LightGreen 
#>           (10,12,14,16,18)(11,13,15,17,19)(21,33,45,57,69)(22,34,46,58,60)(23,35,47,59,61)(30,88,120,110,40)(31,89,121,111,41)(39,87,129,119,49)(70,72,74,76,78)(71,73,75,77,79) 
#>                                                                                                                                                                           Orange 
#>              (10,12,14,16,18)(11,13,15,17,19)(21,33,45,57,69)(22,34,46,58,60)(23,35,47,59,61)(27,99,121,71,37)(28,90,122,72,38)(29,91,123,73,39)(80,82,84,86,88)(81,83,85,87,89) 
#>                                                                                                                                                                        LightBlue 
#>           (10,12,14,16,18)(11,13,15,17,19)(21,33,45,57,69)(22,34,46,58,60)(23,35,47,59,61)(25,65,101,123,83)(26,66,102,124,84)(27,67,103,125,85)(90,92,94,96,98)(91,93,95,97,99) 
#>                                                                                                                                                                      LightYellow 
#> (10,12,14,16,18)(11,13,15,17,19)(21,33,45,57,69)(22,34,46,58,60)(23,35,47,59,61)(53,113,125,95,63)(54,114,126,96,64)(55,115,127,97,65)(100,102,104,106,108)(101,103,105,107,109) 
#>                                                                                                                                                                             Pink 
#> (10,12,14,16,18)(11,13,15,17,19)(21,33,45,57,69)(22,34,46,58,60)(23,35,47,59,61)(41,75,127,107,51)(42,76,128,108,52)(43,77,129,109,53)(110,112,114,116,118)(111,113,115,117,119) 
#>                                                                                                                                                                             Grey 
#> (10,12,14,16,18)(11,13,15,17,19)(21,33,45,57,69)(22,34,46,58,60)(23,35,47,59,61)(73,85,97,109,111)(74,86,98,100,112)(75,87,99,101,113)(120,122,124,126,128)(121,123,125,127,129) 

rperm() + 100
#>  [1] (101,102)(103,106)(104,107)    (101,103)(102,105,104,107)    
#>  [3] (102,104,105,106)              (101,104,105,106,102,103,107) 
#>  [5] (101,104,105)(103,106)         (101,102)(103,106,107,104)    
#>  [7] (101,104,106,102,103,107,105)  (102,105,104,103)             
#>  [9] (101,107,106)(102,104,103)     (101,102,107,104,105)(103,106)

z <- cyc_len(4)
z
#> [1] (1234)
z+100
#> [1] (101,102,103,104)
z + 0:5
#> [1] (1234) (2345) (3456) (4567) (5678) (6789)
(z + 0:5)*z
#> [1] (13)(24)     (12453)      (123)(456)   (1234567)    (1234)(5678)
#> [6] (1234)(6789)
#> [coerced from word form]

w <- cyc_len(7) + 1
(w+1)*(w-1)
#> [1] (123578946)
#> [coerced from word form]
```
