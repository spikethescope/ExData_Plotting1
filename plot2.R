#Second plot in EDA Project 1
rm(list=ls())

#Acer system path
setwd("E:\\Archives\\Personal\\Research\\R_Software_related\\household_power_consumption")

#Prepare to read subset of source file.
readLines = grep('1/2/2007;00:00:00;',readLines("household_power_consumption.txt"))
endLine = grep('2/2/2007;23:59:', readLines("household_power_consumption.txt"))
nrows2read = endLine[1]-readLines[1]+1

class <- c("character", "character", "numeric", "numeric", "numeric","numeric", "numeric", "numeric", "numeric")
data = read.table("household_power_consumption.txt", skip = (readLines[1]-1), nrows = nrows2read, colClasses = class, sep = ";")

#Examine data
head(data)
tail(data)
#now populate column namges
colnames(data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Second plot here
plot(data[,"Global_active_power"],xaxt = 'n',xlab = "", ylab = "Global Active Power (KiloWatts)",type = "l")

#title(xlab = c("Thu","Fri"))
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

#write to png2 the output
dev.copy(png, file = "png2.png")
dev.off()

