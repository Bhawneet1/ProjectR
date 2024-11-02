# Load necessary libraries
library(data.table)

# Read the data (adjust the file path as necessary)
data <- fread("Y:/exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?")

# Filter the data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
filtered_data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02"]

# Create the DateTime column
filtered_data$DateTime <- as.POSIXct(paste(filtered_data$Date, filtered_data$Time))

# Create the time series plot
png("plot2.png", width = 480, height = 480)
plot(filtered_data$DateTime, filtered_data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()