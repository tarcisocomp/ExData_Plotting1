#Notice: Assuming the dataset folder is in workspace.
power_ds <- read.csv2(file="exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE)
selected.data <- power_ds[power_ds$Date == "1/2/2007" | power_ds$Date == "2/2/2007",]
selected.data$Date <- as.Date(as.character(selected.data$Date), "%d/%m/%Y")
selected.data$Sub_metering_1 <- as.numeric(as.character(selected.data$Sub_metering_1))
selected.data$Sub_metering_2 <- as.numeric(as.character(selected.data$Sub_metering_2))
selected.data$Sub_metering_3 <- as.numeric(as.character(selected.data$Sub_metering_3))

selected.data$Timestamp <- as.numeric(as.POSIXct(paste(selected.data$Date, selected.data$Time), 
                                                 format="%Y-%m-%d %H:%M:%S"))

minX = min(selected.data$Timestamp)
maxX = max(selected.data$Timestamp)
xRange = maxX - minX

png(filename = "plot3.png", width = 480, height = 480)

plot(selected.data$Timestamp, selected.data$Sub_metering_1, 
     type="l", axes = FALSE,
     ylab="Energy sub metering",
     xlab="")
points(selected.data$Timestamp, selected.data$Sub_metering_2, type="l", col="red")
points(selected.data$Timestamp, selected.data$Sub_metering_3, type="l", col="blue")

axis(1,at=seq(minX,maxX,by=xRange/2),labels=c("Thu","Fri","Sat"))
axis(2)
legend("topright", lty=c(1,1), 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       # lwd=c(2.5,2.5),
       col=c("black","blue","red"),
       cex=0.7)

box()
dev.off()
