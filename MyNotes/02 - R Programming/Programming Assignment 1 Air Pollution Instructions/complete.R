# Programming Assignment 1: Air Pollution: Instructions

## Part 2
### Write a function that reads a directory full of files and reports the
### number of completely observed cases in each data file. The function
### should return a data frame where the first column is the name of the
### file and the second column is the number of complete cases. A prototype
### of this function follows
complete <- function(directory, id = 1:332) {
    files <- dir(directory)
    nobs <- data.frame()
    
    for(i in files[id]){
        file <- paste(directory,"/", i, sep="")
        frame <- read.csv(file, head = TRUE)
        x <- sum(complete.cases(frame))
        nobs <- rbind( nobs , x )
        rm(x)
    }
    
    dataframe <- (cbind(id, nobs))
    names(dataframe) <- c("id", "nobs")
    dataframe
}

#complete("specdata", 1)
#complete("specdata", c(2, 4, 8, 10, 12))
#complete("specdata", 30:25)
#complete("specdata", 3)