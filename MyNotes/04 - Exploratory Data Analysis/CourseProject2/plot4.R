library(RDS)
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

library(ggplot2)

jNS <- merge(NEI, SCC, by="SCC")
coal  <- grepl("coal", jNS$Short.Name, ignore.case=TRUE)
dNS <- jNS[coal,]
aggr <- aggregate(Emissions ~ year, dNS, sum)

png("plot4.png", width=640, height=480)
g <- ggplot(aggr, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()