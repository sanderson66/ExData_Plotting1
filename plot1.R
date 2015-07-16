
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


##  for testing with local data
##  feb_data <- read.csv.sql('proj1_raw_data/household_power_consumption.txt',
##                     sep=";",
##                     sql = "select * from file where Date='1/2/2007' OR Date='2/2/2007'")




# Start a png plot that we will save to a file
png(file="plot1.png", width=480, height=480)

# Generate the histogram of Global_active_power
hist(feb_data$Global_active_power, col="red",
     breaks=12,
     main = "Global Active Power",
     xlab="Global Active Power (kilowatts)"
)

# close the graphics device to save the plot
dev.off()

