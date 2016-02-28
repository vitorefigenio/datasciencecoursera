# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor
# vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen
# greater changes over time in motor vehicle emissions?

library(RDS)
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

library(ggplot2)

v <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vSCC <- SCC[v,]$SCC
vNEI <- NEI[NEI$SCC %in% vSCC,]
baltVNEI <- vNEI[vNEI$fips=="24510",]
baltVNEI$city <- "Baltimore City"
losVNEI <- vNEI[vNEI$fips=="06037",]
losVNEI$city <- "Los Angeles County"
balt_los_VNEI <- rbind(baltVNEI,losVNEI)

png("plot6.png",width=480,height=480,units="px")
g <- ggplot(balt_los_VNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))
print(g)
dev.off()