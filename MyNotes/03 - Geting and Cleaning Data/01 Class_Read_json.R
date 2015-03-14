#JSon (Javascript Object Notation)
library(jsonlite)
#jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
jsonData <- fromJSON("./data/repos.json")
names(jsonData)
names(jsonData$owner)
names(jsonData$owner$login)

# Writing data frames to JSon
myjson <- toJSON(iris, pretty=TRUE)
cat(myjson)

iris2 <- fromJSON(myjson)
head(iris2)