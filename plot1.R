# plot1.r

# Plot 1 is a histogram of the global active power in kilowatts
# Only use dates between 2007-02-01 and 2007-02-02
# Missing values are set as "?"

#### call necessary libraries ####
library(data.table)

#### retrieve relevant data ####

# the following code assumes that the txt file is in the working directory
powerData <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)

# convert date to date type
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")

# subset needed data
toPlot <- subset(powerData, powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02")

# make the png then the plot
png("plot1.png", width=480, height=480)
hist(toPlot$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="Red")
dev.off()