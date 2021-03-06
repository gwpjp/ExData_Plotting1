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

#Create a 2x2 array of plots
par(mfcol = c(2,2), mar = c(3,4,2,1))

#Creates a line plot of the Global Active Power as a function of the time
plot(subdata$Global_active_power, 
     ylab = "Global Active Power", cex.lab = .8, cex.axis = .8,
     xaxt = "n", type = "l", xlab = "")
axis(1, at = c(1,1440,2880), labels = c("Thur", "Fri", "Sat"), cex.lab = .8,
     cex.axis = .8, lwd.ticks = .5)

# Create 3 line graphs on the same plot.
plot(subdata$Sub_metering_1, 
     ylab = "Energy sub metering", cex.lab = .8, cex.axis = .8,
     xaxt = "n", type = "l", xlab = "")
axis(1, at = c(1,1440,2880), labels = c("Thur", "Fri", "Sat"), cex.lab = .8,
     cex.axis = .8, lwd.ticks = .5)
points(subdata$Sub_metering_2, type = "l", col = "red")
points(subdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       cex = .6, xjust = 1, box.lwd = 0, seg.len = 1)

#Creates a line plot of the Voltage as a function of the time
plot(subdata$Voltage, 
     ylab = "Voltage", cex.lab = .8, cex.axis = .8,
     xaxt = "n", type = "l", xlab = "")
axis(1, at = c(1,1440,2880), labels = c("Thur", "Fri", "Sat"), cex.lab = .8,
     cex.axis = .8, lwd.ticks = .5)

#Creates a line plot of the Global Rective Power as a function of the time
plot(subdata$Global_reactive_power, 
     ylab = "Global Reactive Power", cex.lab = .8, cex.axis = .8,
     xaxt = "n", type = "l", xlab = "")
axis(1, at = c(1,1440,2880), labels = c("Thur", "Fri", "Sat"), cex.lab = .8,
     cex.axis = .8, lwd.ticks = .5)

#Save the plot to "Plot4.png"
dev.copy(png,"Plot4.png", width = 480, height = 480, units = "px")
dev.off()
