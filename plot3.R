# Instructions: Note that in this dataset missing values are coded as '?'.
# Therefor we use na.strings to replace ? with NA when loading the data
data <- read.table("household_power_consumption.txt", 
                   sep = ";", header = TRUE, na.strings = "?")

# For plotting we need to combine Date and Time into one new column. 
# paste() paste converts its arguments (via as.character) to character strings, 
# and concatenates them (separating them by default by sep = " ")
# strptime converts character vectors to basic date/time class "POSIXlt.
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Instructions: Date is in format dd/mm/yyyy
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Instructions: We will only be using data from the dates 2007-02-01 and 2007-02-02.
data_sub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# For png() width and height are 480 pixels by default.
png("plot3.png")

# Sub_metering_1 corresponds to kitchen (dishwasher, oven, microwave) 
plot(data_sub$DateTime, data_sub$Sub_metering_1, 
                type = "l", xlab = "", ylab = "Energy sub metering")
# Sub_metering_2 corresponds to laundry room (washing-machine, 
# tumble-drier, refrigerator, light)
points(data_sub$DateTime, data_sub$Sub_metering_2, 
                type = "l", col = "red")
# Sub_metering_3 corresponds to electric water-heater and air-conditioner.
points(data_sub$DateTime, data_sub$Sub_metering_3, 
                type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()