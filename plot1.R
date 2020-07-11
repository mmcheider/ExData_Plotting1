#
# Description: This project uses “Individual household electric power 
#              consumption Data Set” from UC Irvine Machine Learning 
#              Repository for analysis. Measurements of electric power 
#              consumption in one household with a one-minute sampling rate over
#              a period of almost 4 years. Different electrical quantities and 
#              some sub-metering values are available.

# load/Read data into R
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";"
                     ,stringsAsFactors = FALSE)
# only use data from the dates 2007-02-01 and 2007-02-02.
mydata <- mydata[66638:69518, ] 
# change variable type to numeric
mydata <- as.numeric(mydata$Global_active_power)
# plot the hisotgram
hist(mydata, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")
# copy the plot to .png file device
dev.copy(png, "plot1.png")
# close the graphics file device
dev.off()
