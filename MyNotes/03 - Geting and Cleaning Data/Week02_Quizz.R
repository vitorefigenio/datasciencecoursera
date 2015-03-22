#Quizz 2 - Getting Cleaning Data

# Question 1
# Register an application with the Github API here
# https://github.com/settings/applications. Access the API to get information on
# your instructors repositories (hint: this is the url you want
# "https://api.github.com/users/jtleek/repos"). Use this data to find the time that
# the datasharing repo was created. What time was it created? This tutorial may be
# useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r).
# You may also need to run the code in the base R package and not R studio.

library(httr)
oauth_endpoints("github")
myapp <- oauth_app("github", key="7eeb5753524e12ead876", secret="ef33989a51346e93a46ceecc743e6e302fdfe953")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
req <- GET("https://api.github.com/users/jtleek/repos")
stop_for_status(req)
a <- content(req)
a[4]


# Question 2
# The sqldf package allows for execution of SQL commands on R data frames. We will
# use the sqldf package to practice the queries we might send with the dbSendQuery
# command in RMySQL. Download the American Community Survey data and load it into
# an R object called

library(sqldf)
acs <- read.csv("./data/w2q2.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")


# Question 3
# Using the same data frame you created in the previous problem, what is the
# equivalent function to unique(acs$AGEP)

sqldf("select distinct AGEP from acs")


# Question 4
# How many characters are in the 10th, 20th, 30th and 100th lines of HTML from
# this page: 
data <- url("http://biostat.jhsph.edu/~jleek/contact.html")
#(Hint: the nchar() function in R may be helpful)
htmlCode = readLines(data)
close(data)
htmlCode
number <- data.frame(nchar(htmlCode))
number


# Question 5
# Read this data set into R and report the sum of the numbers in the fourth of
# the nine columns. 
# https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
# Original source of the data:
# http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for
# (Hint this is a fixed width file format)

x <- read.fwf(
  file=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
  skip=4,
  widths=c(12, 7,4, 9,4, 9,4, 9,4))

head(x)
sum(x$V4)
