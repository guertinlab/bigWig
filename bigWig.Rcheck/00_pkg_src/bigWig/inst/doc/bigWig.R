## ----eval=FALSE---------------------------------------------------------------
# #install devtools if necessary
# install.packages("devtools")
# 
# devtools::install_github('andrelmartins/bigWig',
#               subdir='bigWig')

## ----eval=FALSE---------------------------------------------------------------
# 
# setwd('bigWig-master')
# system('R CMD INSTALL bigWig')
# 

## ----setup--------------------------------------------------------------------
library(bigWig)

## ----eval=FALSE---------------------------------------------------------------
# load.bigWig(filename, udcDir = NULL)

## ----eval=FALSE---------------------------------------------------------------
# #load bigWig into variable bw
# setwd('./bigWig')
# 
# bw=load.bigWig('../inst/extdata/bp.bigWig')

## ----eval=TRUE, echo=FALSE----------------------------------------------------
bw=load.bigWig('../inst/extdata/bp.bigWig')

## ----eval=TRUE----------------------------------------------------------------
# list all attributes
attributes(bw)

#access an individual attribute
bw$basesCovered

## ----eval=TRUE----------------------------------------------------------------
print.bigWig(bw)

## ----eval=FALSE---------------------------------------------------------------
# unload.bigWig(bw)

## ----eval=TRUE----------------------------------------------------------------
#destroy C object
unload.bigWig(bw)
ls()
#remove variable in R
remove(bw)
ls()

## ----bigWigs, echo = FALSE, message=FALSE, fig.align='center', fig.cap='Structured bigWig files. Three bigWig files with identical values at each position are structured differently to later highlight the differences between *Query.bigWig functions.', out.width = "80%"----
knitr::include_graphics("../inst/fig/bigWigProbesBp.pdf")

## ----eval = FALSE-------------------------------------------------------------
# query.bigWig(bigWig, chrom, start, end, clip = TRUE)

## ----eval=TRUE----------------------------------------------------------------
# load the three bigWigs
bw.bp = load.bigWig('../inst/extdata/bp.bigWig')
bw.probes = load.bigWig('../inst/extdata/probes.bigWig')
bw.splitprobes = load.bigWig('../inst/extdata/splitprobes.bigWig')

#note differences in the bigWig structures
query.bigWig(bw.probes, 'chr1', 100, 115)
query.bigWig(bw.splitprobes, 'chr1', 100, 115)
query.bigWig(bw.bp, chrom='chr1',start=100, end=115)

## ----eval=TRUE----------------------------------------------------------------
query.bigWig(bw.probes, 'chr1', 104, 111, clip=FALSE)
query.bigWig(bw.probes, 'chr1', 104, 111, clip=TRUE)

## ----eval=TRUE----------------------------------------------------------------
bw.probes.Q = query.bigWig(bw.probes, 'chr1', 100, 115)

## ----eval=TRUE----------------------------------------------------------------
bw.probes.Q[1,]

## ----eval=TRUE----------------------------------------------------------------
bw.probes.Q[1,2]

## ----eval=TRUE----------------------------------------------------------------
bw.probes.Q[1,'start']

## ----eval=FALSE---------------------------------------------------------------
# region.bpQuery.bigWig(bw, chrom, start, end, strand = NA
#                        op = "sum", abs.value = FALSE,
#                        gap.value = 0, bwMap = NULL)
# 
# region.probeQuery.bigWig(bw, chrom, start, end,
#                        op = "wavg", abs.value = FALSE,
#                        gap.value = NA)

## ----eval=TRUE----------------------------------------------------------------
region.probeQuery.bigWig(bw.probes, 'chr1', 100, 115, op = 'sum')
region.probeQuery.bigWig(bw.splitprobes, 'chr1', 100, 115, op = 'sum')
region.probeQuery.bigWig(bw.bp, 'chr1', 100, 115, op = 'sum')

## ----eval=TRUE----------------------------------------------------------------
region.bpQuery.bigWig(bw.probes, 'chr1', 100, 115, op = 'sum')
region.bpQuery.bigWig(bw.splitprobes, 'chr1', 100, 115, op = 'sum')
region.bpQuery.bigWig(bw.bp, 'chr1', 100, 115, op = 'sum')

## ----eval=TRUE----------------------------------------------------------------
region.bpQuery.bigWig(bw.probes,'chr1', 100, 115, op='max')
region.probeQuery.bigWig(bw.probes,'chr1', 100, 115, op='max')

