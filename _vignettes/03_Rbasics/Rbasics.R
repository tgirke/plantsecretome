## ----style, echo = FALSE, results = 'asis'-------------------------------
BiocStyle::markdown()
options(width=100, max.print=1000)
knitr::opts_chunk$set(
    eval=as.logical(Sys.getenv("KNITR_EVAL", "TRUE")),
    cache=as.logical(Sys.getenv("KNITR_CACHE", "TRUE")))

## ----setup, echo=FALSE, messages=FALSE, warnings=FALSE-------------------
suppressPackageStartupMessages({
    library(limma) 
    library(ggplot2) }) 

## ----install_cran, eval=FALSE--------------------------------------------
## install.packages(c("pkg1", "pkg2"))
## install.packages("pkg.zip", repos=NULL)

## ----install_bioc, eval=FALSE--------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## library(BiocInstaller)
## BiocVersion()
## biocLite()
## biocLite(c("pkg1", "pkg2"))

## ----closing_r, eval=FALSE-----------------------------------------------
## q()

## ----r_assignment, eval=FALSE--------------------------------------------
## object <- ...

## ----r_ls, eval=FALSE----------------------------------------------------
## ls()

## ----r_dirshow, eval=FALSE-----------------------------------------------
## dir()

## ----r_dirpath, eval=FALSE-----------------------------------------------
## getwd()

## ----r_setwd, eval=FALSE-------------------------------------------------
## setwd("/home/user")

## ----r_syntax, eval=FALSE------------------------------------------------
## object <- function_name(arguments)
## object <- object[arguments]

## ----r_find_help, eval=FALSE---------------------------------------------
## ?function_name

## ----r_package_load, eval=FALSE------------------------------------------
## library("my_library")

## ----r_package_functions, eval=FALSE-------------------------------------
## library(help="my_library")

## ----r_load_vignette, eval=FALSE-----------------------------------------
## vignette("my_library")

## ----r_execute_script, eval=FALSE----------------------------------------
## source("my_script.R")

## ----sh_execute_script, eval=FALSE, engine="sh"--------------------------
## $ Rscript my_script.R
## $ R CMD BATCH my_script.R
## $ R --slave < my_script.R

## ----r_numeric_data, eval=TRUE-------------------------------------------

x <- c(1, 2, 3)
x
is.numeric(x)
as.character(x)

## ----r_character_data, eval=TRUE-----------------------------------------
x <- c("1", "2", "3")
x
is.character(x)
as.numeric(x)

## ----r_complex_data, eval=TRUE-------------------------------------------
c(1, "b", 3)

## ----r_logical_data, eval=TRUE-------------------------------------------
x <- 1:10 < 5
x  
!x
which(x) # Returns index for the 'TRUE' values in logical vector

## ----r_vector_object, eval=TRUE------------------------------------------
myVec <- 1:10; names(myVec) <- letters[1:10]  
myVec[1:5]
myVec[c(2,4,6,8)]
myVec[c("b", "d", "f")]

## ----r_factor_object, eval=TRUE------------------------------------------
factor(c("dog", "cat", "mouse", "dog", "dog", "cat"))

## ----r_matrix_object, eval=TRUE------------------------------------------
myMA <- matrix(1:30, 3, 10, byrow = TRUE) 
class(myMA)
myMA[1:2,]
myMA[1, , drop=FALSE]

## ----r_dataframe_object, eval=TRUE---------------------------------------
myDF <- data.frame(Col1=1:10, Col2=10:1) 
myDF[1:2, ]

## ----r_list_object, eval=TRUE--------------------------------------------
myL <- list(name="Fred", wife="Mary", no.children=3, child.ages=c(4,7,9)) 
myL
myL[[4]][1:2] 

## ----r_function_object, eval=FALSE---------------------------------------
## myfct <- function(arg1, arg2, ...) {
## 	function_body
## }

## ----r_subset_by_index, eval=TRUE----------------------------------------
myVec <- 1:26; names(myVec) <- LETTERS 
myVec[1:4]

## ----r_subset_by_logical, eval=TRUE--------------------------------------
myLog <- myVec > 10
myVec[myLog] 

## ----r_subset_by_names, eval=TRUE----------------------------------------
myVec[c("B", "K", "M")]

## ----r_subset_by_dollar, eval=TRUE---------------------------------------
iris$Species[1:8]

## ----r_combine_vectors, eval=TRUE----------------------------------------
c(1, 2, 3)
x <- 1:3; y <- 101:103
c(x, y)
iris$Species[1:8]

## ----r_cbind_rbind, eval=TRUE--------------------------------------------
ma <- cbind(x, y)
ma
rbind(ma, ma)

## ----r_length_dim, eval=TRUE---------------------------------------------
length(iris$Species)
dim(iris)

## ----col_row_names, eval=TRUE--------------------------------------------
rownames(iris)[1:8]
colnames(iris)

## ----name_slots, eval=TRUE-----------------------------------------------
names(myVec)
names(myL)

## ----sort_objects, eval=TRUE---------------------------------------------
sort(10:1)

## ----order_objects, eval=TRUE--------------------------------------------
sortindex <- order(iris[,1], decreasing = FALSE)
sortindex[1:12]
iris[sortindex,][1:2,]
sortindex <- order(-iris[,1]) # Same as decreasing=TRUE

