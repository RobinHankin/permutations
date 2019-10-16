\name{megaminx_plotter}
\alias{megaminx_plotter}
\alias{megaminx_pentagons}
\alias{megaminx_triangles}
\alias{megaminx_quads}
\title{Plotting routine for megaminx sequences}
\description{
  Plots a coloured diagram of a dodecahedron net representing a megaminx
}
\usage{
megaminx_plotter(megperm=id,offset=c(0,0),M=diag(2),setup=TRUE,...)
}
\arguments{
  \item{megperm}{Permutation to be plotted}
  \item{offset,M}{Offset and transformation matrix, see details}
  \item{setup}{Boolean, with default \code{TRUE} meaning to set up the
    plot with a \code{plot()} statement, and \code{FALSE} meaning to
    plot the points on a pre-existing canvas}
  \item{...}{Further arguments passed to \code{polygon()}}
}
\details{

  Function \code{megaminx_plotter()} plots a coloured diagram of a
  dodecahedron net representing a megaminx.  The argument may be
  specified as a sequence of turns that are applied to the megaminx from
  \var{START}.

  The function uses rather complicated internal variables
  \code{pentagons}, \code{triangles}, and \code{quads} whose meaning and
  genesis is discussed in heavily-documented file \code{inst/guide.R}.

  The diagram is centered so that the common vertex of triangles 28 and
  82 is at $(0,0)$.

}
\author{Robin K. S. Hankin}
\examples{
data("megaminx")

megaminx_plotter()  # START
megaminx_plotter(W) # after turning the White face one click
megaminx_plotter(superflip)

size <- 0.95
o <- 290

\dontrun{
pdf(file="fig1.pdf")
megaminx_plotter(M=size*diag(2),offset=c(-o,0),setup=TRUE)
megaminx_plotter(W,M=size*diag(2),offset=c(+o,0),setup=FALSE)
dev.off()

pdf(file="fig2.pdf")
p <- permprod(sample(megaminx,100,replace=TRUE))
megaminx_plotter(p,M=size*diag(2),offset=c(-o,0),setup=TRUE)
megaminx_plotter(superflip,M=size*diag(2),offset=c(+o,0),setup=FALSE)
dev.off()
}
}