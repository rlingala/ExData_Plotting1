## read the data from text file using read.table()
data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE, dec = ".")

## getting the required data using subset and "%in%"
requiredData <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## using strptime() for concatinating date and time
dateData <- strptime(paste(requiredData$Date, requiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## conert required columns to numeric for plot
globalActivePower <- as.numeric(requiredData$Global_active_power)
globalReactivePower <- as.numeric(requiredData$Global_reactive_power)
voltageData <- as.numeric(requiredData$Voltage)

## changing the submetering character data to numeric
sub_metering_1 <- as.numeric(requiredData$Sub_metering_1)
sub_metering_2 <- as.numeric(requiredData$Sub_metering_2)
sub_metering_3 <- as.numeric(requiredData$Sub_metering_3)

## create a png file using png() with 480 * 480 pixels
png(file="plot4.png", width = 480, height = 480)

## using par() to create 2x2 chart matrix
par(mfrow= c(2,2))

## plot data for chart#1
plot(dateData, globalActivePower, type ="l", xlab = "" , ylab = "Global Active Power")

## plot data for chart#2
plot(dateData,voltageData, type ="l", xlab = "datetime",ylab = "Voltage")

## plot data for chart#3
plot(dateData, sub_metering_1, type ="l", xlab="", ylab="Energy sub metering")
lines(dateData, sub_metering_2, type ="l",col ="red")
lines(dateData, sub_metering_3, type ="l",col ="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col= c("black","red","blue"),lty=1, lwd=2.5, bty="n") 

## plot data for chart#4
plot(dateData, globalReactivePower , type="l" , xlab = "datetime", ylab = "Global_reactive_power")

## close the graphic device
dev.off()


