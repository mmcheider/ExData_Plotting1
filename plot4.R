mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     stringsAsFactors = FALSE)
mydata <- mydata[66638:69518, ] 

z <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))
plot(z,as.numeric(mydata$Global_active_power), type = "l", 
     ylab = "Global Active Power", xlab = "")

plot(z,as.numeric(mydata$Voltage), type = "l", 
     ylab = "Voltage", xlab = "datetime")

with(mydata, {plot(z,as.numeric(Sub_metering_1), type = "n", 
                   ylab = "Energy sub meterring", xlab = "")
        lines(z,as.numeric(Sub_metering_1),  col = "black", type = "l", 
              lty = 1, lwd = 1)
        lines(z, as.numeric(Sub_metering_2),  col = "red", type = "l", 
              lty = 1, lwd = 1)
        lines(z,as.numeric(Sub_metering_3),  col = "blue", type = "l", 
              lty = 1, lwd = 1)
        ## Add Legend
        legend("topright",inset = 0.02,legend=c("Sub_metering_1","Sub_metering_2",
                                                "Sub_metering_2"), 
               col=c("black","red","blue"), lty=1, box.lty=0, cex=0.8)})


with(mydata, plot(z, as.numeric(Global_reactive_power), type = "l", 
                  xlab = "datetime",ylab = "Global_reactive_power", ylim = c(0.0,0.5)) )


dev.copy(png, "plot4.png")
dev.off()
