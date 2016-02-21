#Fourth Plot in EDA Project 1
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

#foURTH PLOT code.THis time Iam using png command instead of dev.copy().
png(file="png4.png",width=480,height=480)
#Set parameters for plot.
par(mfrow =c(2,2), mar = c(5, 4, 2, 1))
#Top Left chart
plot(data[,"Global_active_power"],xaxt = 'n',xlab = "", ylab = "Global Active Power (KiloWatts)",type = "l")
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

#Top Right chart
plot(data[,"Voltage"],xaxt = 'n',xlab = "datetime", ylab = "Voltage",type = "l")
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

#Bottom Left chart
with(data, plot(Sub_metering_1,xaxt = 'n',xlab = "", ylab = "Energy sub metering",type = "l", col = 'red'))
lines(data$Sub_metering_2,col = 'blue')
lines(data$Sub_metering_3,col = 'green')
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
legend(1000,40, legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col=c("red", "blue", "green"), lty=1, cex=0.8)

#Bottom Right chart
plot(data[,"Global_reactive_power"],xaxt = 'n',xlab = "datetime", ylab = "Global_reactive_power",type = "l")
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
dev.off()


