## create a data variable to store the data from text
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## get subset of data required for 2 days 
requiredData <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## using strptime() for concatinating date and time
dateData <- strptime(paste(requiredData$Date, requiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## convert Global active power to numeric data
globalActivePower <- as.numeric(requiredData$Global_active_power)

## create a png file using png() with 480 * 480 pixels
png(file = "plot2.png",width = 480, height = 480)

## plot dateData vs. globalActivePower  
plot(dateData, globalActivePower, type ="l", xlab = "" , ylab = "Global Active Power (kilowatts)")

## close the graphic device
dev.off()


