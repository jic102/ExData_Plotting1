rm(list = ls())
setwd( "/Users/haicen/Desktop/coursera")
# read dataset into r
fh <- file("household_power_consumption.txt")
power_dat <- read.table(text = grep("^[1,2]/2/2007", readLines(fh), value = TRUE), 
                 col.names = c("Date", "Time", "Global_active_power", 
                               "Global_reactive_power", "Voltage", 
                               "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# check the dimension. 
dim(power_dat)
# Generating Plot 1
png(file = 'plot1.png', width = 480, height = 480)
hist(power_dat$Global_active_power, col = "red", 
        main = "Global Active Power", 
            xlab = "Global Active Power (kilowatts)")

dev.off()
