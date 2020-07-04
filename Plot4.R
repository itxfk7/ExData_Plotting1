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
par(mfrow=c(2,2))
# Plotting graph 
with(subsetdata, plot(Global_active_power ~ datetime, type="l", xlab="", ylab = "Global Active Power (kilowatts)"))

with(subsetdata, plot(Voltage ~ datetime, type="l", ylab = "Voltage"))

with(subsetdata, plot(Sub_metering_1 ~ datetime, type="l", xlab="", ylab ="Energy Submetring"))
with(subsetdata,points(Sub_metering_2 ~ datetime, type="l", col ="red"))
with(subsetdata,points(Sub_metering_3 ~ datetime, type="l", col ="blue"))
legend("topright", col=c("black", "red", "blue"), lwd=1,bty="n",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


with(subsetdata, plot(Global_reactive_power ~ datetime, type="l", ylab = "Global Rective Power (kilowatts)"))


# copy on PNG
dev.copy(png, "Plot4.png", width=480, height=480)
dev.off()
