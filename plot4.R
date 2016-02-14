#Notice: Assuming the dataset folder is in workspace.
power_ds <- read.csv2(file="exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE)
selected.data <- power_ds[power_ds$Date == "1/2/2007" | power_ds$Date == "2/2/2007",]
selected.data$Date <- as.Date(as.character(selected.data$Date), "%d/%m/%Y")
selected.data$Sub_metering_1 <- as.numeric(as.character(selected.data$Sub_metering_1))
selected.data$Sub_metering_2 <- as.numeric(as.character(selected.data$Sub_metering_2))
selected.data$Sub_metering_3 <- as.numeric(as.character(selected.data$Sub_metering_3))
selected.data$Global_active_power <- as.numeric(as.character(selected.data$Global_active_power))
selected.data$Global_reactive_power <- as.numeric(as.character(selected.data$Global_reactive_power))
selected.data$Voltage <- as.numeric(as.character(selected.data$Voltage))
selected.data$Timestamp <- as.numeric(as.POSIXct(paste(selected.data$Date, selected.data$Time), 
                                                 format="%Y-%m-%d %H:%M:%S"))

minX = min(selected.data$Timestamp)
maxX = max(selected.data$Timestamp)
xRange = maxX - minX

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

#Plot1
plot(selected.data$Timestamp, selected.data$Global_active_power, 
     type="l", axes = FALSE,
     ylab="Global Active Power",
     xlab="")
axis(1,at=seq(minX,maxX,by=xRange/2),labels=c("Thu","Fri","Sat"))
axis(2)
box()

#Plot2
plot(selected.data$Timestamp, selected.data$Voltage, 
     type="l", axes = FALSE,
     ylab="Voltage",
     xlab="datetime")
axis(1,at=seq(minX,maxX,by=xRange/2),labels=c("Thu","Fri","Sat"))
axis(2)
box()


#Plot3
plot(selected.data$Timestamp, selected.data$Sub_metering_1, 
     type="l", axes = FALSE,
     ylab="Energy sub metering",
     xlab="")
points(selected.data$Timestamp, selected.data$Sub_metering_2, type="l", col="red")
points(selected.data$Timestamp, selected.data$Sub_metering_3, type="l", col="blue")

axis(1,at=seq(minX,maxX,by=xRange/2),labels=c("Thu","Fri","Sat"))
axis(2)
legend("topright", lty=c(1,1,1), 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       bty="n",
       cex=0.9)
box()


#Plot4
plot(selected.data$Timestamp, selected.data$Global_reactive_power, 
     type="l", axes = FALSE,
     ylab="Global_reactive_power",
     xlab="datetime")
axis(1,at=seq(minX,maxX,by=xRange/2),labels=c("Thu","Fri","Sat"))
axis(2)
box()

dev.off()
