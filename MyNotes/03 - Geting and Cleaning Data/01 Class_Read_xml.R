install.packages("XML")

library(XML)
#Proxy bloqueia fileUrl <- "http://www.w3schools.com/xml/simple.xml"
fileUrl <- "./data/simple.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

# Directly access parts of the XML document
rootNode[[1]]
rootNode[[1]][[1]][[1]]
rootNode[[1]][[2]][[1]]
rootNode[[1]][[3]][[1]]
rootNode[[1]][[4]][[1]]

# Programatically extract parts of the file
xmlSApply(rootNode, xmlValue)

# Get the items on the menu and prices using xpath
product <- xpathSApply(rootNode, "//name", xmlValue)
price <- xpathSApply(rootNode, "//price", xmlValue)
prices <- cbind(product,price)
prices

# Exract content by attributes
fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl, useInternal=TRUE)
scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)
scores
teams