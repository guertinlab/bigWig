\name{bed.utils}
\alias{center.bed}
\alias{fiveprime.bed}
\alias{threeprime.bed}
\alias{downstream.bed}
\alias{upstream.bed}

\title{BED Transformation Utility Functions}
\description{Functions to transform BED data.frames.}

\usage{
center.bed(bed, upstreamWindow, downstreamWindow)

fiveprime.bed(bed, upstreamWindow, downstreamWindow)

threeprime.bed(bed, upstreamWindow, downstreamWindow)

downstream.bed(bed, downstreamWindow)

upstream.bed(bed, upstreamWindow)

}
\arguments{
  \item{bed}{the input BED data.frame.}
  \item{upstreamWindow}{integer number of bases to include upstream of the anchor point.}
  \item{downstreamWindow}{integer number of bases to include downstream of the anchor point.}
}

\details{
  \code{center.bed}, \code{fiveprime.bed} and \code{threeprime.bed} generate a BED data.frame anchored on the center, 5' and 3' ends of the interval, respectively. The resulting intervals have size \code{upstreamWindow + downstreamWindow + 1}.
  
  \code{downstream.bed} and \code{upstream.bed} generate a BED data.frame anchored on the 5' and 3' sites, respectively. The resulting intervals have size \code{downstreamWindow} and \code{upstreamWindow}, respectively.
}

\value{BED data.frame resulting from the requested transformation.
}

\author{André Luís Martins}

\examples{
bed <- data.frame(chrom = "chr1", start = 1000L, end = 2000L,
                  name = "gene1", score = 0L, strand = "+",
                  stringsAsFactors = FALSE)

center.bed(bed, upstreamWindow = 500, downstreamWindow = 500)
fiveprime.bed(bed, upstreamWindow = 200, downstreamWindow = 200)
threeprime.bed(bed, upstreamWindow = 200, downstreamWindow = 200)
upstream.bed(bed, upstreamWindow = 500)
downstream.bed(bed, downstreamWindow = 500)
}
