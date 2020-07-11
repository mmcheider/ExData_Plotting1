mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     stringsAsFactors = FALSE)
mydata <- mydata[66638:69518, ] 


z <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")

plot(z,as.numeric(mydata$Global_active_power), type = "l", 
     ylab = "Global Active Power (killowatts)", xlab = "")
dev.copy(png, "plot2.png")
dev.off()

