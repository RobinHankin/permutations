\name{dodecahedron}
\alias{dodecahedron}
\alias{dodecahedron_face}
\alias{dodecahedron_edge}
\alias{full_dodecahedron_face}
\alias{full_dodecahedron_edge}
\docType{data}
\title{
The dodecahedron group
}
\description{
Permutations comprising the dodecahedron group on either its faces or
its edges; also the full dodecahedron group
}
\details{

The package provides a number of objects for investigating dodecahedral
groups:

Object \code{dodecahedron_face} is a cycle object with 60 elements
corresponding to the permutations of the faces of a dodecahedron,
numbered 1-12 as in the megaminx net.  Object \code{dodecahedron_edge}
is the corresponding object for permuting the edges of a dodecahedron.
The edges are indexed by the lower of the two adjoining facets on the
megaminx net.

Objects \code{full_dodecahedron_face} and \code{full_dodecahedron_edge}
give the 120 elements of the full dodecahedron group, that is, the
dodecahedron group including reflections.  NB: these objects are
\strong{not} isomorphic to S5.
}
  
\note{
File \code{zzz_dodecahedron.R} is not really intended to be
human-readable.  The source file is in \code{inst/dodecahedron_group.py}
and \code{inst/full_dodecahedron_group.py} which contain documented
python source code.
}


\examples{

permprod(dodecahedron_face)

}
\keyword{datasets}
