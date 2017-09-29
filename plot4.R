if(!require("sqldf")) install.packages("sqldf")
library(sqldf)

setwd("/Users/ivan.yung/Dropbox/datasciencecoursera/exploratory/")
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')",sep=";")
png(file="plot4.png", width=480, height = 480)

data$dateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))
plot(data$dateTime, data$Global_active_power, type="l", ylab="Global Active Power", xlab= "")

plot(data$dateTime, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(data$dateTime, data$Sub_metering_1, type="l", col="black", xlab=" ", ylab = "Energy sub metering")
lines(data$dateTime, data$Sub_metering_2, col="red")
lines(data$dateTime, data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="---", col = c("black", "red", "blue"), bty = "n")

plot(data$dateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_reactive_power")
dev.off()