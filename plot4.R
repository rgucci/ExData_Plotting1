#this assumes thate the file household_power_consumption.txt is in the working dir

#read full data
fullData <- read.table("household_power_consumption.txt", 
                       header=TRUE, 
                       sep=";",
                       stringsAsFactors=FALSE)

#subset the relevant data
dateRange <- c("1/2/2007", "2/2/2007")
data <- fullData[fullData$Date %in% dateRange, ]

#create time data
timeFormat <- "%d/%m/%Y %H:%M:%S"
x <- as.POSIXct(strptime(paste(data$Date, data$Time, sep=" "), 
                         format=timeFormat))

#create submetered data
#plot 1
y <- as.numeric(data$Global_active_power)

#plot 2
y1 <- as.numeric(data$Sub_metering_1)
y2 <- as.numeric(data$Sub_metering_2)
y3 <- as.numeric(data$Sub_metering_3)

#plot 3
yV <- as.numeric(data$Voltage)

#plot 4
yR <- as.numeric(data$Global_reactive_power)

#open png device
png("plot4.png", width=480, height=480)

#set up the plot parameters
colors <- c("black", "red", "blue")
legends <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

par(mfrow=c(2,2))

#create plot 1
plot(x, y,
     type="l",
     xlab="",
     ylab="Global Active Power")

#create plot 2
plot(x, yV,
     type="l",
     xlab="datetime",
     ylab="Voltage")

#create plot 3
plot(x, y1, 
     type="l",
     col=colors[[1]],
     xlab="",
     ylab="Energy Submetering")
lines(x, y2, 
      type="l", col=colors[[2]])
lines(x, y3, 
      type="l", col=colors[[3]])

legend("topright", 
       legend=legends, 
       lwd=3, 
       col=colors,
       bty="n")

#create plot 4
plot(x, yR,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

#close png device
dev.off()