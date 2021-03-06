if(!file.exists("data")){
    dir.create("data")
}

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "C:/Users/sfq8797/Documents/coursera/03 - Geting and Cleaning Data/data/cameras.csv")
list.files("./data")

dateDownloaded <- date()
dateDownloaded

# Excel Format

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.xlsx", mode="wb")
list.files("./data")
dateDownloaded <- date()

library(xlsx)
cameraData <- read.xlsx("./data/cameras.xlsx", sheetIndex=1, header=TRUE)
head(cameraData)

# Reading specific rows and columns
colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <- read.xlsx("./data/cameras.xlsx", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)
cameraDataSubset

# Podemos utilizar uma fun�ao muito importante chamada
write.xlsx()
# para regravar as analises no formato excel

# A fun��o
read.xlsx2()
# parece ser mais r�pida que a fun�ao normal mas pode apresenar
# instabilidade caso esteja lendo informa��es de colunas e linhas especificas

# Caso seja necess�rio fazer muitas opera��es com o Excel utilze o
XLConnect()
# pois se conceta melhor com o Excel
