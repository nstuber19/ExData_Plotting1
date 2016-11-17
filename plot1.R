## Exploratory Data Analysis
## Course Project 1
## Plot 1 

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

## Creating new PNG file
png(file = "plot1.png") 

## Create histogram of measure Global_active_power
## Set color to 'red'
## Set x-axis label to 'Global Active Power (kilowatts)'
## Set main graph title to 'Global Active Power'
hist(as.numeric(powerData$Global_active_power), 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power"
     )

## Closing the PNG file device
dev.off()

