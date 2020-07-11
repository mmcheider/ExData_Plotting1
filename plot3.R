mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     stringsAsFactors = FALSE)
mydata <- mydata[66638:69518, ] 


z <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
with(mydata, { plot(z,as.numeric(Sub_metering_1), type = "n", 
                    ylab = "Energy sub metering", xlab = "")
        lines(z,as.numeric(Sub_metering_1),  col = "black", type = "l", 
              lty = 1, lwd = 1)
        lines(z, as.numeric(Sub_metering_2),  col = "red", type = "l", 
              lty = 1, lwd = 1)
        lines(z,as.numeric(Sub_metering_3),  col = "blue", type = "l", 
              lty = 1, lwd = 1)
        ## Add Legend
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2",
                                   "Sub_metering_2"), col=c("black","red","blue"), 
               lty=1, cex=0.8)} )

dev.copy(png, "plot3.png")
dev.off()
