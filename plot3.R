#Third plot in EDA project 1

#Clear environment first
rm(list=ls())
#Acer system path
setwd("E:\\Archives\\Personal\\Research\\R_Software_related\\household_power_consumption")

#Prepare to read subset from file.
readLines = grep('1/2/2007;00:00:00;',readLines("household_power_consumption.txt"))
endLine = grep('2/2/2007;23:59:', readLines("household_power_consumption.txt"))
nrows2read = endLine[1]-readLines[1]+1

class <- c("character", "character", "numeric", "numeric", "numeric","numeric", "numeric", "numeric", "numeric")
data = read.table("household_power_consumption.txt", skip = (readLines[1]-1), nrows = nrows2read, colClasses = class, sep = ";")
#Examine data
head(data)
tail(data)

#Create column names
colnames(data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Third plot here
with(data, plot(Sub_metering_1,xaxt = 'n',xlab = "", ylab = "Energy sub metering",type = "l", col = 'red'))
#Adding other two lines...
lines(data$Sub_metering_2,col = 'blue')
lines(data$Sub_metering_3,col = 'green')
#Adding axis labels...
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
#Adding legend...
legend(1850,40, legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col=c("red", "blue", "green"), lty=1, cex=0.8)

#write to png3 file. Default size is 480x480.
dev.copy(png, file = "png3.png")
dev.off()

