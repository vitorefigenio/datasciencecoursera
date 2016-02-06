# Plot 1
##Loading Data

# Full Data
power_full_data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power_full_data$Date <- as.Date(power_full_data$Date, format="%d/%m/%Y")

# 2-days February 2007
two_days <- subset(power_full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power_full_data)

# Creating a Datetime parameter
datetime <- paste(as.Date(two_days$Date), two_days$Time)
two_days$Datetime <- as.POSIXct(datetime)

head(two_days)

# Plot
hist(two_days$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# Export to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()