## ----eval=TRUE----------------------------------------------------------------
region.bpQuery.bigWig(bw.probes, 'chr1', 100, 115, op='min')
region.probeQuery.bigWig(bw.probes, 'chr1', 100, 115, op='min')

## ----eval=TRUE----------------------------------------------------------------
region.bpQuery.bigWig(bw.splitprobes,'chr1', 100, 115, op='avg')
region.probeQuery.bigWig(bw.splitprobes,'chr1', 100, 112, op='avg')

## ----eval=TRUE----------------------------------------------------------------
region.bpQuery.bigWig(bw.probes,'chr1', 85, 115, op='avg')
region.probeQuery.bigWig(bw.probes,'chr1', 85, 115, op='avg')

## ----eval=TRUE----------------------------------------------------------------
region.probeQuery.bigWig(bw.splitprobes,'chr1', 102, 109, op='avg')
region.probeQuery.bigWig(bw.splitprobes,'chr1', 102, 109, op='wavg')

## ----eval=TRUE----------------------------------------------------------------
region.probeQuery.bigWig(bw.probes,'chr1', 100, 111, op='wavg')

## ----eval=TRUE----------------------------------------------------------------
query.bigWig(bw.probes,'chr1', 80, 90)

## ----eval=TRUE----------------------------------------------------------------
region.probeQuery.bigWig(bw.probes, 'chr1', 80, 90, op = 'sum')
region.bpQuery.bigWig(bw.probes, 'chr1', 80, 90, op='sum')

## ----eval=TRUE----------------------------------------------------------------
region.probeQuery.bigWig(bw.probes, 'chr1', 80, 90, op = 'sum', gap.value=1)
region.bpQuery.bigWig(bw.probes, 'chr1', 80, 90, op = 'avg', gap.value=100)

## ----eval =TRUE, echo=TRUE----------------------------------------------------
bed=read.table('../inst/extdata/testBED1.bed',
             header=FALSE, sep='\t', stringsAsFactors=FALSE)
bed

## ----eval =TRUE, echo=TRUE----------------------------------------------------

bed6=read.table('../inst/extdata/testBED1_strand.bed',
             header=FALSE, sep='\t', stringsAsFactors=FALSE)
bed6

## ----eval=FALSE---------------------------------------------------------------
# center.bed(bed, upstreamWindow, downstreamWindow)
# 
# fiveprime.bed(bed, upstreamWindow, downstreamWindow)
# 
# threeprime.bed(bed, upstreamWindow, downstreamWindow)

## ----eval=TRUE----------------------------------------------------------------
bed6

## ----eval=TRUE----------------------------------------------------------------
center.bed(bed6, upstreamWindow = 0, downstreamWindow = 0)

## ----eval=TRUE----------------------------------------------------------------
center.bed(bed, upstreamWindow = 5, downstreamWindow = 5)

## ----eval=TRUE----------------------------------------------------------------
fiveprime.bed(bed, upstreamWindow = 0, downstreamWindow = 0)
threeprime.bed(bed, upstreamWindow = 0, downstreamWindow = 0)

## ----eval=TRUE----------------------------------------------------------------
fiveprime.bed(bed, upstreamWindow = 1, downstreamWindow = 5)
threeprime.bed(bed, upstreamWindow = 1, downstreamWindow = 5)

## ----eval=TRUE----------------------------------------------------------------
fiveprime.bed(bed6, upstreamWindow=4, downstreamWindow=2)
threeprime.bed(bed6, upstreamWindow=4, downstreamWindow=2)

## ----eval=FALSE---------------------------------------------------------------
# downstream.bed(bed, downstreamWindow)
# 
# upstream.bed(bed, upstreamWindow)
# 

## ----eval=TRUE----------------------------------------------------------------
downstream.bed(bed6,5)
upstream.bed(bed6,5)

## ----eval=FALSE---------------------------------------------------------------
# foreach.bed(bed, func, envir = parent.frame())

## ----eval=TRUE----------------------------------------------------------------
sizes.bed <- function(bed) {
  N = dim(bed)[1]
  sizes = vector(mode="integer", length=N)

foreach.bed(bed, function(i, chrom, start, end, strand) {
    sizes[i] <<- end - start
  })

  return(sizes)
}
sizes.bed(bed)

