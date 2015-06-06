## read the data from text file using read.table()
data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE, dec = ".")

## getting the required data using subset and "%in%"
requiredData <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## changing the data to numeric
globalActivePower <- as.numeric(requiredData$Global_active_power)

## create a png file using png() with sizes.
png(file = "plot1.png",width = 480, height = 480)

## create a histogram with hist()
hist(globalActivePower, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

## close the graphic device with dev.off()
dev.off()