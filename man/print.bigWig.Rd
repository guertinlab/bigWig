\name{print.bigWig}
\alias{print.bigWig}
\alias{print}

\title{Print Information on bigWig Files}
\description{Print information on loaded UCSC bigWig files.}
\usage{
\method{print}{bigWig}(x, \dots)
}


\arguments{
\item{x}{a bigWig object}
\item{...}{other further arguments passed to or from other methods.}
}

\details{Displays information bigWig instance in the same format as the command line tool bigWigInfo.}

\value{Called for its side effect (printing); returns the bigWig object invisibly.}

\author{André Luís Martins}

\seealso{See \code{\link{load.bigWig}} to load a bigWig}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ bigWig }
\keyword{ print }

\examples{
bw <- load.bigWig(system.file("extdata", "test3_chrU.bigWig", package = "bigWig"))
print(bw)
unload.bigWig(bw)
}
