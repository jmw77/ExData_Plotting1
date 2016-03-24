# Coursera Exploratory Data Analysis: Course Project 1
# plot1.R
# Author: J. M. Wallace

# Read in the data
mydata<-read.csv("household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE,na.strings="?")
# Convert factor to date format
mydata$Date<-as.Date(mydata$Date, format = "%d/%m/%Y")
# Select only the dates we want
mydata <- subset(mydata, mydata$Date >= "2007-02-01" & mydata$Date <= "2007-02-02")
# Open a png file device
png(filename = "plot1.png", width = 480, height = 480)
# Generate plot 1
hist(mydata$Global_active_power,col="red", 
     xlab="Global Active Power (kilowatts)",
     main = "Global Active Power",breaks=11)
# Close the device
dev.off(dev.cur())
# clean up
rm(mydata)