## ----eval=FALSE---------------------------------------------------------------
# bed.region.bpQuery.bigWig(bw, bed, strand = NA,
#                           op = "sum", abs.value = FALSE,
#                           gap.value = 0, bwMap = NULL)
# bed.region.probeQuery.bigWig(bw, bed, op = "wavg",
#                           abs.value = FALSE, gap.value = NA)

## ----eval=TRUE----------------------------------------------------------------
bed.region.bpQuery.bigWig(bw.bp, bed6)
bed.region.probeQuery.bigWig(bw.bp, bed6)

## ----eval=FALSE---------------------------------------------------------------
# bed6.region.bpQuery.bigWig(bw.plus, bw.minus, bed6,
#                  op = "sum", abs.value = FALSE, gap.value = 0, bwMap = NULL)
# 
# bed6.region.probeQuery.bigWig(bw.plus, bw.minus, bed6,
#                  op = "wavg", abs.value = FALSE, gap.value = NA)

## ----eval=TRUE----------------------------------------------------------------
bwPlus=load.bigWig('../inst/extdata/bpPlus.bigWig')
bwMinus=load.bigWig('../inst/extdata/bpMinus.bigWig')

## ----bigWigPlusMinus, echo = FALSE, message=FALSE, fig.align='center', fig.cap='Stranded bigWig files. Two bigWig files contain values that are strand-specific to highlight the bed6 functions.', out.width = "80%"----
knitr::include_graphics("../inst/fig/bigWigPlusMinus.pdf")

## ----eval=TRUE----------------------------------------------------------------
query.bigWig(bwMinus, chrom='chr1', start=100, end=115)
query.bigWig(bwPlus, chrom='chr1', start=100, end=115)

## ----eval=TRUE----------------------------------------------------------------
#bed6 structure
bed6
bed6.region.bpQuery.bigWig(bwPlus, bwMinus, bed6)
bed6.region.probeQuery.bigWig(bwPlus, bwMinus, bed6)

## ----eval=FALSE---------------------------------------------------------------
# step.bpQuery.bigWig(bw, chrom, start, end, step,
#                     strand = NA, op = "sum", abs.value = FALSE, gap.value = 0,
#                     bwMap = NULL, with.attributes = TRUE)
# 
# step.probeQuery.bigWig(bw, chrom, start, end, step,
#                     op = "wavg", abs.value = FALSE, gap.value = NA,
#                     with.attributes = TRUE)

## ----eval=TRUE----------------------------------------------------------------
step.probeQuery.bigWig(bw.probes, 'chr1', 100, 115, op = 'sum', step=5)
step.bpQuery.bigWig(bw.probes, 'chr1', 100, 115, op = 'sum', step=5)

step.bp.bw.probes = step.bpQuery.bigWig(bw.probes, 'chr1', 100, 115,
op = 'sum', step=5)
attributes(step.bp.bw.probes)$step

## ----eval=FALSE---------------------------------------------------------------
# bed.step.bpQuery.bigWig(bw, bed, step,
#                 strand = NA, op = "sum", abs.value = FALSE, gap.value = 0,
#                 bwMap = NULL, with.attributes = TRUE, as.matrix = FALSE)
# 
# bed.step.probeQuery.bigWig(bw, bed, step,
#                 op = "wavg", abs.value = FALSE, gap.value = NA,
#                 bwMap = NULL, with.attributes = TRUE, as.matrix = FALSE)

## ----eval=TRUE----------------------------------------------------------------
#generate a bed
bed.step=data.frame('chr1',100,106)
bed.step[2,] = c('chr1',109,115)
bed.step[,2] = as.numeric(bed.step[,2])
bed.step[,3] = as.numeric(bed.step[,3])
colnames(bed.step)=c('chrom', 'start', 'end')

bed.step.bpQuery.bigWig(bw.splitprobes, bed.step, step = 2,
                       with.attributes = FALSE)
bed.step.bpQuery.bigWig(bw.splitprobes, bed.step, step = 2,
                       as.matrix=TRUE)


## ----eval=FALSE---------------------------------------------------------------
# 
# bed6.step.bpQuery.bigWig(bw.plus, bw.minus, bed6, step,
#                        op = "sum", abs.value = FALSE, gap.value = 0,
#                        bwMap = NULL, with.attributes = TRUE,
#                        as.matrix = FALSE, follow.strand = FALSE)
# 
# bed6.step.probeQuery.bigWig(bw.plus, bw.minus, bed6, step,
#                        op = "wavg", abs.value = FALSE, gap.value = NA,
#                        with.attributes = TRUE, as.matrix = FALSE,
#                        follow.strand = FALSE)

