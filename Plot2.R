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



##plot 2

with(consumerdata2,plot(Time,Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = "",type = "l"))
dev.copy(png,file = "unnamed-chunk-3.png")
dev.off()
