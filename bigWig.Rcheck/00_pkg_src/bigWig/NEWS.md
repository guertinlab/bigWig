# bigWig News

## bigWig 0.99.0 (2026-10-26)

### New features

* Submitted to Bioconductor.

### Bug fixes and compatibility

* Fixed `Calloc()`/`Free()` → `R_Calloc()`/`R_Free()` in `src/utils_R.c`
  (macros removed in R 4.5.0).
* Fixed `class(x) == "bigWig"` → `inherits(x, "bigWig")` in R code
  (avoids length > 1 comparison in R 4.x).
* Fixed `bw.minus != NULL` → `!is.null(bw.minus)` in `R/profiles.R`.
* Fixed `MACHTYPE` detection in `src/bigwig.mk` to use `uname -m` instead
  of `R.version$arch`, resolving a Rosetta2 architecture mismatch on
  Apple Silicon.
* Fixed missing `follow_strand = FALSE` argument in
  `bed.region.bpQuery.bigWig()`.

### Documentation

* Added runnable `\\examples{}` sections to all man pages.
* Added `\\value` sections to `plots.bigWig.Rd`, `print.bigWig.Rd`,
  and `unload.bigWig.Rd`.
* Added `sessionInfo()` to vignette.

## bigWig 0.2-9 (2014-11-20)

* Original CRAN release by André Luís Martins.
