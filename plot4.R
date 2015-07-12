
##install.packages("sqldf")

library(sqldf)


raw_data_zip <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              raw_data_zip,
              mode="wb")

unzip(raw_data_zip, "household_power_consumption.txt")

feb_data <- read.csv.sql("household_power_consumption.txt",
                         sep=";",
                         sql = "select * from file where Date='1/2/2007' OR Date='2/2/2007'")

unlink(raw_data_zip)


feb_data <- transform(feb_data, timestamp = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
feb_data <- transform(feb_data, date = as.Date(timestamp))
feb_data <- transform(feb_data, weekday = weekdays(date))


png(file="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# ** First plot
plot( feb_data$Global_active_power,
      type="l",
      ylab="Global Active Power (kilowatts)",
      xlab="",
      xaxt="n")
axis(1, at=1:3, lab=c("Thu", "Fri","Sat"))




# ** Second plot
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
        type="l",
        col="blue"
)


legend("topright", col=c("black","red","blue"),
       legend=c("sub_metering_1",
                "sub_metering_2",
                "sub_metering_3"),
       cex=0.5,
       lwd=1, lty=c(1,1,1))



# Make x axis using Mon-Fri labels
axis(1, at=1:3, lab=c("Thu", "Fri","Sat"))

box()

# ** Forth plot
plot( feb_data$Global_reactive_power,
      type="l",
      ylab="Global_reactive_power",
      xlab="datetime",
      xaxt="n"
)

# Make x axis using Mon-Fri labels
axis(1, at=1:3, lab=c("Thu", "Fri","Sat"))



dev.off()