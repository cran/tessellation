% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/voronoi.R
\name{cellVertices}
\alias{cellVertices}
\title{Vertices of a bounded cell}
\usage{
cellVertices(cell, check.bounded = TRUE)
}
\arguments{
\item{cell}{a bounded Voronoï cell}

\item{check.bounded}{Boolean, whether to check that the cell is bounded;
set to \code{FALSE} for a small speed gain if you know that the cell is
bounded}
}
\value{
A matrix, each row represents a vertex.
}
\description{
Get all vertices of a bounded cell, without duplicates.
}
\examples{
library(tessellation)
d <- delaunay(centricCuboctahedron())
v <- voronoi(d)
cell13 <- v[[13]]
isBoundedCell(cell13) # TRUE
library(rgl)
open3d(windowRect = c(50, 50, 562, 562))
invisible(lapply(cell13[["cell"]], function(edge){
  edge$plot(edgeAsTube = TRUE, tubeRadius = 0.025, tubeColor = "yellow")
}))
cellvertices <- cellVertices(cell13)
spheres3d(cellvertices, radius = 0.1, color = "green")
}
