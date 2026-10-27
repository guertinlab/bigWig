\name{unload.bigWig}
\alias{unload.bigWig}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Unload bigWig Files}
\description{Release memory associated with the bigWig object.}
\usage{
unload.bigWig(bigWig)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{bigWig}{a bigWig object}
}

\value{Called for its side effect; returns NULL invisibly.}

\author{André Luís Martins}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{See \code{\link{load.bigWig}} to load a bigWig.}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ bigwig }
\keyword{ unload }
\keyword{ free }

\examples{
bw <- load.bigWig(system.file("extdata", "test3_chrU.bigWig", package = "bigWig"))
unload.bigWig(bw)
}
