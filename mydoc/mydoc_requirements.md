---
title: Requirements
keywords:
last_updated: Fri Jul  1 16:14:54 2016
---

## Laptops

Users are expected to bring a laptop with a functional wireless connection and
a recent internet browser version (e.g. Firefox, Chrome or Safari)
preinstalled. Tablet computers with mobile operating systems are not suitable
for running the required software.  If your laptop has special firewall
settings (e.g. company owned laptops), then please make sure you know how to
administer your firewall settings (e.g. lower restrictions or turn on/off) to
allow `biocLite` installs. 


## Software Installs

In addition, please follow the software install instructions 
for this event as outlined below. 

1. Install latest R Version 3.3.1 from here: [(http://www.r-project.org](http://www.r-project.org/)
2. Next, install RStudio from here: [http://rstudio.org](http://rstudio.org/) 
3. IGV (Integrative Genomics Viewer) will be used for a short demonstration: [http://www.broadinstitute.org/igv](http://www.broadinstitute.org/igv). This install is optional.

## R Packages

To install the R/Bioconductor libraries required for this course module, please copy &
paste the following commands into your RStudio (or the R) console and execute
them with the enter key. 

(1) Install of Bioconductor base packages

```r
source("http://bioconductor.org/biocLite.R")
biocLite()
```

(2) Check for correct R and Bioc versions

```r
sessionInfo() # Note: this needs to return R Version 3.3.1!!
source("http://bioconductor.org/biocLite.R")
biocVersion() # Note: this should return Bioc Version '3.3' or higher!!
# biocLite("BiocUpgrade") # Run this command if your Bioc version is outdated
```

(3) Install specific packages required for this course. Note, the install of the sample data (last line) may take some time.

```r
source("http://bioconductor.org/biocLite.R")
install.packages(c("ggplot2", "lattice", "ape", "gplots"))
biocLite(c("BiocStyle", "ggbio", "ShortRead", "Biostrings", "IRanges", "BSgenome", "rtracklayer", "Rsamtools", "GenomicRanges", "GenomicAlignments", "DESeq2", "edgeR", "AnnotationDbi", "Rsubread", "systemPipeR"))
biocLite("tgirke/systemPipeRdata", build_vignettes=TRUE, dependencies=TRUE)
```
