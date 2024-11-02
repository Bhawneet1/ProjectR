# Load necessary libraries
library(data.table)


# Read the data (adjust the file path as necessary)
data <- fread("Y:/exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?")

# Filter the data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
filtered_data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02"]

# Create the DateTime column
filtered_data$DateTime <- as.POSIXct(paste(filtered_data$Date, filtered_data$Time))

# Set up the plotting area for 2x2 plots
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Plot 1
plot(filtered_data$DateTime, filtered_data$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")

# Plot 2
plot(filtered_data$DateTime, filtered_data$Voltage, type = "l", 
     ylab = "Voltage", xlab = "Datetime")

# Plot 3
plot(filtered_data$DateTime, filtered_data$Sub_metering_1, type = "l", col = "black", 
     ylab = "Energy sub metering", xlab = "")
lines(filtered_data$DateTime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$DateTime, filtered_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

# Plot 4
plot(filtered_data$DateTime, filtered_data$Global_reactive_power, type = "l", 
     ylab = "Global Reactive Power", xlab = "Datetime")

dev.off()