
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

=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
##  for testing with local data
##  feb_data <- read.csv.sql('proj1_raw_data/household_power_consumption.txt',
##                     sep=";",
##                     sql = "select * from file where Date='1/2/2007' OR Date='2/2/2007'")

<<<<<<< HEAD
<<<<<<< HEAD



# Start a png plot that we will save to a file
png(file="plot1.png", width=480, height=480)

# Generate the histogram of Global_active_power
=======
png(file="plot1.png", width=480, height=480)

>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
=======
png(file="plot1.png", width=480, height=480)

>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
hist(feb_data$Global_active_power, col="red",
     breaks=12,
     main = "Global Active Power",
     xlab="Global Active Power (kilowatts)"
)

<<<<<<< HEAD
<<<<<<< HEAD
# close the graphics device to save the plot
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
=======
>>>>>>> 237ccfeaacb40bc2d5d776e6b48effe36dba0b25
dev.off()