## ----eval=TRUE----------------------------------------------------------------
plusPRO=load.bigWig('../inst/extdata/plusPRO.bigWig')
minusPRO=load.bigWig('../inst/extdata/minusPRO.bigWig')
bedTSS=read.table(gzfile("../inst/extdata/TSS.bed.gz"))

bedTSSwindow=fiveprime.bed(bedTSS, upstreamWindow = 249,
                  downstreamWindow = 250)

tss.matrix = bed6.step.bpQuery.bigWig(plusPRO, minusPRO, bedTSSwindow,
                  step = 50, as.matrix=TRUE, follow.strand=TRUE)
colnames(tss.matrix) = seq(-225, 274, by = 50)
rownames(tss.matrix) = bedTSSwindow[,5]

#filter out genes that have no signal
tss.matrix=tss.matrix[rowSums(tss.matrix) != 0,]
head(tss.matrix)

## ----followstrand, eval=TRUE, fig.cap ="Feature-stranded composite profile. The RNA Polymerase peak results from the accumulation of reads that originate from the coding strand orientation. Therefore, it makes sense to orient the reads relative to the TSS position."----
plot(seq(-225, 274, by = 50),colMeans(tss.matrix),
                  xlab = 'stranded TSS position',
                  ylab = 'bigWig intensity', type = "l")

## ----nofollowstrand, eval=TRUE, fig.cap ="Absolute-stranded composite profile. Since a comparable number of genes are oriented in the plus and minus orientatino relative to teh reference genome, the peak downstream of the TSS is split if absolute genomic coordinate is followed."----


tss.matrix.notStrand = bed6.step.bpQuery.bigWig(plusPRO, minusPRO,
                  bedTSSwindow, step = 50, as.matrix=TRUE,
                  follow.strand=FALSE)
tss.matrix.notStrand = tss.matrix.notStrand[rowSums(tss.matrix.notStrand) != 0,]

plot(seq(-225, 274, by = 50),colMeans(tss.matrix.notStrand),
                  xlab = 'absolute TSS position',
                  ylab = 'bigWig intensity', type = "l")


## ----eval=FALSE---------------------------------------------------------------
# load.bwMap(filename, read.len, read.left.edge,
#                           threshold.fraction = 0, udcDir=NULL)
# 

## ----eval=FALSE---------------------------------------------------------------
# unload.bwMap(bwMap)
# region.bpQuery.bwMap(bwMap, chrom, start, end, strand, op = "thresh")
# 
# bed6.region.bpQuery.bwMap(bwMap, bed6, op = "thresh")
# 
# step.bpQuery.bwMap(bwMap, chrom, start, end, step, strand,
#                op = "thresh", with.attributes = TRUE)
# 
# bed6.step.bpQuery.bwMap(bwMap, bed6, step,
#               op = "thresh", with.attributes = FALSE, as.matrix = FALSE)
# 

## ----bwMap, echo = FALSE, message=FALSE, fig.align='center', fig.cap='Mappability bigWig files. A) Mappability bigWig files contain a 1 at each postion in the genome that is not uniquely mappable. Note that the bigWig specifies the start of the k-mer (here a 30-mer) that corresponds to the plus strand sequence. B) The mappability bigWig file is often used in conjunction with typical bigWig data files. If the bigWig data file specifies the left-most or right-most base of the original sequence read, then the corresponding mappability file needs to specify the appropriate `read.left.edge` option. By doing so, the plus and minus reads are appropriately shifted by the mappability k-mer size.', out.width = "110%"----
knitr::include_graphics("../inst/fig/bwMap.pdf")

## ----eval=TRUE----------------------------------------------------------------

bwMap.right=load.bwMap('../inst/extdata/bwMap.bigWig',
                          read.len = 30, read.left.edge=FALSE)
bwMap.left=load.bwMap('../inst/extdata/bwMap.bigWig',
                          read.len = 30, read.left.edge=TRUE)


region.bpQuery.bwMap(bwMap.left, "chr1", 134, 135,
                          strand = "-", op = "sum")
region.bpQuery.bwMap(bwMap.left, "chr1", 105, 106,
                          strand = "+", op = "sum")

