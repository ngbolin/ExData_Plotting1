# importing key libraries
library(lubridate)
library(dplyr)

# set working directory and read file
setwd("~/Desktop")
hpcons <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

# Converting Time and Date to Date variables
hpcons$Date <- as.Date(hpcons$Date, format = "%d/%m/%Y")
hpcons$Time <- strptime(hpcons$Time, format = "%H:%M:%S")

# Filtering Database to include only dates between 2007-02-01 and 2007-02-02
df <- hpcons[(hpcons$Date == "2007-02-01" | hpcons$Date == "2007-02-02"), ]

# Plotting
png(file = "Plot 1.png")
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()