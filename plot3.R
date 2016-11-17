## Exploratory Data Analysis
## Course Project 1
## Plot 3

## Nick Stuber




## Setting working directory to where data is located
getwd()
setwd("C:/Users/nstuber/Desktop/Optum Data Management/Data Science/Coursera/Exploratory Data Analysis/Week1/hw1")
getwd()

## Load in raw data into dataframe
rawData <- read.table("C:/Users/nstuber/household_power_consumption.txt", 
                      sep = ';', 
                      header = TRUE, 
                      stringsAsFactors = FALSE
)

## Convert the raw data 'Date' column from string to POSIXt
rawData$Date <- strptime(rawData$Date, format = "%d/%m/%Y")
# class(powerData$Date)

## Create dataframe subset of raw data, limit to records with date '2007-02-01' or '2007-02-02'
powerData <- subset(rawData, Date == '2007-02-01' | Date == '2007-02-02')

## Remove complete data file
rm(rawData)

## Create new column combining the 'Date' and 'Time' columns
powerData$DateTime <- paste(powerData$Date, powerData$Time)

## Convert the new column 'DateTime' format from character to POSIXt
powerData$DateTime <- strptime(powerData$DateTime, format = "%Y-%m-%d %H:%M:%S")
# class(powerData$DateTime)

## Creating new PNG file
png(file = "plot3.png") 

## Create line graph showing Sub_metering_1 over time (date and time) in black (default color)
## Setting x-axis label to blank
## setting y-axis lable to "Energy sub metering"
with(powerData, plot(DateTime, as.numeric(Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering"))

## Adding line showing Sub_metering_2 over time (date and time) in red
with(powerData, points(DateTime, as.numeric(Sub_metering_2), type = "l", col = "red"))

## Adding line showing Sub_metering_2 over time (date and time) in blue
with(powerData, points(DateTime, as.numeric(Sub_metering_3), type = "l", col = "blue"))

## Adding legend for our three graphed lines
legend("topright", lty = c(1, 1, 1), cex = 0.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Closing the PNG file device
dev.off()









