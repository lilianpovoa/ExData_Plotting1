setwd("/Users/Lilian/Documents/Coursera/ExploratoryDataAnalysis")
library(sqldf)
HouseConsumption<-read.csv.sql(file="household_power_consumption.txt", 
             sql = "select * from file where (Date = '1/2/2007' or Date = '2/2/2007')",sep=";")
png("plot1.png", width = 480, height = 480,units = "px")

hist(HouseConsumption$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

dev.off()