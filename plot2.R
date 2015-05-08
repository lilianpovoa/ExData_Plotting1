setwd("/Users/Lilian/Documents/Coursera/ExploratoryDataAnalysis")
library(sqldf)
HouseConsumption<-read.csv.sql(file="household_power_consumption.txt", 
             sql = "select * from file where (Date = '1/2/2007' or Date = '2/2/2007')",sep=";")
HouseConsumption$DateTime<-as.POSIXct(paste(HouseConsumption$Date, HouseConsumption$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480,units = "px")

plot(HouseConsumption$DateTime,HouseConsumption$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", main="",type="l")

dev.off()