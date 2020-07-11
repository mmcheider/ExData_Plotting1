
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     stringsAsFactors = FALSE)
mydata <- mydata[66638:69518, ] 
mydata <- as.numeric(mydata$Global_active_power)
hist(mydata, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (killowatts)")
dev.copy(png, "plot1.png")
dev.off()
