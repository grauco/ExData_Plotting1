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

png(filename = "Plot4.png", bg = "white", width = 480, height = 480)

labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(Data$SetTime, Data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(Data$SetTime, Data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(Data$SetTime, Data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Data$SetTime, Data$Sub_metering_2, type="l", col="red")
lines(Data$SetTime, Data$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(Data$SetTime, Data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()