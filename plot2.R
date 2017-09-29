if(!require("sqldf")) install.packages("sqldf")
library(sqldf)

setwd("/Users/ivan.yung/Dropbox/datasciencecoursera/exploratory/")
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')",sep=";")
png(file="plot2.png", width=480, height = 480)

data$dateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(data$dateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()