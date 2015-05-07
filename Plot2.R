#Import the data with the corresponding column names.
names <- read.table("household_power_consumption.txt", sep = ";", nrows = 1,
                    colClasses = "character")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   nrows = 100000, skip = 23000,na.strings = c("?","NA"), 
                   colClasses = c("character", "character", rep("numeric",7)))
colnames(data) <- names

#Subset the data to include only the dates we want.
subdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#Convert the dates to the "Date" format
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

#Creates a line plot of the Global Active Power as a function of the time
par(mfrow = c(1,1), mar = c(5,4,4,2))
plot(subdata$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", cex.lab = .8, cex.axis = .8,
     xaxt = "n", type = "l", xlab = "")
axis(1, at = c(1,1440,2880), labels = c("Thur", "Fri", "Sat"), cex.lab = .8,
     cex.axis = .8, lwd.ticks = .5)

#Save the plot to "Plot2.png"
dev.copy(png,"Plot2.png", width = 480, height = 480, units = "px")
dev.off()
