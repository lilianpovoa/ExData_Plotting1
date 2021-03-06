setwd("/Users/Lilian/Documents/Coursera/ExploratoryDataAnalysis")
library(sqldf)
HouseConsumption<-read.csv.sql(file="household_power_consumption.txt", 
             sql = "select * from file where (Date = '1/2/2007' or Date = '2/2/2007')",sep=";")
HouseConsumption$DateTime<-as.POSIXct(paste(HouseConsumption$Date, HouseConsumption$Time), format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480,units = "px")

plot(HouseConsumption$DateTime,HouseConsumption$Sub_metering_1,xlab="",ylab="Energy sub metering", main="",type="n")
points(HouseConsumption$DateTime,HouseConsumption$Sub_metering_1,type="l")
points(HouseConsumption$DateTime,HouseConsumption$Sub_metering_2,type="l",col="red")
points(HouseConsumption$DateTime,HouseConsumption$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black", "red", "blue"),lty=c(1,1,1))

dev.off()