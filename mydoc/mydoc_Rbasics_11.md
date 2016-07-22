---
title: Useful R Functions
keywords: 
last_updated: Mon Jul  4 15:46:31 2016
---

## Unique entries

Make vector entries unique with `unique`


{% highlight r %}
length(iris$Sepal.Length)
{% endhighlight %}

{% highlight txt %}
## [1] 150
{% endhighlight %}

{% highlight r %}
length(unique(iris$Sepal.Length))
{% endhighlight %}

{% highlight txt %}
## [1] 35
{% endhighlight %}

## Count occurrences

Count occurrences of entries with `table`

{% highlight r %}
table(iris$Species)
{% endhighlight %}

{% highlight txt %}
## 
##     setosa versicolor  virginica 
##         50         50         50
{% endhighlight %}

## Aggregate data

Compute aggregate statistics with `aggregate`

{% highlight r %}
aggregate(iris[,1:4], by=list(iris$Species), FUN=mean, na.rm=TRUE)
{% endhighlight %}

{% highlight txt %}
##      Group.1 Sepal.Length Sepal.Width Petal.Length Petal.Width
## 1     setosa        5.006       3.428        1.462       0.246
## 2 versicolor        5.936       2.770        4.260       1.326
## 3  virginica        6.588       2.974        5.552       2.026
{% endhighlight %}

## Intersect data

Compute intersect between two vectors with `%in%`

{% highlight r %}
month.name %in% c("May", "July")
{% endhighlight %}

{% highlight txt %}
##  [1] FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
{% endhighlight %}

## Merge data frames

Join two data frames by common field entries with `merge` (here row names `by.x=0`). To obtain only the common rows, change `all=TRUE` to `all=FALSE`. To merge on specific columns, refer to them by their position numbers or their column names.

{% highlight r %}
frame1 <- iris[sample(1:length(iris[,1]), 30), ]
frame1[1:2,]
{% endhighlight %}

{% highlight txt %}
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 18          5.1         3.5          1.4         0.3  setosa
## 41          5.0         3.5          1.3         0.3  setosa
{% endhighlight %}

{% highlight r %}
dim(frame1)
{% endhighlight %}

{% highlight txt %}
## [1] 30  5
{% endhighlight %}

{% highlight r %}
my_result <- merge(frame1, iris, by.x = 0, by.y = 0, all = TRUE)
dim(my_result)
{% endhighlight %}

{% highlight txt %}
## [1] 150  11
{% endhighlight %}

