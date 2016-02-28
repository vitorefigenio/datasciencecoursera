# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system 
# o make a plot answering this question.

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