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
with(subsetdata, plot(Global_active_power ~ datetime, type="l", xlab="", ylab = "Global Active Power (kilowatts)"))

# copy on PNG
dev.copy(png, "Plot2.png", width=480, height=480)
dev.off()