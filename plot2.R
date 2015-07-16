
##install.packages("sqldf")

library(sqldf)

# down load the data and unzip
raw_data_zip <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              raw_data_zip,
              mode="wb")

unzip(raw_data_zip, "household_power_consumption.txt")

# read into a data frame with just the days we care about
feb_data <- read.csv.sql("household_power_consumption.txt",
                         sep=";",
                         sql = "select * from file where Date='1/2/2007' OR Date='2/2/2007'")

unlink(raw_data_zip)

# Add a time stamp to the data frame using the date and time values
feb_data <- transform(feb_data, timestamp = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), tx="GMT")


# start the plot
png(file="plot2.png", width=480, height=480)


plot( feb_data$timestamp,
      feb_data$Global_active_power,
      type="l",
      ylab="Global Active Power (kilowatts)"
)


dev.off()
