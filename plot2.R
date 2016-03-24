# Coursera Exploratory Data Analysis: Course Project 1
# plot2.R
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
png(filename = "plot2.png", width = 480, height = 480)
# Generate plot 2
plot(mydata$datetime,mydata$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
# Close the device
dev.off(dev.cur())
# clean up
rm(mydata)