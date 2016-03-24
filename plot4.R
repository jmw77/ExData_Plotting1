# Coursera Exploratory Data Analysis: Course Project 1
# plot4.R
# Author: J. M. Wallace

# Read in the data
mydata<-read.csv("household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE, na.strings="?")
# Convert factor to date format
mydata$Date<-as.Date(mydata$Date, format = "%d/%m/%Y")
# Select only the dates we want
mydata <- subset(mydata, mydata$Date >= "2007-02-01" & mydata$Date <= "2007-02-02")
# Combine date and time data
mydata$Time<-as.character(mydata$Time)
mydata$datetime<-strptime(paste(mydata$Date, mydata$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
# Open a png file device
png(filename = "plot4.png", width = 480, height = 480)
# Generate plot 4
# Set the layout to go down columns
par(mfcol=c(2,2))
# Generate first sub-plot
plot(mydata$datetime,mydata$Global_active_power,type="l",
     ylab="Global Active Power",xlab="")
# Generate second sub-plot
plot(mydata$datetime,mydata$Sub_metering_1,type="l",
     ylab="Energy sub metering",xlab="")
lines(mydata$datetime,mydata$Sub_metering_2,col="red")
lines(mydata$datetime,mydata$Sub_metering_3,col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col=c('black','red','blue'),bty="n")
# Generate third sub-plot
plot(mydata$datetime,mydata$Voltage,type="l",
     ylab="Voltage",xlab="datetime")
# Generate fourth sub-plot
plot(mydata$datetime,mydata$Global_reactive_power,type="l",
     ylab="Global_reactive_power",xlab="datetime")
# Close the device
dev.off(dev.cur())
# clean up
rm(mydata)