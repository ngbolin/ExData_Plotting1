# importing key libraries
library(lubridate)
library(dplyr)

# set working directory and read file
setwd("~/Desktop")
hpcons <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

# Filtering Database to include only dates between 2007-02-01 and 2007-02-02
df <- hpcons[(hpcons$Date == "1/2/2007" | hpcons$Date == "2/2/2007"), ]

# Converting Time and Date to DateTime
df$DateTime <- strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# Converting Date to Weekday
png(file = "Plot 3.png")
plot(df$DateTime, df$Sub_metering_1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
axis.POSIXct(1, df$DateTime, format = "%a")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "blue", "red"), cex = 0.5)
dev.off()
