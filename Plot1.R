data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#Formating the date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Fetching data of two days
subsetdata<-subset(data, Date>=as.Date("1/2/2007","%d/%m/%Y") & Date<=as.Date("2/2/2007","%d/%m/%Y"))

#Plotting graph on device sceen
with(subsetdata, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power"))

#Copy graph on png file
dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()


