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
megaminx_plotter(megperm = id)
}
\arguments{
  \item{megperm}{Permutation to be plotted}
}
\details{

  Function \code{megaminx_plotter()} is the user-friendly function.
  Datasets \code{megaminx_pentagons}, \code{megaminx_triangles} and
  \code{megaminx_quads} give the coordinates of the facets.

}
\author{Robin K. S. Hankin}
\examples{
data("megaminx")
megaminx_plotter()  # START
megaminx_plotter(W) # after turning the White face one click
megaminx_plotter(permprod(sample(megaminx))) # scrambled
megaminx_plotter(superflip)
}