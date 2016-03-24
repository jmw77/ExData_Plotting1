# Coursera Exploratory Data Analysis: Course Project 1
# plot3.R
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
png(filename = "plot3.png", width = 480, height = 480)
# Generate plot 3
plot(mydata$datetime,mydata$Sub_metering_1,type="l",
     ylab="Energy sub metering",xlab="")
lines(mydata$datetime,mydata$Sub_metering_2,col="red")
lines(mydata$datetime,mydata$Sub_metering_3,col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col=c('black','red','blue'))
# Close the device
dev.off(dev.cur())
# clean up
rm(mydata)