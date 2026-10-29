pkgname <- "bigWig"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('bigWig')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("bed.utils")
### * bed.utils

flush(stderr()); flush(stdout())

### Name: bed.utils
### Title: BED Transformation Utility Functions
### Aliases: center.bed fiveprime.bed threeprime.bed downstream.bed
###   upstream.bed

### ** Examples

bed <- data.frame(chrom = "chr1", start = 1000L, end = 2000L,
                  name = "gene1", score = 0L, strand = "+",
                  stringsAsFactors = FALSE)

center.bed(bed, upstreamWindow = 500, downstreamWindow = 500)
fiveprime.bed(bed, upstreamWindow = 200, downstreamWindow = 200)
threeprime.bed(bed, upstreamWindow = 200, downstreamWindow = 200)
upstream.bed(bed, upstreamWindow = 500)
downstream.bed(bed, downstreamWindow = 500)



cleanEx()
nameEx("bpQuery.bigWig")
### * bpQuery.bigWig

flush(stderr()); flush(stdout())

### Name: bpQuery.bigWig
### Title: Query bigWig Files Containing Base Pair Data
### Aliases: bpQuery.bigWig region.bpQuery.bigWig bed.region.bpQuery.bigWig
###   bed6.region.bpQuery.bigWig step.bpQuery.bigWig
###   bed.step.bpQuery.bigWig bed6.step.bpQuery.bigWig
### Keywords: bigWig query

### ** Examples

bw <- load.bigWig(system.file("extdata", "test_probe_bp.bigWig", package = "bigWig"))

# single-region query
region.bpQuery.bigWig(bw, "chrB", 0, 20, op = "sum")

# BED data frame query
bed <- data.frame(chrom = "chrB", start = 0L, end = 20L)
bed.region.bpQuery.bigWig(bw, bed, op = "sum")

# step query
step.bpQuery.bigWig(bw, "chrB", 0, 20, step = 5, op = "sum")

unload.bigWig(bw)



cleanEx()
nameEx("bwMap")
### * bwMap

flush(stderr()); flush(stdout())

### Name: bwMap
### Title: Query mappability bigWig files
### Aliases: load.bwMap unload.bwMap print.bwMap region.bpQuery.bwMap
###   bed6.region.bpQuery.bwMap step.bpQuery.bwMap bed6.step.bpQuery.bwMap
### Keywords: bwMap bpQuery

### ** Examples

## bwMap requires a mappability bigWig file (values 0/1 per position).
## The following illustrates typical usage with such a file:
## Not run: 
##D   bwmap <- load.bwMap("mappability.bigWig", read.len = 50,
##D                       read.left.edge = TRUE)
##D   print(bwmap)
##D   unload.bwMap(bwmap)
## End(Not run)



cleanEx()
nameEx("foreach.bed")
### * foreach.bed

flush(stderr()); flush(stdout())

### Name: foreach.bed
### Title: Foreach loop for BED files (data.frames)
### Aliases: foreach.bed
### Keywords: bigWig foreach

### ** Examples

#
# Silly example to compute sizes of Bed entries
#
# Obviously "sizes = bed[,3] - bed[,2]" is much faster than this.
#
sizes.bed <- function(bed) {
  N = dim(bed)[1]
  sizes = vector(mode="integer", length=N)

  foreach.bed(bed, function(i, chrom, start, end, strand) {
    sizes[i] <<- end - start
  })

  return(sizes)
}



cleanEx()
nameEx("load.bigWig")
### * load.bigWig

flush(stderr()); flush(stdout())

### Name: load.bigWig
### Title: Load bigWig Files
### Aliases: load.bigWig
### Keywords: bigWig load read

### ** Examples

bw_file <- system.file("extdata", "test3_chrU.bigWig", package = "bigWig")
bw <- load.bigWig(bw_file)
print(bw)
unload.bigWig(bw)



cleanEx()
nameEx("mat.scale")
### * mat.scale

flush(stderr()); flush(stdout())

