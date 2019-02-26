# Instructions: Note that in this dataset missing values are coded as '?'.
# Therefor we use na.strings to replace ? with NA when loading the data
data <- read.table("household_power_consumption.txt", 
                sep = ";", header = TRUE, na.strings = "?")

# Instructions: Date in format dd/mm/yyyy
# You may find it useful to convert the Date and Time variables 
# to Date/Time classes in R using the strptime() and as.Date() functions.
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Instructions: We will only be using data from the dates 2007-02-01 and 2007-02-02.
data_sub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Instructions: Construct the plot and save it to a PNG file with a 
# width of 480 pixels and a height of 480 pixels.
# For png() width and height are 480 pixels by default.
png("plot1.png")

hist(data_sub$Global_active_power, 
                xlab = "Global Active Power (kilowatts)", 
                ylab = "Frequency", 
                col = "red",
                main = "Global Active Power",)
dev.off()