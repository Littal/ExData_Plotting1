#reading in the entire dataset 
consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subsetting to the dates 1/2/2007-2/2/2007
subset_consumption <- consumption[(consumption$Date == "1/2/2007")|(consumption$Date == "2/2/2007"), ]

#convert the Date and Time variables to Date/Time classes
subset_consumption$DateTime <- as.POSIXct(paste(subset_consumption$Date, subset_consumption$Time), format="%d/%m/%Y %H:%M:%S")

#creating plot2 as png file
png(filename = "plot2.png")
plot(subset_consumption$DateTime, subset_consumption$Global_active_power, type= "l", xlab = "", ylab = "Global Active Power (kilowatt)")
dev.off()