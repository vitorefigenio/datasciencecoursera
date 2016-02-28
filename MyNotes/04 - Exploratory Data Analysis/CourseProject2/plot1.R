# 1. Have total emissions from PM2.5 decreased in the United States from 1999
# to 2008? Using the base plotting system, make a plot showing the total PM2.5
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

library(RDS)
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

aggr <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png", width=480, height=480, bg="white")
barplot(
  # use "10ˆ6" to provide a good Visual
  height = (aggr$Emissions)/10^6,
  names.arg = aggr$year,
  main = expression('Total PM'[2.5]*' emissions at various years'),
  xlab="years",
  ylab=expression('Total PM'[2.5]*' emission'),
  col = "gray"
)
dev.off()