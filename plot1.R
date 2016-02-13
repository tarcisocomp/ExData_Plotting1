#Notice: Assuming the dataset folder is in workspace.
power_ds <- read.csv2(file="exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE)
selected.data <- power_ds[power_ds$Date == "1/2/2007" | power_ds$Date == "2/2/2007",]
selected.data$Global_active_power <- as.numeric(as.character(selected.data$Global_active_power))

png(filename = "plot1.png", width = 480, height = 480)
hist(selected.data$Global_active_power, 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     col = "red")
dev.off()