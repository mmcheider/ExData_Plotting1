#
# Description: This project uses “Individual household electric power 
#              consumption Data Set” from UC Irvine Machine Learning 
#              Repository for analysis. Measurements of electric power 
#              consumption in one household with a one-minute sampling rate over
#              a period of almost 4 years. Different electrical quantities and 
#              some sub-metering values are available.
#
# load/read data into R
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";"
                     ,stringsAsFactors = FALSE)
# only use data from the dates 2007-02-01 and 2007-02-02
mydata <- mydata[66638:69518, ] 
# convert date and time character vectors to class of "POSIXlt"
z <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
# make the plot
with(mydata, 
     { 
             plot(z,as.numeric(Sub_metering_1), type = "n", 
                  ylab = "Energy sub metering", xlab = "")
             lines(z,as.numeric(Sub_metering_1),  col = "black", type = "l", 
                   lty = 1, lwd = 1)
             lines(z, as.numeric(Sub_metering_2),  col = "red", type = "l", 
                   lty = 1, lwd = 1)
             lines(z,as.numeric(Sub_metering_3),  col = "blue", type = "l", 
                   lty = 1, lwd = 1)
             # add Legend
             legend("topright",legend = c("Sub_metering_1","Sub_metering_2",
                                          "Sub_metering_3"), col=c("black","red"
                                          ,"blue"), lty=1, xjust = 0, 
                                          y.intersp = 0.8)
     } 
)
# copy the plot to .png file device
dev.copy(png,"plot3.png")
# close the graphics file device
dev.off()
