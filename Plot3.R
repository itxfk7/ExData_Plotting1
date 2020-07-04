data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#Formating the date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Fetching data of two days
subsetdata<-subset(data, Date>=as.Date("1/2/2007","%d/%m/%Y") & Date<=as.Date("2/2/2007","%d/%m/%Y"))

#Combining date and time 
datetime<-with(subsetdata, paste(Date,Time))
subsetdata<-cbind(datetime,subsetdata)

#Format datetime column
subsetdata$datetime <- as.POSIXct(datetime)

# Plotting graph 
with(subsetdata, plot(Sub_metering_1 ~ datetime, type="l", xlab="", ylab = "Energy Submetring"))
with(subsetdata, points(Sub_metering_2 ~ datetime, type="l",col="blue"))
with(subsetdata, points(Sub_metering_3 ~ datetime, type="l", col="red"))

legend("topright", col = c("black","red","blue"), c("Sub_meetring_1","Sub_meetring_2","Sub_meetring_3"), lwd = 1, cex = 0.40)

# copy on PNG
dev.copy(png, "Plot3.png", width=480, height=480)
dev.off()

