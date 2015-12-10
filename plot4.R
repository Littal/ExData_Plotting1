#reading in the entire dataset 
consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subsetting to the dates 1/2/2007-2/2/2007
subset_consumption <- consumption[(consumption$Date == "1/2/2007")|(consumption$Date == "2/2/2007"), ]

#convert the Date and Time variables to Date/Time classes
subset_consumption$DateTime <- as.POSIXct(paste(subset_consumption$Date, subset_consumption$Time), format="%d/%m/%Y %H:%M:%S")

#creating plot4 as png file
png(filename = "plot4.png")
par(mfrow=c(2,2))
plot(subset_consumption$DateTime, subset_consumption$Global_active_power, type= "l", xlab = "", ylab = "Global Active Power")
plot(subset_consumption$DateTime, subset_consumption$Voltage, type= "l", xlab = "datetime", ylab = "Voltage")
plot(subset_consumption$DateTime, subset_consumption$Sub_metering_1, type= "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(subset_consumption$DateTime, subset_consumption$Sub_metering_2, type= "l", col = "red")
lines(subset_consumption$DateTime, subset_consumption$Sub_metering_3, type= "l", col = "blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(subset_consumption$DateTime, subset_consumption$Global_reactive_power, type= "l", xlab = "datetime", ylab= "Global_reactive_power", cex.axis = 0.85)
dev.off()