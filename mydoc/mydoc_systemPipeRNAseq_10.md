---
title: Render report in HTML and PDF format
keywords: 
last_updated: Sat Jul  9 09:06:03 2016
---


{% highlight r %}
rmarkdown::render("systemPipeRNAseq.Rmd", c("BiocStyle::html_document", "BiocStyle::pdf_document"))
{% endhighlight %}

