# plot3.R

# Plot 3 is a plot of sub metering power values per unique date and time values
# Only use dates between 2007-02-01 and 2007-02-02
# Missing values are set as "?"

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
png("plot3.png", width=480, height=480)
plot(x = toPlot$dateTime, y = toPlot$Sub_metering_1, 
     type = "l", ylab = "Energy sub metering", xlab = "")
lines(x = toPlot$dateTime, y = toPlot$Sub_metering_2, col="red")
lines(x = toPlot$dateTime, y = toPlot$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1), lwd=c(1,1))
dev.off()