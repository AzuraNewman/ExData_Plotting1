##Down load data and unzip file
##set wroking directory to the location of the data file
setwd("C:/Coursera data/Exploring Data/Week1/exdata_data_household_power_consumption")


##will need to set graphics device to png

##read in and clean up data
## na values in the source data is indicated by ?  
consumerdata<-read.table("household_power_consumption.txt",header = TRUE,sep = ";", na.strings = "?")
consumerdata$Time<-paste(consumerdata$Date,consumerdata$Time)
consumerdata$Time<-strptime(consumerdata$Time,"%d/%m/%Y %X")
consumerdata$Date<-as.Date(consumerdata$Date,"%d/%m/%Y")

##subsetting to only include desired timeframe.
consumerdata2<-consumerdata[consumerdata$Date >= '2007-02-01' & consumerdata$Date <= '2007-02-02',]



##set par to default


dir.create("C:/Coursera data/Exploring Data/Week1/Analysis/figure")
setwd("C:/Coursera data/Exploring Data/Week1/Analysis/figure")




#plot 3

with(consumerdata2,plot(Time,Sub_metering_1,ylab = "Energy Sub Metering",xlab = "",type = "l"))
with(consumerdata2,lines(Time,Sub_metering_2,col = "red"))
with(consumerdata2,lines(Time,Sub_metering_3,col = "blue"))
legend("topright",lwd = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file = "plot3.png")
dev.off()
