  # The skip value was obatined by doing a regex search on the file for the first day, ie: 01/01/2007. In this file, 66638
  # was the row. Since we have to skip the header, so the skip value would be 66636
  # The readings were obtained every minute. Each 24 hr day had 1440 minutes (24 * 60), and data analysis was
  # required for two days, therefore nrows would be 2880
  power <- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?",
                      skip = 66636, nrows = 2880, 
                      colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", 
                                   "numeric", "numeric", "numeric"), 
                      col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                    "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  png(filename = "plot1.png", width = 480, height = 480)
  hist(power$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()