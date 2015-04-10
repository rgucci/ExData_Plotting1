#this assumes thate the file household_power_consumption.txt is in the working dir

#read full data
fullData <- read.table("household_power_consumption.txt", 
                       header=TRUE, 
                       sep=";",
                       stringsAsFactors=FALSE)

#subset the relevant data
dateRange <- c("1/2/2007", "2/2/2007")
data <- fullData[fullData$Date %in% dateRange, ]

#create x data
x <- as.numeric(data$Global_active_power)

#open png device
png("plot1.png", width=480, height=480)

#create plot
hist(x, col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

#close png device
dev.off()