install.packages("data.table")

# Load necessary libraries
library(data.table)

# Read the data (adjust the file path as necessary)
data <- fread("Y:/exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?")

# Filter the data for the dates of interest
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
filtered_data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02"]

# Create the histogram
png("Plot1.png", width = 480, height = 480)
hist(filtered_data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red", 
     breaks = 30)
dev.off()












