---
title: Introduction to R 
keywords: 
last_updated: Mon Jul  4 15:46:31 2016
---
Author: Thomas Girke

Last update: 04 July, 2016 

Alternative formats of this vignette:
[`HTML`](https://htmlpreview.github.io/?https://raw.githubusercontent.com/tgirke/CSHL_RNAseq/gh-pages/_vignettes/03_Rbasics/Rbasics.html),
[`.Rmd`](https://raw.githubusercontent.com/tgirke/CSHL_RNAseq/gh-pages/_vignettes/03_Rbasics/Rbasics.Rmd),
[`.R`](https://raw.githubusercontent.com/tgirke/CSHL_RNAseq/gh-pages/_vignettes/03_Rbasics/Rbasics.R)

## Overview

## What is R?

[R](http://cran.at.r-project.org) is a powerful statistical environment and
programming language for the analysis and visualization of data.  The
associated [Bioconductor](http://bioconductor.org/) and CRAN package
repositories provide many additional R packages for statistical data analysis
for a wide array of research areas. The R software is free and runs on all
common operating systems. 

## Why Using R?
* Complete statistical environment and programming language
* Efficient functions and data structures for data analysis
* Powerful graphics
* Access to fast growing number of analysis packages
* Most widely used language in bioinformatics
* Is standard for data mining and biostatistical analysis
* Technical advantages: free, open-source, available for all OSs

## Books and Documentation
* simpleR - Using R for Introductory Statistics (John Verzani, 2004) - [URL](http://cran.r-project.org/doc/contrib/Verzani-SimpleR.pdf)
* Bioinformatics and Computational Biology Solutions Using R and Bioconductor (Gentleman et al., 2005) - [URL](http://www.bioconductor.org/help/publications/books/bioinformatics-and-computational-biology-solutions/)
* More on this see "Finding Help" section in UCR Manual - [URL](http://manuals.bioinformatics.ucr.edu/home/R\_BioCondManual\#TOC-Finding-Help)

## R Working Environments

## Working environments (IDEs) for R
<center><img title="R_Interfaces" src="../Rbasics_files/rinterface.png"/></center>
<center> R Projects and Interfaces</center>

Some R working environments with support for syntax highlighting and utilities to send code 
to the R console: 

* [RStudio](https://www.rstudio.com/products/rstudio/features): excellent choice for beginners ([Cheat Sheet](http://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf)) 
* Basic R code editors provided by Rguis 
* [gedit](https://wiki.gnome.org/Apps/Gedit), [Rgedit](http://rgedit.sourceforge.net/), [RKWard](https://rkward.kde.org/), [Eclipse](http://www.walware.de/goto/statet), [Tinn-R](http://www.sciviews.org/Tinn-R/), [Notepad++](https://notepad-plus-plus.org/), [NppToR](http://sourceforge.net/projects/npptor/)
* [Vim-R-Tmux](http://manuals.bioinformatics.ucr.edu/home/programming-in-r/vim-r): R working environment based on vim and tmux 
* [Emacs](http://www.xemacs.org/Download/index.html) ([ESS add-on package](http://ess.r-project.org/))
	
### Example: RStudio 

New integrated development environment (IDE) for [R](http://www.rstudio.com/ide/download/). Highly functional for both beginners and 
advanced.

<center><img title="RStudio" src="../Rbasics_files/rstudio.png"/></center>
<center> RStudio IDE</center>

Some userful shortcuts: `Ctrl+Enter` (send code), `Ctrl+Shift+C` (comment/uncomment), `Ctrl+1/2` (switch window focus)

### Example: Vim-R-Tmux

Terminal-based Working Environment for R: [Vim-R-Tmux](http://manuals.bioinformatics.ucr.edu/home/programming-in-r/vim-r)

<center><img title="Vim-R-Tmux" src="../Rbasics_files/screenshot.png" ></center>
<center>Vim-R-Tmux IDE for R</center>

