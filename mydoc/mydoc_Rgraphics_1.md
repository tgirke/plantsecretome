---
title: R Graphics
keywords: 
last_updated: Mon Jul  4 15:47:21 2016
---
Thomas Girke (thomas.girke@ucr.edu)

Last update: 04 July, 2016 

Alternative formats of this tutorial:
[`HTML`](https://htmlpreview.github.io/?https://raw.githubusercontent.com/tgirke/CSHL_RNAseq/gh-pages/_vignettes/04_Rgraphics/Rgraphics.html),
[`.Rmd`](https://raw.githubusercontent.com/tgirke/CSHL_RNAseq/gh-pages/_vignettes/04_Rgraphics/Rgraphics.Rmd),
[`.R`](https://raw.githubusercontent.com/tgirke/CSHL_RNAseq/gh-pages/_vignettes/04_Rgraphics/Rgraphics.R),

## Overview

## Graphics in R

-   Powerful environment for visualizing scientific data
-   Integrated graphics and statistics infrastructure
-   Publication quality graphics
-   Fully programmable
-   Highly reproducible
-   Full [LaTeX](http://www.latex-project.org/), [Sweave](http://www.stat.auckland.ac.nz/~dscott/782/Sweave-manual-20060104.pdf), [knitr](http://yihui.name/knitr/) and [R Markdown](http://rmarkdown.rstudio.com/) support.
    support
-   Vast number of R packages with graphics utilities


## Documentation on Graphics in R

- General 
    - [Graphics Task Page](http://cran.r-project.org/web/views/Graphics.html)
    - [R Graph Gallery](http://www.r-graph-gallery.com/)
    - [R Graphical Manual](http://bm2.genes.nig.ac.jp/RGM2/index.php)
    - [Paul Murrell’s book R (Grid) Graphics](http://www.stat.auckland.ac.nz/~paul/RGraphics/rgraphics.html)

- Interactive graphics
    - [`rggobi` (GGobi)](http://www.ggobi.org/)
    - [`iplots`](http://www.iplots.org/)
    - [Open GL (`rgl`)](http://rgl.neoscientists.org/gallery.shtml)


## Graphics Environments

- Viewing and savings graphics in R
    - On-screen graphics
    - postscript, pdf, svg
    - jpeg/png/wmf/tiff/...

- Four major graphics environments
    - Low-level infrastructure
        - R Base Graphics (low- and high-level)
        - `grid`: [Manual](http://www.stat.auckland.ac.nz/~paul/grid/grid.html), [Book](http://www.stat.auckland.ac.nz/~paul/RGraphics/rgraphics.html)
    - High-level infrastructure
        - `lattice`: [Manual](http://lmdvr.r-forge.r-project.org), [Intro](http://www.his.sunderland.ac.uk/~cs0her/Statistics/UsingLatticeGraphicsInR.htm), [Book](http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689)
        - `ggplot2`: [Manual](http://docs.ggplot2.org/current/), [Intro](http://www.ling.upenn.edu/~joseff/rstudy/summer2010_ggplot2_intro.html), [Book](http://had.co.nz/ggplot2/book/)


