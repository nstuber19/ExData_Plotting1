## Exploratory Data Analysis
## Course Project 1
## Plot 2

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
png(file = "plot2.png") 

## Create line graph showing global active power over time (date and time)
## Remove x-axis label
## Set y-axis label to 'Global Active Power (kilowatts)'
plot(powerData$DateTime, 
     as.numeric(powerData$Global_active_power), 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)"
     )

## Closing the PNG file device
dev.off()









































