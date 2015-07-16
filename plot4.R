
##install.packages("sqldf")

library(sqldf)

<<<<<<< HEAD
<<<<<<< HEAD
## download the data and unzip
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

# load a data frame with just the two days we care about
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
=======
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25

feb_data <- transform(feb_data, timestamp = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
feb_data <- transform(feb_data, date = as.Date(timestamp))
feb_data <- transform(feb_data, weekday = weekdays(date))


<<<<<<< HEAD
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
png(file="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# ** First plot
<<<<<<< HEAD
<<<<<<< HEAD
plot( feb_data$timestamp,
      feb_data$Global_active_power,
      type="l",
      ylab="Global Active Power (kilowatts)"
)
=======
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
plot( feb_data$Global_active_power,
      type="l",
      ylab="Global Active Power (kilowatts)",
      xlab="",
      xaxt="n")
axis(1, at=1:3, lab=c("Thu", "Fri","Sat"))

<<<<<<< HEAD
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25



# ** Second plot
<<<<<<< HEAD
<<<<<<< HEAD
plot( feb_data$timestamp,
      feb_data$Voltage,
      type="l",
      ylab="Voltage",
      xlab="datetime"
      )


#  ** Third plot
plot( feb_data$timestamp,
      feb_data$Sub_metering_1,
      type="l",
      ylab="Global Active Power (kilowatts)"
)


points( feb_data$timestamp,
        feb_data$Sub_metering_2,
        type="l",
        col="red")

points( feb_data$timestamp,
        feb_data$Sub_metering_3,
=======
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
plot( feb_data$Voltage,
      type="l",
      ylab="Voltage",
      xlab="datetime",
      xaxt="n"
      )
axis(1, at=1:3, lab=c("Thu", "Fri","Sat"))


#  ** Third plot
plot( feb_data$Sub_metering_1,
      type="l",
      ylab="Global Active Power (kilowatts)",
      xlab="",
      xaxt="n"
)


points( feb_data$Sub_metering_2,
        type="l",
        col="red")

points( feb_data$Sub_metering_3,
<<<<<<< HEAD
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
        type="l",
        col="blue"
)


legend("topright", col=c("black","red","blue"),
       legend=c("sub_metering_1",
                "sub_metering_2",
                "sub_metering_3"),
<<<<<<< HEAD
<<<<<<< HEAD
       cex=0.4,
       lwd=1,
       lty=c(1,1,1))



=======
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
       cex=0.5,
       lwd=1, lty=c(1,1,1))



# Make x axis using Mon-Fri labels
axis(1, at=1:3, lab=c("Thu", "Fri","Sat"))

box()
<<<<<<< HEAD
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25

# ** Forth plot
plot( feb_data$Global_reactive_power,
      type="l",
      ylab="Global_reactive_power",
      xlab="datetime",
      xaxt="n"
)

<<<<<<< HEAD
<<<<<<< HEAD
=======
# Make x axis using Mon-Fri labels
axis(1, at=1:3, lab=c("Thu", "Fri","Sat"))
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
=======
# Make x axis using Mon-Fri labels
axis(1, at=1:3, lab=c("Thu", "Fri","Sat"))
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25



dev.off()
