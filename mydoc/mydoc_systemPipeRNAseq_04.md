---
title: Alignments
keywords: 
last_updated: Sat Jul  9 09:06:03 2016
---

## Read mapping with `Bowtie2/Tophat2`
The NGS reads of this project will be aligned against the reference genome
sequence using `Bowtie2/TopHat2` (Kim et al., 2013; Langmead et al., 2012). The
parameter settings of the aligner are defined in the `tophat.param`
file.


{% highlight r %}
args <- systemArgs(sysma="param/tophat.param", mytargets="targets_trim.txt")
sysargs(args)[1] # Command-line parameters for first FASTQ file
{% endhighlight %}

Submission of alignment jobs to compute cluster, here using 72 CPU cores (18 `qsub` processes each with 4 CPU cores).


{% highlight r %}
moduleload(modules(args))
system("bowtie2-build ./data/tair10.fasta ./data/tair10.fasta")
resources <- list(walltime="20:00:00", nodes=paste0("1:ppn=", cores(args)), memory="10gb")
reg <- clusterRun(args, conffile=".BatchJobs.R", template="torque.tmpl", Njobs=18, runid="01", 
                  resourceList=resources)
waitForJobs(reg)
{% endhighlight %}

## Alignment with `Rsubread`
The following example shows how one can use within the `systemPipeR` environment the R-based
aligner `Rsubread` or other R-based functions that read from input files and write to output files.


{% highlight r %}
library(Rsubread)
args <- systemArgs(sysma="param/rsubread.param", mytargets="targets.txt")
buildindex(basename=reference(args), reference=reference(args)) # Build indexed reference genome
align(index=reference(args), readfile1=infile1(args), input_format="FASTQ",
      output_file=outfile1(args), output_format="SAM", nthreads=2)
for(i in seq(along=outfile1(args))) asBam(file=outfile1(args)[i], destination=gsub(".sam", "", outfile1(args)[i]), overwrite=TRUE, indexDestination=TRUE)
unlink(outfile1(args)); unlink(paste0(outfile1(args),".indel"))
{% endhighlight %}

## Read mapping with `HISAT2`


{% highlight r %}
args <- systemArgs(sysma="param/hisat2.param", mytargets="targets.txt")
# args <- systemArgs(sysma="param/hisat2.param", mytargets="targets_trim.txt")
sysargs(args)[1] # Command-line parameters for first FASTQ file
moduleload(modules(args))
system("hisat2-build ./data/tair10.fasta ./data/tair10.fasta")
runCommandline(args=args)
{% endhighlight %}

Check whether all BAM files have been created


{% highlight r %}
file.exists(outpaths(args))
{% endhighlight %}

## Read and alignment stats

The following provides an overview of the number of reads in each sample
and how many of them aligned to the reference.


{% highlight r %}
args <- systemArgs(sysma="param/hisat2.param", mytargets="targets.txt")
read_statsDF <- alignStats(args=args) 
write.table(read_statsDF, "results/alignStats.xls", row.names=FALSE, quote=FALSE, sep="\t")
{% endhighlight %}


{% highlight r %}
read.table(system.file("extdata", "alignStats.xls", package="systemPipeR"), header=TRUE)[1:4,]
{% endhighlight %}

{% highlight txt %}
##   FileName Nreads2x Nalign Perc_Aligned Nalign_Primary Perc_Aligned_Primary
## 1      M1A   192918 177961     92.24697         177961             92.24697
## 2      M1B   197484 159378     80.70426         159378             80.70426
## 3      A1A   189870 176055     92.72397         176055             92.72397
## 4      A1B   188854 147768     78.24457         147768             78.24457
{% endhighlight %}


## Create symbolic links for viewing BAM files in IGV

The `symLink2bam` function creates symbolic links to view the BAM alignment files in a
genome browser such as IGV. The corresponding URLs are written to a file
with a path specified under `urlfile` in the `results` directory.


{% highlight r %}
symLink2bam(sysargs=args, htmldir=c("~/.html/", "projects/tests/"), 
            urlbase="http://biocluster.ucr.edu/~tgirke/", 
            urlfile="./results/IGVurl.txt")
{% endhighlight %}