region.bpQuery.bwMap(bwMap.right, "chr1", 105, 106,
                          strand = "-", op = "sum")
region.bpQuery.bwMap(bwMap.right, "chr1", 134, 135,
                          strand = "+", op = "sum")

## ----eval=TRUE----------------------------------------------------------------

bwMap=load.bwMap('../inst/extdata/bwMap.bigWig',
                  read.len = 30, read.left.edge=FALSE,
                  threshold.fraction = 0.2)
region.bpQuery.bwMap(bwMap, "chr1", 130, 135, strand = "+", op = "avg")
region.bpQuery.bwMap(bwMap, "chr1", 130, 136, strand = "+", op = "avg")
region.bpQuery.bwMap(bwMap, "chr1", 130, 135, strand = "+", op = "thresh")
region.bpQuery.bwMap(bwMap, "chr1", 130, 136, strand = "+", op = "thresh")


## ----eval=TRUE----------------------------------------------------------------

bwMap.left = load.bwMap('../inst/extdata/bwMap.bigWig', read.len = 30,
                        read.left.edge=TRUE, threshold.fraction = 0.50)


region.bpQuery.bwMap(bwMap.left, "chr1", 105, 110, strand = '+')

## ----eval=TRUE----------------------------------------------------------------
region.bpQuery.bigWig(bwPlus, "chr1", 105, 110, strand = '+',
                      bwMap = bwMap.left)
region.bpQuery.bigWig(bwPlus, "chr1", 105, 108, strand = '+',
                      bwMap = bwMap.left)



## ----eval=TRUE----------------------------------------------------------------

bwMap.thresh = load.bwMap('../inst/extdata/bwMap.bigWig', read.len = 30,
                        read.left.edge=TRUE, threshold.fraction = 0)

bed.region.bpQuery.bigWig(bwPlus, bed6, strand = '+',
                          bwMap = bwMap.thresh)

bed.region.bpQuery.bigWig(bwPlus, bed6, strand = '-',
                          bwMap = bwMap.thresh)

bed6.region.bpQuery.bigWig(bwPlus, bwMinus, bed6, 
                          bwMap = bwMap.thresh)


## ----eval=TRUE----------------------------------------------------------------

step.bpQuery.bigWig(bwPlus, 'chr1', 104, 110, step =1)

step.bpQuery.bigWig(bwPlus, 'chr1', 104, 110, step =1,
                    strand = '+', bwMap = bwMap.thresh)


bed.step.bpQuery.bigWig(bwPlus, bed6, step = 1,
                        strand = '+', bwMap = bwMap.thresh,
                        with.attributes=FALSE)

bed6.step.bpQuery.bigWig(bwPlus, bwMinus, bed6, step = 1,
                         bwMap = bwMap.thresh,
                         with.attributes=FALSE)


## ----eval=FALSE---------------------------------------------------------------
# quantiles.metaprofile(mat, quantiles = c(0.875, 0.5, 0.125))
# 
# subsampled.quantiles.metaprofile(mat, quantiles = c(0.875, 0.5, 0.125),
#             fraction = 0.10, n.samples = 1000)
# 
# confinterval.metaprofile(mat, alpha = 0.05)
# 
# bootstrapped.confinterval.metaprofile(mat, alpha = 0.05, n.samples = 300)
# 
# metaprofile.bigWig(bed, bw.plus, bw.minus = NULL, step = 1,
#            name = "Signal", matrix.op = NULL,
#            profile.op = subsampled.quantiles.metaprofile, ...)

## ----eval=TRUE----------------------------------------------------------------
quantiles.metaprofile(tss.matrix, quantiles = c(0.95, 0.5, 0.05))

## ----eval=TRUE----------------------------------------------------------------
subsampled.quantiles.metaprofile(tss.matrix,
            quantiles = c(0.875, 0.5, 0.125), fraction = 0.20,
            n.samples = 1000)

## ----eval=TRUE----------------------------------------------------------------
confinterval.metaprofile(tss.matrix, alpha = 0.05)

## ----eval=TRUE----------------------------------------------------------------
bootstrapped.confinterval.metaprofile(tss.matrix, alpha = 0.05,
                                         n.samples = 300)

## ----eval=TRUE----------------------------------------------------------------
metaprofile.bigWig(bedTSSwindow, plusPRO, bw.minus = minusPRO,
                 step = 50, name = "Signal", matrix.op = NULL,
                 profile.op = quantiles.metaprofile)

