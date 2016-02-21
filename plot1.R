#First plot creation in EDA Project1
#Set working directory
#Acer system path
setwd("E:\\Archives\\Personal\\Research\\R_Software_related\\household_power_consumption")

#This code reads only a subset of data from source file.The following lines does some 
#calculations for that.
readLines = grep('1/2/2007;00:00:00;',readLines("household_power_consumption.txt"))
endLine = grep('2/2/2007;23:59:', readLines("household_power_consumption.txt"))

#Decide how many rows to read
nrows2read = endLine[1]-readLines[1]+1

#Create class types to read
class <- c("character", "character", "numeric", "numeric", "numeric","numeric", "numeric", "numeric", "numeric")
data = read.table("household_power_consumption.txt", skip = (readLines[1]-1), nrows = nrows2read, colClasses = class, sep = ";")

#Examine correctness with source
head(data)
tail(data)

#Data fine. Now populate column names
colnames(data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#first plot creation 
par(mfrow =c(1,1))
with(data, hist(Global_active_power, col = "red", xlab = "Global_active_power(KiloWatts)"))

#write to png1 file using dev.copy. Default size itself is 480x480 pixels.
dev.copy(png, file = "png1.png")
dev.off()
