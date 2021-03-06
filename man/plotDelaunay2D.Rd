% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/delaunay.R
\name{plotDelaunay2D}
\alias{plotDelaunay2D}
\title{Plot 2D Delaunay tessellation}
\usage{
plotDelaunay2D(
  tessellation,
  border = "black",
  color = "distinct",
  hue = "random",
  luminosity = "light",
  lty = par("lty"),
  lwd = par("lwd"),
  ...
)
}
\arguments{
\item{tessellation}{the output of \code{\link{delaunay}}}

\item{border}{the color of the borders of the triangles; \code{NULL} for
no borders}

\item{color}{controls the filling colors of the triangles, either
\code{FALSE} for no color, \code{"random"} to use
\code{\link[randomcoloR]{randomColor}}, or \code{"distinct"} to use
\code{\link[randomcoloR]{distinctColorPalette}}}

\item{hue, luminosity}{if \code{color = "random"}, these arguments are passed
to \code{\link[randomcoloR]{randomColor}}}

\item{lty, lwd}{graphical parameters}

\item{...}{arguments passed to \code{\link{plot}}}
}
\value{
No value, just renders a 2D plot.
}
\description{
Plot a 2D Delaunay tessellation.
}
\examples{
# random points in a square
set.seed(314)
library(tessellation)
library(uniformly)
square <- rbind(
  c(-1, 1), c(1, 1), c(1, -1), c(-1, -1)
)
ptsin <- runif_in_cube(10L, d = 2L)
pts <- rbind(square, ptsin)
d <- delaunay(pts)
opar <- par(mar = c(0, 0, 0, 0))
plotDelaunay2D(
  d, xlab = NA, ylab = NA, asp = 1, color = "random", luminosity = "dark"
)
par(opar)
}
