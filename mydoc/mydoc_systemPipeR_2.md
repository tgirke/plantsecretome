---
title: Getting Started
keywords: 
last_updated: Sat Jul  9 09:20:33 2016
---

## Installation

The R software for running [_`systemPipeR`_](http://www.bioconductor.org/packages/devel/bioc/html/systemPipeR.html) can be downloaded from [_CRAN_](http://cran.at.r-project.org/). The _`systemPipeR`_ environment can be installed from the R console using the _`biocLite`_ install command. The associated data package [_`systemPipeRdata`_](https://github.com/tgirke/systemPipeRdata) can be installed the same way. The latter is a helper package for generating _`systemPipeR`_ workflow environments with a single command containing all parameter files and sample data required to quickly test and run workflows. 

    

{% highlight r %}
source("http://bioconductor.org/biocLite.R") # Sources the biocLite.R installation script 
biocLite("systemPipeR") # Installs systemPipeR 
biocLite("systemPipeRdata") # Installs systemPipeRdata
{% endhighlight %}

## Loading package and documentation


{% highlight r %}
library("systemPipeR") # Loads the package
library(help="systemPipeR") # Lists package info
vignette("systemPipeR") # Opens vignette
{% endhighlight %}

## Load sample data and workflow templates
The mini sample FASTQ files used by this overview vignette as well as the associated workflow reporting vignettes can be loaded via the _`systemPipeRdata`_ package as shown below. The chosen data set [`SRP010938`](http://www.ncbi.nlm.nih.gov/sra/?term=SRP010938) contains 18 paired-end (PE) read sets from _Arabidposis thaliana_ (Howard et al., 2013). To minimize processing time during testing, each FASTQ file has been subsetted to 90,000-100,000 randomly sampled PE reads that map to the first 100,000 nucleotides of each chromosome of the _A. thalina_ genome. The corresponding reference genome sequence (FASTA) and its GFF annotion files (provided in the same download) have been truncated accordingly. This way the entire test sample data set requires less than 200MB disk storage space. A PE read set has been chosen for this test data set for flexibility, because it can be used for testing both types of analysis routines requiring either SE (single end) reads or PE reads. 

The following generates a fully populated _`systemPipeR`_ workflow environment (here for RNA-Seq) in the current working directory of an R session. At this time the package includes workflow templates for RNA-Seq, ChIP-Seq, VAR-Seq and Ribo-Seq. Templates for additional NGS applications will be provided in the future.

{% highlight r %}
library(systemPipeRdata)
genWorkenvir(workflow="rnaseq", bam=TRUE)
setwd("rnaseq")
{% endhighlight %}

## Download latest version of this tutorial

In case there is an updated version of this tutorial, download its `systemPipeRNAseq.Rmd` source.


{% highlight r %}
download.file("https://raw.githubusercontent.com/tgirke/CSHL_RNAseq/gh-pages/_vignettes/05_Rworkflows/systemPipeR.Rmd", "systemPipeR.Rmd")
{% endhighlight %}

Now open the R markdown script `systemPipeRNAseq.Rmd`in your R IDE (_e.g._ vim-r or RStudio) and 
run the workflow as outlined below. 

If you are on Windows please run the following command to move all input files into the right location. This problem will be fixed next week.


{% highlight r %}
file.copy(list.files("data/fastq/", "*", full.names=TRUE), "data")
file.copy(list.files("data/annotation/", "*", full.names=TRUE), "data", recursive=TRUE)
file.copy(list.files("results/bam/", "*", full.names=TRUE), "results")
{% endhighlight %}

The working environment of the sample data loaded in the previous step contains the following preconfigured directory structure. Directory names are indicated in  <span style="color:grey">_**grey**_</span>. Users can change this structure as needed, but need to adjust the code in their workflows accordingly. 

* <span style="color:grey">_**workflow/**_</span> (_e.g._ _rnaseq/_) 
    + This is the directory of the R session running the workflow.
    + Run script ( _\*.Rnw_ or _\*.Rmd_) and sample annotation (_targets.txt_) files are located here.
    + Note, this directory can have any name (_e.g._ <span style="color:grey">_**rnaseq**_</span>, <span style="color:grey">_**varseq**_</span>). Changing its name does not require any modifications in the run script(s).
    + Important subdirectories: 
        + <span style="color:grey">_**param/**_</span> 
            + Stores parameter files such as: _\*.param_, _\*.tmpl_ and _\*\_run.sh_.
        + <span style="color:grey">_**data/**_ </span>
            + FASTQ samples 
            + Reference FASTA file
            + Annotations
            + etc.
        + <span style="color:grey">_**results/**_</span>
            + Alignment, variant and peak files (BAM, VCF, BED) 
            + Tabular result files
            + Images and plots
            + etc.


The following parameter files are included in each workflow template: 

1. _`targets.txt`_: initial one provided by user; downstream _`targets_*.txt`_ files are generated automatically
2. _`*.param`_: defines parameter for input/output file operations, _e.g._ _`trim.param`_, _`bwa.param`_, _`vartools.parm`_, ...
3. _`*_run.sh`_: optional bash script, _e.g._: _`gatk_run.sh`_
4. Compute cluster environment (skip on single machine):
    + _`.BatchJobs`_: defines type of scheduler for _`BatchJobs`_
    + _`*.tmpl`_: specifies parameters of scheduler used by a system, _e.g._ Torque, SGE, StarCluster, Slurm, etc.


## Structure of _`targets`_ file

The _`targets`_ file defines all input files (_e.g._ FASTQ, BAM, BCF) and sample comparisons of an analysis workflow. The following shows the format of a sample _`targets`_ file included in the package. It also can be viewed and downloaded from _`systemPipeR`_'s GitHub repository [here](https://github.com/tgirke/systemPipeR/blob/master/inst/extdata/targets.txt). In a target file with a single type of input files, here FASTQ files of single end (SE) reads, the first three columns are mandatory including their column names, while it is four mandatory columns for FASTQ files of PE reads. All subsequent columns are optional and any number of additional columns can be added as needed.

### Structure of _`targets`_ file for single end (SE) samples

{% highlight r %}
library(systemPipeR)
targetspath <- system.file("extdata", "targets.txt", package="systemPipeR") 
read.delim(targetspath, comment.char = "#")
{% endhighlight %}

{% highlight txt %}
##                    FileName SampleName Factor SampleLong Experiment        Date
## 1  ./data/SRR446027_1.fastq        M1A     M1  Mock.1h.A          1 23-Mar-2012
## 2  ./data/SRR446028_1.fastq        M1B     M1  Mock.1h.B          1 23-Mar-2012
## 3  ./data/SRR446029_1.fastq        A1A     A1   Avr.1h.A          1 23-Mar-2012
## 4  ./data/SRR446030_1.fastq        A1B     A1   Avr.1h.B          1 23-Mar-2012
## 5  ./data/SRR446031_1.fastq        V1A     V1   Vir.1h.A          1 23-Mar-2012
## 6  ./data/SRR446032_1.fastq        V1B     V1   Vir.1h.B          1 23-Mar-2012
## 7  ./data/SRR446033_1.fastq        M6A     M6  Mock.6h.A          1 23-Mar-2012
## 8  ./data/SRR446034_1.fastq        M6B     M6  Mock.6h.B          1 23-Mar-2012
## 9  ./data/SRR446035_1.fastq        A6A     A6   Avr.6h.A          1 23-Mar-2012
## 10 ./data/SRR446036_1.fastq        A6B     A6   Avr.6h.B          1 23-Mar-2012
## 11 ./data/SRR446037_1.fastq        V6A     V6   Vir.6h.A          1 23-Mar-2012
## 12 ./data/SRR446038_1.fastq        V6B     V6   Vir.6h.B          1 23-Mar-2012
## 13 ./data/SRR446039_1.fastq       M12A    M12 Mock.12h.A          1 23-Mar-2012
## 14 ./data/SRR446040_1.fastq       M12B    M12 Mock.12h.B          1 23-Mar-2012
## 15 ./data/SRR446041_1.fastq       A12A    A12  Avr.12h.A          1 23-Mar-2012
## 16 ./data/SRR446042_1.fastq       A12B    A12  Avr.12h.B          1 23-Mar-2012
## 17 ./data/SRR446043_1.fastq       V12A    V12  Vir.12h.A          1 23-Mar-2012
## 18 ./data/SRR446044_1.fastq       V12B    V12  Vir.12h.B          1 23-Mar-2012
{% endhighlight %}
To work with custom data, users need to generate a _`targets`_ file containing the paths to their own FASTQ files and then provide under _`targetspath`_ the path to the corresponding _`targets`_ file. 


### Structure of _`targets`_ file for paired end (PE) samples


{% highlight r %}
targetspath <- system.file("extdata", "targetsPE.txt", package="systemPipeR")
read.delim(targetspath, comment.char = "#")[1:2,1:6]
{% endhighlight %}

{% highlight txt %}
##                  FileName1                FileName2 SampleName Factor SampleLong Experiment
## 1 ./data/SRR446027_1.fastq ./data/SRR446027_2.fastq        M1A     M1  Mock.1h.A          1
## 2 ./data/SRR446028_1.fastq ./data/SRR446028_2.fastq        M1B     M1  Mock.1h.B          1
{% endhighlight %}

### Sample comparisons
Sample comparisons are defined in the header lines of the _`targets`_ file starting with '``# <CMP>``'. 


{% highlight r %}
readLines(targetspath)[1:4]
{% endhighlight %}

{% highlight txt %}
## [1] "# Project ID: Arabidopsis - Pseudomonas alternative splicing study (SRA: SRP010938; PMID: 24098335)"                                                                              
## [2] "# The following line(s) allow to specify the contrasts needed for comparative analyses, such as DEG identification. All possible comparisons can be specified with 'CMPset: ALL'."
## [3] "# <CMP> CMPset1: M1-A1, M1-V1, A1-V1, M6-A6, M6-V6, A6-V6, M12-A12, M12-V12, A12-V12"                                                                                             
## [4] "# <CMP> CMPset2: ALL"
{% endhighlight %}

The function _`readComp`_ imports the comparison information and stores it in a _`list`_. Alternatively, _`readComp`_ can obtain the comparison information from the corresponding _`SYSargs`_ object (see below). 
Note, these header lines are optional. They are mainly useful for controlling comparative analyses according to certain biological expectations, such as identifying differentially expressed genes in RNA-Seq experiments based on simple pair-wise comparisons.
 

{% highlight r %}
readComp(file=targetspath, format="vector", delim="-")
{% endhighlight %}

{% highlight txt %}
## $CMPset1
## [1] "M1-A1"   "M1-V1"   "A1-V1"   "M6-A6"   "M6-V6"   "A6-V6"   "M12-A12" "M12-V12" "A12-V12"
## 
## $CMPset2
##  [1] "M1-A1"   "M1-V1"   "M1-M6"   "M1-A6"   "M1-V6"   "M1-M12"  "M1-A12"  "M1-V12"  "A1-V1"  
## [10] "A1-M6"   "A1-A6"   "A1-V6"   "A1-M12"  "A1-A12"  "A1-V12"  "V1-M6"   "V1-A6"   "V1-V6"  
## [19] "V1-M12"  "V1-A12"  "V1-V12"  "M6-A6"   "M6-V6"   "M6-M12"  "M6-A12"  "M6-V12"  "A6-V6"  
## [28] "A6-M12"  "A6-A12"  "A6-V12"  "V6-M12"  "V6-A12"  "V6-V12"  "M12-A12" "M12-V12" "A12-V12"
{% endhighlight %}

## Structure of _`param`_ file and _`SYSargs`_ container
The _`param`_ file defines the parameters of a chosen command-line software. The following shows the format of a sample _`param`_ file provided by this package. 


{% highlight r %}
parampath <- system.file("extdata", "tophat.param", package="systemPipeR")
{% endhighlight %}

The _`systemArgs`_ function imports the definitions of both the _`param`_ file
and the _`targets`_ file, and stores all relevant information in a _`SYSargs`_
object (S4 class). To run the pipeline without command-line software, one can
assign _`NULL`_ to _`sysma`_ instead of a _`param`_ file. In addition, one can
start _`systemPipeR`_ workflows with pre-generated BAM files by providing a
targets file where the _`FileName`_ column provides the paths to the BAM files.
Note, in the following example the usage of _`suppressWarnings()`_ is only relevant for 
building this vignette. In typical workflows it should be removed.


{% highlight r %}
args <- suppressWarnings(systemArgs(sysma=parampath, mytargets=targetspath))
args
{% endhighlight %}

{% highlight txt %}
## An instance of 'SYSargs' for running 'tophat' on 18 samples
{% endhighlight %}

Several accessor methods are available that are named after the slot names of the _`SYSargs`_ object. 

{% highlight r %}
names(args)
{% endhighlight %}

{% highlight txt %}
##  [1] "targetsin"     "targetsout"    "targetsheader" "modules"       "software"      "cores"        
##  [7] "other"         "reference"     "results"       "infile1"       "infile2"       "outfile1"     
## [13] "sysargs"       "outpaths"
{% endhighlight %}

Of particular interest is the _`sysargs()`_ method. It constructs the system
commands for running command-lined software as specified by a given _`param`_
file combined with the paths to the input samples (_e.g._ FASTQ files) provided
by a _`targets`_ file. The example below shows the _`sysargs()`_ output for
running TopHat2 on the first PE read sample. Evaluating the output of
_`sysargs()`_ can be very helpful for designing and debugging _`param`_ files
of new command-line software or changing the parameter settings of existing
ones.  


{% highlight r %}
sysargs(args)[1]
{% endhighlight %}

{% highlight txt %}
##                                                                                                                                                                                                                                                                                                                        M1A 
## "tophat -p 4 -g 1 --segment-length 25 -i 30 -I 3000 -o /home/tgirke/Dropbox/Teaching/CSHL_RNAseq/CSHL_RNAseq/_vignettes/04_Rworkflows/results/SRR446027_1.fastq.tophat /home/tgirke/Dropbox/Teaching/CSHL_RNAseq/CSHL_RNAseq/_vignettes/04_Rworkflows/data/tair10.fasta ./data/SRR446027_1.fastq ./data/SRR446027_2.fastq"
{% endhighlight %}

{% highlight r %}
modules(args)
{% endhighlight %}

{% highlight txt %}
## [1] "bowtie2/2.2.5" "tophat/2.0.14"
{% endhighlight %}

{% highlight r %}
cores(args)
{% endhighlight %}

{% highlight txt %}
## [1] 4
{% endhighlight %}

{% highlight r %}
outpaths(args)[1]
{% endhighlight %}

{% highlight txt %}
##                                                                                                                                 M1A 
## "/home/tgirke/Dropbox/Teaching/CSHL_RNAseq/CSHL_RNAseq/_vignettes/04_Rworkflows/results/SRR446027_1.fastq.tophat/accepted_hits.bam"
{% endhighlight %}

The content of the _`param`_ file can also be returned as JSON object as follows (requires _`rjson`_ package).

{% highlight r %}
systemArgs(sysma=parampath, mytargets=targetspath, type="json")
{% endhighlight %}

{% highlight txt %}
## [1] "{\"modules\":{\"n1\":\"\",\"v2\":\"bowtie2/2.2.5\",\"n1\":\"\",\"v2\":\"tophat/2.0.14\"},\"software\":{\"n1\":\"\",\"v1\":\"tophat\"},\"cores\":{\"n1\":\"-p\",\"v1\":\"4\"},\"other\":{\"n1\":\"\",\"v1\":\"-g 1 --segment-length 25 -i 30 -I 3000\"},\"outfile1\":{\"n1\":\"-o\",\"v2\":\"<FileName1>\",\"n3\":\"path\",\"v4\":\"./results/\",\"n5\":\"remove\",\"v1\":\"\",\"n2\":\"append\",\"v3\":\".tophat\",\"n4\":\"outextension\",\"v5\":\".tophat/accepted_hits.bam\"},\"reference\":{\"n1\":\"\",\"v1\":\"./data/tair10.fasta\"},\"infile1\":{\"n1\":\"\",\"v2\":\"<FileName1>\",\"n1\":\"path\",\"v2\":\"\"},\"infile2\":{\"n1\":\"\",\"v2\":\"<FileName2>\",\"n1\":\"path\",\"v2\":\"\"}}"
{% endhighlight %}