### Name: mat.scale
### Title: Data Matrix Scalling Utility Functions
### Aliases: rpkm.scale densityToOne.scale maxToOne.scale zeroToOne.scale

### ** Examples

mat <- matrix(c(10, 20, 30, 40, 50, 60), nrow = 2)
rpkm.scale(mat, step = 10, libSize = 1e7)
densityToOne.scale(mat)
maxToOne.scale(mat)
zeroToOne.scale(mat)



cleanEx()
nameEx("plots.bigWig")
### * plots.bigWig

flush(stderr()); flush(stdout())

### Name: plots.bigWig
### Title: Plot meta-profile(s)
### Aliases: plot.metaprofile
### Keywords: bigWig metaprofile plot

### ** Examples

bw <- load.bigWig(system.file("extdata", "test_probe_bp.bigWig", package = "bigWig"))
bed <- data.frame(chrom = "chrP", start = 0L, end = 50L)
prof <- metaprofile.bigWig(bed, bw)
unload.bigWig(bw)



cleanEx()
nameEx("print.bigWig")
### * print.bigWig

flush(stderr()); flush(stdout())

### Name: print.bigWig
### Title: Print Information on bigWig Files
### Aliases: print.bigWig print
### Keywords: bigWig print

### ** Examples

bw <- load.bigWig(system.file("extdata", "test3_chrU.bigWig", package = "bigWig"))
print(bw)
unload.bigWig(bw)



cleanEx()
nameEx("probeQuery.bigWig")
### * probeQuery.bigWig

flush(stderr()); flush(stdout())

### Name: probeQuery.bigWig
### Title: Query bigWig Files Containing Probe Data
### Aliases: probeQuery.bigWig region.probeQuery.bigWig
###   bed.region.probeQuery.bigWig bed6.region.probeQuery.bigWig
###   step.probeQuery.bigWig bed.step.probeQuery.bigWig
###   bed6.step.probeQuery.bigWig
### Keywords: bigWig query

### ** Examples

bw <- load.bigWig(system.file("extdata", "test_probe_bp.bigWig", package = "bigWig"))

# single-region probe query
region.probeQuery.bigWig(bw, "chrP", 0, 50, op = "wavg")

# BED query
bed <- data.frame(chrom = "chrP", start = 0L, end = 50L)
bed.region.probeQuery.bigWig(bw, bed, op = "sum")

# step query
step.probeQuery.bigWig(bw, "chrP", 0, 50, step = 5, op = "wavg")

unload.bigWig(bw)



cleanEx()
nameEx("profiles")
### * profiles

flush(stderr()); flush(stdout())

### Name: profiles
### Title: Data Profile Utility Functions
### Aliases: quantiles.metaprofile subsampled.quantiles.metaprofile
###   confinterval.metaprofile bootstrapped.confinterval.metaprofile
###   metaprofile.bigWig

### ** Examples

bw <- load.bigWig(system.file("extdata", "test_probe_bp.bigWig", package = "bigWig"))
bed <- data.frame(chrom = "chrP", start = 0L, end = 50L)
mat <- bed.step.bpQuery.bigWig(bw, bed, step = 5, as.matrix = TRUE)
quantiles.metaprofile(mat)
confinterval.metaprofile(mat)
unload.bigWig(bw)



cleanEx()
nameEx("query.bigWig")
### * query.bigWig

flush(stderr()); flush(stdout())

### Name: query.bigWig
### Title: Query bigWig Files
### Aliases: query.bigWig
### Keywords: bigWig query

### ** Examples

bw <- load.bigWig(system.file("extdata", "test3_chrU.bigWig", package = "bigWig"))
query.bigWig(bw, "chrU", 0, 50)
unload.bigWig(bw)



cleanEx()
nameEx("unload.bigWig")
### * unload.bigWig

flush(stderr()); flush(stdout())

### Name: unload.bigWig
### Title: Unload bigWig Files
### Aliases: unload.bigWig
### Keywords: bigwig unload free

### ** Examples

bw <- load.bigWig(system.file("extdata", "test3_chrU.bigWig", package = "bigWig"))
unload.bigWig(bw)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
