# plot4.R

# Plot 4 shows the global average power, voltage, energy sub metering, and global reactive powe values per unique date and time values
# Only use dates between 2007-02-01 and 2007-02-02
# Missing values are set as "?"

setwd("[put your working directory here]")

#### call necessary libraries ####
library(data.table)
library(lubridate)

#### retrieve relevant data ####

# the following code assumes that the txt file is in the working directory
powerData <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)

# convert date to date type
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")

# subset needed data
toPlot <- subset(powerData, powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02")

# make new column combining date and time
toPlot$dateTime <- ymd_hms(paste(toPlot$Date,toPlot$Time))

# make the png then the plot
png("plot4.png", width=480, height=480)

# define the canvas
par(mfrow=c(2,2))

# plot 1
plot(x = toPlot$dateTime, y = toPlot$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# plot 2
plot(x = toPlot$dateTime, y = toPlot$Voltage , type = "l", ylab = "Voltage", xlab = "datetime")

# plot 3
plot(x = toPlot$dateTime, y = toPlot$Sub_metering_1, 
     type = "l", ylab = "Energy sub metering", xlab = "")
lines(x = toPlot$dateTime, y = toPlot$Sub_metering_2, col="red")
lines(x = toPlot$dateTime, y = toPlot$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1), lwd=c(1,1))

# plot 4
plot(x = toPlot$dateTime, y = toPlot$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()