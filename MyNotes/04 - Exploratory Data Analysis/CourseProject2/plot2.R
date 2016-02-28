library(RDS)
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips=="24510",]
aggrBalt <- aggregate(Emissions ~ year, baltimore,sum)

png("plot2.png",width=480,height=480,units="px",bg="white")
barplot(
  aggrBalt$Emissions,
  names.arg=aggrBalt$year,
  main = "Total PM2.5 Emissions From all Baltimore City Sources",
  xlab = "Year",
  ylab = "PM2.5 Emissions (Tons)",
  col = "gray"
)
dev.off()