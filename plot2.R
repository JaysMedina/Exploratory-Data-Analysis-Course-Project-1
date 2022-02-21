# plot2.r

# Plot 2 is a plot of Global active power values per unique date and time values
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
png("plot2.png", width=480, height=480)
plot(x = toPlot$dateTime, y = toPlot$Global_active_power, 
     type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()