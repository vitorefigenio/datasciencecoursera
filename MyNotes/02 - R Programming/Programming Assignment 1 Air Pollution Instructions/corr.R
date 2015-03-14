# Programming Assignment 1: Air Pollution: Instructions

## Part 3
### Write a function that takes a directory of data files and a threshold
### for complete cases and calculates the correlation between sulfate and
### nitrate for monitor locations where the number of completely observed
### cases (on all variables) is greater than the threshold. The function
### should return a vector of correlations for the monitors that meet the
### threshold requirement. If no monitors meet the threshold requirement,
### then the function should return a numeric vector of length 0.

### For this function you will need to use the 'cor' function in R which
### calculates the correlation between two vectors. Please read the help
### page for this function via '?cor' and make sure that you know how to
### use it.
source("complete.R")

corr <- function(directory, threshold = 0){
    files <- dir(directory)
    result <- c()
    completeframe <- complete(directory, 1:332)
    y <- completeframe$id[completeframe$nobs > threshold]
    
    for(i in files[y]){
        file <- paste(directory,"/",i, sep = "")
        frame <- read.csv(file, head = TRUE)
        dados <- frame[complete.cases(frame[,c("sulfate","nitrate")]),c("sulfate","nitrate")]
        result <- c(result, cor(dados$sulfate, dados$nitrate))
    }
    result
}