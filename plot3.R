## read the data from text file using read.table()
data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE, dec = ".")

## getting the required data using subset and "%in%"
requiredData <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## using strptime() for concatinating date and time
dateData <- strptime(paste(requiredData$Date, requiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## changing the submetering  data to numeric
sub_metering_1 <- as.numeric(requiredData$Sub_metering_1)
sub_metering_2 <- as.numeric(requiredData$Sub_metering_2)
sub_metering_3 <- as.numeric(requiredData$Sub_metering_3)

## create a png file uisng png() with 480 * 480 pixels
png(file="plot3.png", width = 480, height = 480)
plot(dateData, sub_metering_1, type ="l", xlab="", ylab="Energy sub metering")

## add lines to the plot using lines()
lines(dateData, sub_metering_2, type ="l",col ="red")
lines(dateData, sub_metering_3, type ="l",col ="blue")

## add legends to the plot using legend() with required arguments
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black","red","blue"), lty=1,lwd =2) 

## close the graphic device
dev.off()