## ----order_columns, eval=TRUE--------------------------------------------
iris[order(iris$Sepal.Length, iris$Sepal.Width),][1:2,]

## ----comparison_operators, eval=TRUE-------------------------------------
1==1

## ----logical_operators, eval=TRUE----------------------------------------
x <- 1:10; y <- 10:1
x > y & x > 5

## ----logical_calculations, eval=TRUE-------------------------------------
x + y
sum(x)
mean(x)
apply(iris[1:6,1:3], 1, mean) 

## ----read_delim, eval=FALSE----------------------------------------------
## myDF <- read.delim("myData.xls", sep="\t")

## ----read_excel, eval=FALSE----------------------------------------------
## library(gdata)
## myDF <- read.xls"myData.xls")

## ----read_gs, eval=FALSE-------------------------------------------------
## library("googlesheets"); library("dplyr"); library(knitr)
## gs_auth() # Creates authorizaton token (.httr-oauth) in current directory if not present
## sheetid <-"1U-32UcwZP1k3saKeaH1mbvEAOfZRdNHNkWK2GI1rpPM"
## gap <- gs_key(sheetid)
## mysheet <- gs_read(gap, skip=4)
## myDF <- as.data.frame(mysheet)
## myDF

## ----write_table, eval=FALSE---------------------------------------------
## write.table(myDF, file="myfile.xls", sep="\t", quote=FALSE, col.names=NA)

## ----readlines, eval=FALSE-----------------------------------------------
## myDF <- readLines("myData.txt")

## ----writelines, eval=FALSE----------------------------------------------
## writeLines(month.name, "myData.txt")

## ----paste_windows, eval=FALSE-------------------------------------------
## read.delim("clipboard")

## ----paste_osx, eval=FALSE-----------------------------------------------
## read.delim(pipe("pbpaste"))

## ----copy_windows, eval=FALSE--------------------------------------------
## write.table(iris, "clipboard", sep="\t", col.names=NA, quote=F)

## ----copy_osx, eval=FALSE------------------------------------------------
## zz <- pipe('pbcopy', 'w')
## write.table(iris, zz, sep="\t", col.names=NA, quote=F)
## close(zz)

## ----unique, eval=TRUE---------------------------------------------------
length(iris$Sepal.Length)
length(unique(iris$Sepal.Length))

## ----table, eval=TRUE----------------------------------------------------
table(iris$Species)

## ----aggregate, eval=TRUE------------------------------------------------
aggregate(iris[,1:4], by=list(iris$Species), FUN=mean, na.rm=TRUE)

## ----intersect, eval=TRUE------------------------------------------------
month.name %in% c("May", "July")

## ----merge, eval=TRUE----------------------------------------------------
frame1 <- iris[sample(1:length(iris[,1]), 30), ]
frame1[1:2,]
dim(frame1)
my_result <- merge(frame1, iris, by.x = 0, by.y = 0, all = TRUE)
dim(my_result)

## ----load_sqlite, eval=TRUE----------------------------------------------
library(RSQLite)
mydb <- dbConnect(SQLite(), "test.db") # Creates database file test.db
mydf1 <- data.frame(ids=paste0("id", seq_along(iris[,1])), iris)
mydf2 <- mydf1[sample(seq_along(mydf1[,1]), 10),]
dbWriteTable(mydb, "mydf1", mydf1)
dbWriteTable(mydb, "mydf2", mydf2)

## ----list_tables, eval=TRUE----------------------------------------------
dbListTables(mydb)

## ----import_sqlite_tables, eval=TRUE-------------------------------------
dbGetQuery(mydb, 'SELECT * FROM mydf2')

## ----query_sqlite_tables, eval=TRUE--------------------------------------
dbGetQuery(mydb, 'SELECT * FROM mydf1 WHERE "Sepal.Length" < 4.6')

## ----join_sqlite_tables, eval=TRUE---------------------------------------
dbGetQuery(mydb, 'SELECT * FROM mydf1, mydf2 WHERE mydf1.ids = mydf2.ids')

## ----install_rmarkdown, eval=FALSE---------------------------------------
## install.packages("rmarkdown")

## ----render_rmarkdown, eval=FALSE, message=FALSE-------------------------
## rmarkdown::render("sample.Rmd", clean=TRUE, output_format="html_document")

## ----render_commandline, eval=FALSE, message=FALSE, engine="sh"----------
## $ echo "rmarkdown::render('sample.Rmd', clean=TRUE)" | R --slave
## $ Rscript -e "rmarkdown::render('sample.Rmd', clean=TRUE)"

## ----render_makefile, eval=FALSE, message=FALSE, engine="sh"-------------
## $ make -B

## ----kable---------------------------------------------------------------
library(knitr)
kable(iris[1:12,])

## ----some_jitter_plot, eval=TRUE-----------------------------------------
library(ggplot2)
dsmall <- diamonds[sample(nrow(diamonds), 1000), ]
ggplot(dsmall, aes(color, price/carat)) + geom_jitter(alpha = I(1 / 2), aes(color=color))

## ----some_custom_inserted_plot, eval=TRUE, warning=FALSE, message=FALSE----
png("myplot.png")
ggplot(dsmall, aes(color, price/carat)) + geom_jitter(alpha = I(1 / 2), aes(color=color))
dev.off()

## ----sessionInfo---------------------------------------------------------
sessionInfo()

