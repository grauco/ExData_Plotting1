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

columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(Data$SetTime, Data$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(Data$SetTime, Data$Sub_metering_2, col=columnlines[2])
lines(Data$SetTime, Data$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")