#
# Description: This project uses “Individual household electric power 
#              consumption Data Set” from UC Irvine Machine Learning 
#              Repository for analysis. Measurements of electric power 
#              consumption in one household with a one-minute sampling rate over
#              a period of almost 4 years. Different electrical quantities and 
#              some sub-metering values are available.

# load/read data into R
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";"
                     ,stringsAsFactors = FALSE)
# only use data from the dates 2007-02-01 and 2007-02-02
mydata <- mydata[66638:69518, ] 
# convert date and time character vectors to class "POSIXlt"  
z <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
# make the line plot
plot(z,as.numeric(mydata$Global_active_power), type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
# copy the plot to .png file device
dev.copy(png, "plot2.png")
# close the graphics file device
dev.off()

