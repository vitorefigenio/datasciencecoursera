# Lesson 3
# Quizz

## Question 1
### Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:
### * library(datasets)
### * data(iris)

### A description of the dataset can be found by running
### * ?iris

### There will be an object called 'iris' in your workspace. In this dataset,
### what is the mean of 'Sepal.Length' for the species virginica? 
### (Please only enter the numeric result and nothing else.)

library(datasets)
data(iris)
iris

s <- split(iris, iris$Species)
sapply(s, function(x) colMeans(x[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width" )], na.rm = TRUE))

## Question 2
### Continuing with the 'iris' dataset from the previous Question, what R
### code returns a vector of the means of the variables 'Sepal.Length', 
### 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?

apply(iris[, 1:4], 2, mean)


## Question 3
### Load the 'mtcars' dataset in R with the following code
library(datasets)
data(mtcars)

### There will be an object names 'mtcars' in your workspace. You can find
### some information about the dataset by running
?mtcars

### How can one calculate the average miles per gallon (mpg) by number of 
### cylinders in the car (cyl)?

with(mtcars, tapply(mpg, cyl, mean)) # 1st time
tapply(mtcars$mpg, mtcars$cyl, mean) # 2nd time


## Question 4
### Continuing with the 'mtcars' dataset from the previous Question, what
### is the absolute difference between the average horsepower of 4-cylinder
### cars and the average horsepower of 8-cylinder cars?

### Comparar a diferença absoluta da média do HP de um carro de 4 e 8 Cilindradas

avg <- split(mtcars, mtcars$cyl)
lapply(avg, function(x) colMeans(x[, c("mpg", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")]))

x <- 82.6363636
y <- 209.2142857

x - y
y - x


## Question 5
### If you run
debug(ls)

### what happens when you next call the 'ls' function?
ls()
# Execution of 'ls' will suspend at the beginning of the function and you will
# be in the browser.