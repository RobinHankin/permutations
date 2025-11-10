# The dodecahedron group

Permutations comprising the dodecahedron group on either its faces or
its edges; also the full dodecahedron group

## Details

The package provides a number of objects for investigating dodecahedral
groups:

Object `dodecahedron_face` is a cycle object with 60 elements
corresponding to the permutations of the faces of a dodecahedron,
numbered 1-12 as in the megaminx net. Object `dodecahedron_edge` is the
corresponding object for permuting the edges of a dodecahedron. The
edges are indexed by the lower of the two adjoining facets on the
megaminx net.

Objects `full_dodecahedron_face` and `full_dodecahedron_edge` give the
120 elements of the full dodecahedron group, that is, the dodecahedron
group including reflections. NB: these objects are **not** isomorphic to
S5.

## Note

File `zzz_dodecahedron.R` is not really intended to be human-readable.
The source file is in `inst/dodecahedron_group.py` and
`inst/full_dodecahedron_group.py` which contain documented python source
code.

## Examples

``` r
permprod(dodecahedron_face)
#> [1] (1,9,3,6,8)(4,10,7,5,12)
#> [coerced from word form]
```
