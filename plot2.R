#Notice: Assuming the dataset folder is in workspace.
power_ds <- read.csv2(file="exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE)
selected.data <- power_ds[power_ds$Date == "1/2/2007" | power_ds$Date == "2/2/2007",]
selected.data$Date <- as.Date(as.character(selected.data$Date), "%d/%m/%Y")
selected.data$Global_active_power <- as.numeric(as.character(selected.data$Global_active_power))
selected.data$Timestamp <- as.numeric(as.POSIXct(paste(selected.data$Date, selected.data$Time), 
                                      format="%Y-%m-%d %H:%M:%S"))

minX = min(selected.data$Timestamp)
maxX = max(selected.data$Timestamp)
xRange = maxX - minX

png(filename = "plot2.png", width = 480, height = 480)

plot(selected.data$Timestamp, selected.data$Global_active_power, 
     type="l", axes = FALSE,
     ylab="Global Active Power (killowatts)",
     xlab="")
axis(1,at=seq(minX,maxX,by=xRange/2),labels=c("Thu","Fri","Sat"))
axis(2)
box()

dev.off()
