#read the whole dataset
alldata<-read.table("household_power_consumption.txt", header= TRUE, 
                    colClasses= c("character", "character", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric"),
                    sep= ";", na.strings= "?")
#subset the data produced in 2 specific days
data<- subset(alldata, alldata$Date == "1/2/2007" |alldata$Date == "2/2/2007")
#Convert the data in the Date column into class: date
data$Date<- as.Date(data$Date,"%d/%m/%Y")
#creating the histogram showing the Global active power values
hist(data$Global_active_power, col="red", main= "Global Active Power", xlab= "Global Active Power (kilowatts)")
#converting the plot into a PNG file
dev.copy(png, file= "plot1.png")
dev.off()
