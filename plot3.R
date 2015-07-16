
##install.packages("sqldf")

library(sqldf)

## download the data and unzip
raw_data_zip <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              raw_data_zip,
              mode="wb")

unzip(raw_data_zip, "household_power_consumption.txt")


# load a data frame with just the two days we care about
feb_data <- read.csv.sql("household_power_consumption.txt",
                         sep=";",
                         sql = "select * from file where Date='1/2/2007' OR Date='2/2/2007'")

unlink(raw_data_zip)

# Add a time stamp to the data frame using the date and time values
feb_data <- transform(feb_data, timestamp = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), tx="GMT")


# start the plot
png(file="plot3.png", width=480, height=480)



plot( feb_data$timestamp,
      feb_data$Sub_metering_1,
      type="l",
      ylab="Global Active Power (kilowatts)",
      xlab=""
      )


points( feb_data$timestamp,
        feb_data$Sub_metering_2,
      type="l",
      col="red")

points( feb_data$timestamp,
        feb_data$Sub_metering_3,
        type="l",
        col="blue"
)


legend("topright", col=c("black","red","blue"),
       legend=c("sub_metering_1",
                "sub_metering_2",
                "sub_metering_3"),
       cex=0.5,
       lwd=1,
       lty=c(1,1,1)
)



dev.off()
