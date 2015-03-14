#Quizz Week 1

# Question 1
# The American Community Survey distributes downloadable data about United States
# communities. Download the 2006 microdata survey about housing for the state of
# Idaho using download.file() from here: 
  # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 

# and load the data into R. The code book, describing the variable names is here: 
  # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 

# How many properties are worth $1,000,000 or more?
idahoFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
if(!file.exists("data")){
  dir.create("data")  
}
download.file(idahoFile, "./data/idaho.csv")

idaho <- read.csv("./data/idaho.csv")
a <- complete.cases(idaho$VAL[idaho$VAL == 24])
sum(a)


# Question 2
# Use the data you loaded from Question 1. Consider the variable FES in the code
# book. Which of the "tidy data" principles does this variable violate?

a <- data.frame(idaho$FES)
na <- is.na(a)
a[!na]

# Tidy data has one observation per colunm.

# Question 3
# Download the Excel spreadsheet on Natural Gas Aquisition Program here: 
  
gasFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(gasFile, destfile="./data/gas.xlsx")

library(xlsx)
gasData <- read.xlsx("./data/gas.xlsx", sheetIndex=1, header=TRUE)

# Read rows 18-23 and columns 7-15 into R and assign the result to a
# variable called:
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("./data/gas.xlsx", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)
# What is the value of: (original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)
sum(dat$Zip*dat$Ext,na.rm=T)


# Question 4
# Read the XML data on Baltimore restaurants from here: 
library(XML)
restaurantFile <- "./data/getdatadatarestaurants.xml"
doc <- xmlTreeParse(restaurantFile, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
# How many restaurants have zipcode 21231?

zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
v <- zipcode[zipcode == "21231"]
data.frame(v)



# Question 5
# The American Community Survey distributes downloadable data about United
# States communities. Download the 2006 microdata survey about housing for
# the state of Idaho using download.file() from here: 
# "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
# using the fread() command load the data into an R object
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url=fileUrl1, destfile="./data/fsspid.csv", mode="w")
dateDownloaded <- date()
print(dateDownloaded)

library(data.table)
DT <- fread(input="./data/fsspid.csv", sep=",")
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) 
system.time(mean(DT[DT$SEX==2,]$pwgtp15))

# Which of the following is the fastest way to calculate the average value of
# the variable pwgtp15 
# broken down by sex using the data.table package?
sapply(split(DT$pwgtp15,DT$SEX),mean)
