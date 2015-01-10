#read the whole dataset
alldata<-read.table("household_power_consumption.txt", header= TRUE, 
                    colClasses= c("character", "character", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric"),
                    sep= ";", na.strings= "?")
#subset the data produced in 2 specific days
data<- subset(alldata, alldata$Date == "1/2/2007" |alldata$Date == "2/2/2007")
#Convert the data in the Date column into class: date
data$Date<- as.Date(data$Date,"%d/%m/%Y")
#combining the date and time data into one column
data$DateTime<- paste(data$Date, data$Time)
#converting the DateTime column into POSIXct class
data$DateTime<- as.POSIXct(data$DateTime)

#plotting the Global active power values on the screen device
plot( data$DateTime, data$Global_active_power, type="l",xlab="", 
      ylab="Global Active Power(kilowatts)", cex.lab=0.9)

#converting the plot into a PNG file
dev.copy(png, file= "plot2.png")
dev.off()