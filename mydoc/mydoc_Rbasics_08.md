---
title: Important Utilities
keywords: 
last_updated: Mon Jul  4 15:46:31 2016
---
	
## Combining Objects

The `c` function combines vectors and lists


{% highlight r %}
c(1, 2, 3)
{% endhighlight %}

{% highlight txt %}
## [1] 1 2 3
{% endhighlight %}

{% highlight r %}
x <- 1:3; y <- 101:103
c(x, y)
{% endhighlight %}

{% highlight txt %}
## [1]   1   2   3 101 102 103
{% endhighlight %}

{% highlight r %}
iris$Species[1:8]
{% endhighlight %}

{% highlight txt %}
## [1] setosa setosa setosa setosa setosa setosa setosa setosa
## Levels: setosa versicolor virginica
{% endhighlight %}

The `cbind` and `rbind` functions can be used to append columns and rows, respecively.

{% highlight r %}
ma <- cbind(x, y)
ma
{% endhighlight %}

{% highlight txt %}
##      x   y
## [1,] 1 101
## [2,] 2 102
## [3,] 3 103
{% endhighlight %}

{% highlight r %}
rbind(ma, ma)
{% endhighlight %}

{% highlight txt %}
##      x   y
## [1,] 1 101
## [2,] 2 102
## [3,] 3 103
## [4,] 1 101
## [5,] 2 102
## [6,] 3 103
{% endhighlight %}

## Accessing Dimensions of Objects

Length and dimension information of objects


{% highlight r %}
length(iris$Species)
{% endhighlight %}

{% highlight txt %}
## [1] 150
{% endhighlight %}

{% highlight r %}
dim(iris)
{% endhighlight %}

{% highlight txt %}
## [1] 150   5
{% endhighlight %}

## Accessing Name Slots of Objects

Accessing row and column names of 2D objects

{% highlight r %}
rownames(iris)[1:8]
{% endhighlight %}

{% highlight txt %}
## [1] "1" "2" "3" "4" "5" "6" "7" "8"
{% endhighlight %}

{% highlight r %}
colnames(iris)
{% endhighlight %}

{% highlight txt %}
## [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"
{% endhighlight %}

Return name field of vectors and lists

{% highlight r %}
names(myVec)
{% endhighlight %}

{% highlight txt %}
##  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X"
## [25] "Y" "Z"
{% endhighlight %}

{% highlight r %}
names(myL)
{% endhighlight %}

{% highlight txt %}
## [1] "name"        "wife"        "no.children" "child.ages"
{% endhighlight %}

## Sorting Objects

The function `sort` returns a vector in ascending or descending order

{% highlight r %}
sort(10:1)
{% endhighlight %}

{% highlight txt %}
##  [1]  1  2  3  4  5  6  7  8  9 10
{% endhighlight %}

The function `order` returns a sorting index for sorting an object

{% highlight r %}
sortindex <- order(iris[,1], decreasing = FALSE)
sortindex[1:12]
{% endhighlight %}

{% highlight txt %}
##  [1] 14  9 39 43 42  4  7 23 48  3 30 12
{% endhighlight %}

{% highlight r %}
iris[sortindex,][1:2,]
{% endhighlight %}

{% highlight txt %}
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 14          4.3         3.0          1.1         0.1  setosa
## 9           4.4         2.9          1.4         0.2  setosa
{% endhighlight %}

{% highlight r %}
sortindex <- order(-iris[,1]) # Same as decreasing=TRUE
{% endhighlight %}
Sorting multiple columns

{% highlight r %}
iris[order(iris$Sepal.Length, iris$Sepal.Width),][1:2,]
{% endhighlight %}

{% highlight txt %}
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 14          4.3         3.0          1.1         0.1  setosa
## 9           4.4         2.9          1.4         0.2  setosa
{% endhighlight %}

