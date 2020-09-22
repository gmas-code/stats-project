# Coming out of Stata, I would say R syntax has a lot of parenthesis, 
# everything gets separated by a comma, and tipically we assign
# with <-. = also works, but the basic style is <-

# sample dataframes are built in R
# see

iris

# these are humanly sized, so one can use them to learn, without managing thousands of rows

# one can just see the first and last rows using the functions head() and tail()

head(iris)

tail(iris)

# to pick a variable of the dataframe we can index easily with $

iris$Sepal.Length

# another indxing method uses bracket notation [row number,column number]
# slices are ranges which can be chosen with ":"

iris[1:4,1:2]

# unlike Stata, it is easy to define variables outisde the dataframe. For example

x <- 5

# in R it is customary to use <- to assign, instead of =, but = also works

# variables can be scalars (one number) or vectors (arrays of numbers). 
#For the latter, you use c to concatenate elements

x <- c(1,2,3,4,5) 

# you could also use slice notation

x<- c(1:5)

# functions are called with function() 

mean(x)

# R allows "vecotrized" operations, for example, 
# substracting a dataframe column from the mean of x

iris$Sepal.Length - mean(x)

# and we can just save them to a variable

y = iris$Sepal.Length - mean(x)

# built in plotting is pretty good. ie.

hist(iris$Sepal.Length)
barplot(iris$Petal.Length, col="gold")

# the command plot will guess what type of plot you want

plot(iris$Sepal.Length,iris$Sepal.Width, col="red")

# a variable can also be a string

z = "hello"

# another important data type is the list. Lists can take text, numbers, or really anything.

my_list <- list(x,y,z,iris, "more stuff", 22)

# linear regression is built in base R with the lm function. 
# lm  uses the notation ~ to suggest "by",
# ie. dependent varaible ~ independent variable. 

lm1 <- lm(iris$Sepal.Length~iris$Petal.Width) 

#this creates a lm object called lm1
#with summary one can extract the coefficients etc from lm1

summary(lm1)

# lm1 is an object, bundling all the info of the model and we can access it with $

lm1$coefficients

lm1$fitted.values

# basic statistical functions are easy to reach

mean(iris$Sepal.Length)
var(iris$Sepal.Length)

# or they can be computed "by hand"
# here length is a function calculating the number of observations on the variable

sum(iris$Sepal.Length)/length(iris$Sepal.Length)

# base R also has a handy functions for the statistical distributions, 
# the language is always the same p__, d__, q__, r___
# ie for the normal distribuiton pnorm, dnorm, qnorm, rnorm
# for the binomial pbinom, dbinom, qbinom, rbinom
# etc

# these functions are a bit more complicated than mean or var as you need
# to pass to them more than one argument, separated by commas
# for example to rnorm produces random normal variables
# here you feed the function 3 arguments, the number of random variables
# the mean and the standard deviaiton

rnorm(50,mean=25,sd=4)

# dnorm calculates point probabilities, the likelihood of a value of exactly that number

dnorm(25,mean=25,sd=4)

# pnorm is the cumulative density function, sums the probability up to that value

pnorm(27,mean=25,sd=4)

# you can also get the other side of the curve by either

1-pnorm(27,mean=25,sd=4)

# or passing an option for lower.tail = FALSE

pnorm(27,mean=25,sd=4,lower.tail = FALSE)

# finally qnorm is what you use to feed a percentile and get a quantile
# here we want to know at what value of our normal we get into the .975 region

qnorm(.975,mean=25,sd=4)

#seq can be used to create linear sequences of numbers, you feed it a start,
# a finish, and the size of each step

seq(-4,4,0.1)

# you can chain functions. For example here I will chain 3, seq, pnorm and plot 
# to plot a standard normal cumulative density function
# type = "l' in plot asks for a line plot

plot( seq(-4,4,0.1), pnorm(seq(-4,4,0.1),0,1),type='l')

# with d norm you get the probability density function

plot( seq(-4,4,0.1), dnorm(seq(-4,4,0.1),0,1),type='l')

# this is a bit hard to read, so it would be better to 
# define and x and y for plot like this

x <- seq(-4,4,0.1)
y <- dnorm(seq(-4,4,0.1),0,1)

# and then

plot(x,y,type="l")

# you can also plot with external libraries like ggplot
# here you use the library function to load them
# ggplot can be clunky in some cases, because it only accepts
# variables that are in a data frame
# Which allows me to show how to construct a dataframe

library(ggplot2)

df = data.frame("x" = x, "y" = y)
p1<-ggplot(df,aes(x,y))
p1+geom_line(col='black')+geom_area(fill='orange')

# running t tests, one and two samples, if you don't hate them

t.test(iris$Sepal.Length)

t.test(iris$Sepal.Length,iris$Sepal.Width)

#getting an object out of the t test allows us to use the $ operator
# to get the data you want

tobject<-t.test(iris$Sepal.Length)

tobject$statistic

tobject$stderr

# fancier stuff
# a scatterplot matrix

pairs(iris)

# easy qqplot comparing with a normal distribution

qqnorm(iris$Sepal.Length)

ks.test(iris$Sepal.Length,pnorm, mean(iris$Sepal.Length),sd=sd(iris$Sepal.Length))

