---
title: SQLite Databases
keywords: 
last_updated: Mon Jul  4 15:46:31 2016
---

`SQLite` is a lightweight relational database solution. The `RSQLite` package provides an easy to use interface to create, manage and query `SQLite` databases directly from R. Basic instructions
for using `SQLite` from the command-line are available [here](https://www.sqlite.org/cli.html). A short introduction to `RSQLite` is available [here](https://github.com/rstats-db/RSQLite/blob/master/vignettes/RSQLite.Rmd).

## Loading data into SQLite databases

The following loads two `data.frames` derived from the `iris` data set (here `mydf1` and `mydf2`) 
into an SQLite database (here `test.db`).


{% highlight r %}
library(RSQLite)
{% endhighlight %}

{% highlight txt %}
## Loading required package: DBI
{% endhighlight %}

{% highlight txt %}
## Loading required package: methods
{% endhighlight %}

{% highlight r %}
mydb <- dbConnect(SQLite(), "test.db") # Creates database file test.db
mydf1 <- data.frame(ids=paste0("id", seq_along(iris[,1])), iris)
mydf2 <- mydf1[sample(seq_along(mydf1[,1]), 10),]
dbWriteTable(mydb, "mydf1", mydf1)
{% endhighlight %}

{% highlight txt %}
## [1] TRUE
{% endhighlight %}

{% highlight r %}
dbWriteTable(mydb, "mydf2", mydf2)
{% endhighlight %}

{% highlight txt %}
## [1] TRUE
{% endhighlight %}

## List names of tables in database


{% highlight r %}
dbListTables(mydb)
{% endhighlight %}

{% highlight txt %}
## [1] "mydf1" "mydf2"
{% endhighlight %}

## Import table into `data.frame`


{% highlight r %}
dbGetQuery(mydb, 'SELECT * FROM mydf2')
{% endhighlight %}

{% highlight txt %}
##      ids Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
## 1   id53          6.9         3.1          4.9         1.5 versicolor
## 2  id145          6.7         3.3          5.7         2.5  virginica
## 3   id70          5.6         2.5          3.9         1.1 versicolor
## 4  id108          7.3         2.9          6.3         1.8  virginica
## 5    id6          5.4         3.9          1.7         0.4     setosa
## 6   id87          6.7         3.1          4.7         1.5 versicolor
## 7  id139          6.0         3.0          4.8         1.8  virginica
## 8   id31          4.8         3.1          1.6         0.2     setosa
## 9  id143          5.8         2.7          5.1         1.9  virginica
## 10  id29          5.2         3.4          1.4         0.2     setosa
{% endhighlight %}

## Query database


{% highlight r %}
dbGetQuery(mydb, 'SELECT * FROM mydf1 WHERE "Sepal.Length" < 4.6')
{% endhighlight %}

{% highlight txt %}
##    ids Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1  id9          4.4         2.9          1.4         0.2  setosa
## 2 id14          4.3         3.0          1.1         0.1  setosa
## 3 id39          4.4         3.0          1.3         0.2  setosa
## 4 id42          4.5         2.3          1.3         0.3  setosa
## 5 id43          4.4         3.2          1.3         0.2  setosa
{% endhighlight %}

## Join tables

The two tables can be joined on the shared `ids` column as follows. 


{% highlight r %}
dbGetQuery(mydb, 'SELECT * FROM mydf1, mydf2 WHERE mydf1.ids = mydf2.ids')
{% endhighlight %}

{% highlight txt %}
##      ids Sepal.Length Sepal.Width Petal.Length Petal.Width    Species   ids Sepal.Length
## 1    id6          5.4         3.9          1.7         0.4     setosa   id6          5.4
## 2   id29          5.2         3.4          1.4         0.2     setosa  id29          5.2
## 3   id31          4.8         3.1          1.6         0.2     setosa  id31          4.8
## 4   id53          6.9         3.1          4.9         1.5 versicolor  id53          6.9
## 5   id70          5.6         2.5          3.9         1.1 versicolor  id70          5.6
## 6   id87          6.7         3.1          4.7         1.5 versicolor  id87          6.7
## 7  id108          7.3         2.9          6.3         1.8  virginica id108          7.3
## 8  id139          6.0         3.0          4.8         1.8  virginica id139          6.0
## 9  id143          5.8         2.7          5.1         1.9  virginica id143          5.8
## 10 id145          6.7         3.3          5.7         2.5  virginica id145          6.7
##    Sepal.Width Petal.Length Petal.Width    Species
## 1          3.9          1.7         0.4     setosa
## 2          3.4          1.4         0.2     setosa
## 3          3.1          1.6         0.2     setosa
## 4          3.1          4.9         1.5 versicolor
## 5          2.5          3.9         1.1 versicolor
## 6          3.1          4.7         1.5 versicolor
## 7          2.9          6.3         1.8  virginica
## 8          3.0          4.8         1.8  virginica
## 9          2.7          5.1         1.9  virginica
## 10         3.3          5.7         2.5  virginica
{% endhighlight %}

