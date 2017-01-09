setwd("/Users/giorgiarauco/Documents/Misc/Data Science/Course 4/Week 1/ExData_Plotting1")
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zippedFile <- "./Data/household_power_consumption.zip"
File <- "./Data/household_power_consumption.txt"

if (!file.exists(householdFile)) {
  download.file(URL, zippedFile, method = "curl")
  unzip(zippedFile, overwrite = T, exdir = "./Data")
}

plotData <- read.table(File, header=T, sep=";", na.strings="?")

## set time variable
Data <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(Data$Date, Data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
Data <- cbind(SetTime, Data)

plot(Data$SetTime, Data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")