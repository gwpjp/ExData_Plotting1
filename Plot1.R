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

#Create a histogram of the subsetted data.  I have set the breaks to be
# every .5 kilowatts.
par(mfrow = c(1,1), mar = c(5,4,4,2))
hist(subdata$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     breaks = seq(0,10,.5), cex.lab = .8, cex.main = .9, cex.axis = .8,
     xaxp = c(0,6,3))

#Save the plot to "Plot1.png"
dev.copy(png,"Plot1.png", width = 480, height = 480, units = "px")
dev.off()



