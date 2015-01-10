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

#install tidyr package
install.packages("tidyr")
library(tidyr)

#combine all submetering vlauesinto one column named Value
data1<- gather(data,Submetering, Value, -Date, -Time, -Global_active_power, 
               - Global_reactive_power, -Voltage, -Global_intensity, -DateTime)

#plotting the Global active power values on the screen device
plot(data1$DateTime, data1$Value, xlab="", ylab="Energy sub metering", cex.lab=0.8, type="n")
with(subset(data1, Submetering== "Sub_metering_1"), points(DateTime,Value,type="l", col="black"))
with(subset(data1, Submetering== "Sub_metering_2"), points(DateTime,Value,type="l", col="red"))
with(subset(data1, Submetering== "Sub_metering_3"), points(DateTime,Value,type="l", col="blue"))
legend("topright", lty= 1, col=c("black", "red", "blue"), 
       legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)


#converting the plot into a PNG file
dev.copy(png, file= "plot3.png")
dev.off()