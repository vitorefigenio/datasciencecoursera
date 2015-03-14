# Programming Assignment 1: Air Pollution: Instructions

## Part 1
### Write a function named 'pollutantmean' that calculates the mean of a 
### pollutant (sulfate or nitrate) across a specified list of monitors.
### The function 'pollutantmean' takes three arguments: 'directory', 'pollutant',
### and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that
### monitors' particulate matter data from the directory specified in the '
### directory' argument and returns the mean of the pollutant across all of the
### monitors, ignoring any missing values coded as NA. A prototype of the 
### function is as follows

pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    files <- dir(directory)
    dataframe <- data.frame()
    
    for(i in files[id]){
        file <- paste(directory,"/",i, sep="")
        frame <- read.csv(file, head = TRUE)
        dataframe <- rbind(dataframe, frame)
        rm(frame)
    }

    m <- mean(dataframe[,pollutant], na.rm = TRUE)
    round(m,3)
}

#pollutantmean("specdata", "sulfate", 1:10)  # 4.064
#pollutantmean("specdata", "nitrate", 70:72) # 1.706
#pollutantmean("specdata", "nitrate", 23)    # 1.281