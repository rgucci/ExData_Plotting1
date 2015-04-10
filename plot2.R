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

#create power data
y <- as.numeric(as.character(data$Global_active_power))

#open png device
png("plot2.png", width=480, height=480)

#create the plot
plot(x, y, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

#close png device
dev.off()