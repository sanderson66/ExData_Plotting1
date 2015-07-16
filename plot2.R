
##install.packages("sqldf")

library(sqldf)

<<<<<<< HEAD
<<<<<<< HEAD
# down load the data and unzip
=======

>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
=======

>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
raw_data_zip <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              raw_data_zip,
              mode="wb")

unzip(raw_data_zip, "household_power_consumption.txt")

<<<<<<< HEAD
<<<<<<< HEAD
# read into a data frame with just the days we care about
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
feb_data <- read.csv.sql("household_power_consumption.txt",
                         sep=";",
                         sql = "select * from file where Date='1/2/2007' OR Date='2/2/2007'")

unlink(raw_data_zip)

<<<<<<< HEAD
<<<<<<< HEAD
# Add a time stamp to the data frame using the date and time values
feb_data <- transform(feb_data, timestamp = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), tx="GMT")


# start the plot
png(file="plot2.png", width=480, height=480)


plot( feb_data$timestamp,
      feb_data$Global_active_power,
      type="l",
      ylab="Global Active Power (kilowatts)"
)

=======
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25

feb_data <- transform(feb_data, timestamp = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
feb_data <- transform(feb_data, date = as.Date(timestamp))
feb_data <- transform(feb_data, weekday = weekdays(date))

png(file="plot1.png", width=480, height=480)

plot( feb_data$Global_active_power,
      type="l",
      ylab="Global Active Power (kilowatts)",
      xlab="",
      xaxt="n")


# Make x axis using Mon-Fri labels
axis(1, at=1:3, lab=c("Thu", "Fri","Sat"))


box()
<<<<<<< HEAD
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25

dev.off()
