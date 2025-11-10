# Plotting routine for megaminx sequences

Plots a coloured diagram of a dodecahedron net representing a megaminx

## Usage

``` r
megaminx_plotter(megperm=id,offset=c(0,0),M=diag(2),setup=TRUE,...)
```

## Arguments

- megperm:

  Permutation to be plotted

- offset,M:

  Offset and transformation matrix, see details

- setup:

  Boolean, with default `TRUE` meaning to set up the plot with a
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html) statement,
  and `FALSE` meaning to plot the points on a pre-existing canvas

- ...:

  Further arguments passed to
  [`polygon()`](https://rdrr.io/r/graphics/polygon.html)

## Details

Function `megaminx_plotter()` plots a coloured diagram of a dodecahedron
net representing a megaminx. The argument may be specified as a sequence
of turns that are applied to the megaminx from `START`.

The function uses rather complicated internal variables `pentagons`,
`triangles`, and `quads` whose meaning and genesis is discussed in
heavily-documented file `inst/guide.R`.

The diagram is centered so that the common vertex of triangles 28 and 82
is at \\(0,0)\\.

## Author

Robin K. S. Hankin

## Examples

``` r
data("megaminx")

megaminx_plotter()  # START

megaminx_plotter(W) # after turning the White face one click

megaminx_plotter(superflip)


size <- 0.95
o <- 290

if (FALSE) { # \dontrun{
pdf(file="fig1.pdf")
megaminx_plotter(M=size*diag(2),offset=c(-o,0),setup=TRUE)
megaminx_plotter(W,M=size*diag(2),offset=c(+o,0),setup=FALSE)
dev.off()

pdf(file="fig2.pdf")
p <- permprod(sample(megaminx,100,replace=TRUE))
megaminx_plotter(p,M=size*diag(2),offset=c(-o,0),setup=TRUE)
megaminx_plotter(superflip,M=size*diag(2),offset=c(+o,0),setup=FALSE)
dev.off()
} # }
```
