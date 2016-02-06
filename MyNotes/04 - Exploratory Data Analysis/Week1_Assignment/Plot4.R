# Plot 4
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
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(two_days, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l",  ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

# Export to PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()