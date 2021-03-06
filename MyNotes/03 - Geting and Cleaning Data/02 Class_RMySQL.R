# Connecting and listing databases
library(RMySQL)
ucscDb <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucss.edu")
result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb);
result

# Connecting to hg19 and listing tables
hg19 <- dbConnect(MySQL(), user="genome", db="hg19" ,host="genome-mysql.cse.ucss.edu")
allTables <- dbListTables(hg19)
length(allTables)

allTables[1:5]

# Get dimensions of a specific table
dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

# Select a specific subset
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)
affyMisSmall <- fetch(query, n=10); dbClearResult(query);
dim(affyMisSmall)

# Don't forget to Disconnect Database 
dbDisconnect(hg19)