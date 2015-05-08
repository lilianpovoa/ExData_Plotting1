setwd("/Users/Lilian/Documents/Coursera/ExploratoryDataAnalysis")
library(sqldf)
HouseConsumption<-read.csv.sql(file="household_power_consumption.txt", 
             sql = "select * from file where (Date = '1/2/2007' or Date = '2/2/2007')",sep=";")
HouseConsumption$DateTime<-as.POSIXct(paste(HouseConsumption$Date, HouseConsumption$Time), format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480,units = "px")

par(mfrow=c(2,2)) #allows the visualization of 4 graphs added row by row
#Plot 1
plot(HouseConsumption$DateTime,HouseConsumption$Global_active_power,xlab="",ylab="Global Active Power ", main="",type="l")
#Plot 2
plot(HouseConsumption$DateTime,HouseConsumption$Voltage,xlab="datetime",ylab="Voltage", main="",type="l")
#Plot 3
plot(HouseConsumption$DateTime,HouseConsumption$Sub_metering_1,xlab="",ylab="Energy sub metering", main="",type="n")
points(HouseConsumption$DateTime,HouseConsumption$Sub_metering_1,type="l")
points(HouseConsumption$DateTime,HouseConsumption$Sub_metering_2,type="l",col="red")
points(HouseConsumption$DateTime,HouseConsumption$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black", "red", "blue"),lty=c(1,1,1))
#Plot 4
plot(HouseConsumption$DateTime,HouseConsumption$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power", main="",type="l")

dev.off()
