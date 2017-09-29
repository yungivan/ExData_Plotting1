if(!require("sqldf")) install.packages("sqldf")
library(sqldf)

setwd("/Users/ivan.yung/Dropbox/datasciencecoursera/exploratory/")
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')",sep=";")
png(file="plot1.png", width=480, height = 480)
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()