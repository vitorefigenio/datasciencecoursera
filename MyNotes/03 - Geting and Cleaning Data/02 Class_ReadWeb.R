# Reading Dat from Web

# Getting data off webpages - readlines()
con = url("http://scholar.google.com/citations?user=HI-I60AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode
  
# Parsing with XML
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I60AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes = T)
xpathSApply(html, "//title", xmlValue)
xpathSApply(html, "//td[@id='col-citedby']", xmlValue)

# Get from the httr package
library(httr); html2 = GET(url)
content2 = content(html2, as="text")
parseHtml = htmlParse(content2, asText=TRUE)
xpathSApply(parseHtml, "//title", xmlValue)

# Accsessing websites with password
pg1 = GET("http://httpbin.org/basic-auth/user/passwd")
pg1

pg2 = GET("http://httpbin.org/basic-auth/user/passwd", authenticate("user", "passwd"))
pg2
names(pg2)

# Using handles
google = handle("http://google.com")
pg1 = GET(handle=google, path="/")
pg2 = GET(handle=google, path="search")