## ----eval=TRUE----------------------------------------------------------------
metaprofile.bigWig(bedTSSwindow, plusPRO, bw.minus = minusPRO,
                 step = 50, name = "Signal", matrix.op = NULL,
                 profile.op = bootstrapped.confinterval.metaprofile,
                 alpha=0.05, n.samples=1000)

## ----eval=FALSE---------------------------------------------------------------
# 
# plot.metaprofile(x, minus.profile = NULL, X0 = x$X0,
#       draw.error = TRUE, col = c("red", "blue", "lightgrey", "lightgrey"),
#       ylim = NULL, xlim = NULL, xlab = "Distance (bp)", ylab = x$name)

## ----metaprofile, eval=TRUE, fig.cap ="Composite metagene profiles of RNA polymerase density. PRO-seq signal accumulates at the RNA pausing site downstream of the TSS and there is a divergent RNA polymerse peak in the opposite orientation."----

x = metaprofile.bigWig(bedTSSwindow, plusPRO, bw.minus = minusPRO,
                 step = 50, name = "Signal", matrix.op = NULL,
                 profile.op = bootstrapped.confinterval.metaprofile,
                 alpha=0.05, n.samples=1000)

y = metaprofile.bigWig(bedTSSwindow, minusPRO, bw.minus = plusPRO,
                 step = 50, name = "Signal", matrix.op = NULL,
                 profile.op = bootstrapped.confinterval.metaprofile,
                 alpha=0.05, n.samples=1000)

plot.metaprofile(x, minus.profile = y, X0 = 275,
      draw.error = TRUE, col = c("red", "blue", "lightgrey", "lightgrey"),
      ylim = NULL, xlim = c(-225,225), xlab = "Distance (bp)",
      ylab = "PRO-seq signal")


## ----eval=FALSE---------------------------------------------------------------
# rpkm.scale(mat, step, libSize)
# 
# densityToOne.scale(mat, na.on.zero = TRUE)
# 
# maxToOne.scale(mat)
# 
# zeroToOne.scale(mat)

## ----eval=TRUE----------------------------------------------------------------

sizeLibrary= (plusPRO$basesCovered * plusPRO$mean) +
              (minusPRO$basesCovered * minusPRO$mean)
rpkm.matrix = rpkm.scale(tss.matrix, step=10, libSize=sizeLibrary)

head(rpkm.matrix)

## ----eval=TRUE----------------------------------------------------------------
mat1=matrix(c(0,2,23,6,0,9,2,3,0,5,17,68,0,4,24,9), nrow=4, ncol=4)
mat1

densityToOne.scale(mat1, na.on.zero = FALSE)

## ----eval=TRUE----------------------------------------------------------------
maxToOne.scale(mat1)

## ----echo=TRUE----------------------------------------------------------------
mat2=matrix(c(0,2,23,6,0,2,2,3,0,2,17,68,0,2,24,9), nrow=4, ncol=4)

maxToOne.scale(mat2)


## ----eval=TRUE----------------------------------------------------------------

zeroToOne.scale(mat2)


## ----eval=FALSE---------------------------------------------------------------
# metaprofile.bigWig(bed6, bw.plus, bw.minus = bw.minus, step = 1,
#                   name = "Signal", matrix.op = zeroToOne.scale)

## ----eval=TRUE, fig.cap ="Composite PRO-seq profiles."------------------------
composite.plus = metaprofile.bigWig(bedTSSwindow, plusPRO,
                 bw.minus = minusPRO, step = 10, name = "Signal",
                 matrix.op = zeroToOne.scale,
                 profile.op = bootstrapped.confinterval.metaprofile,
                 alpha = 0.05, n.samples = 200)

composite.min = metaprofile.bigWig(bedTSSwindow, minusPRO,
                 bw.minus = plusPRO, step = 10, name = "Signal",
                 matrix.op = zeroToOne.scale,
                 profile.op = bootstrapped.confinterval.metaprofile,
                 alpha = 0.05, n.samples = 200)

plot.metaprofile(composite.plus, minus.profile = composite.min, X0 = 255,
      draw.error = TRUE, col = c("red", "blue", "lightgrey", "lightgrey"),
      xlab = "Distance (bp)", ylab = "PRO-seq signal")


## ----sessionInfo--------------------------------------------------------------
sessionInfo()

