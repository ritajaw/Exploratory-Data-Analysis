getwd()
setwd("C:/Users/owner/Desktop/Datascience/Exploratory_data_analysis/Project1")
getwd()

whole_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",  
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 


whole_data$Date<-as.Date(whole_data$Date, format="%d/%m/%Y")

P_data<-subset(whole_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(whole_data)

date_time<-paste(as.Date(P_data$Date), P_data$Time)
P_data$Datetime<-as.POSIXct(date_time)

plot(P_data$Global_active_power~P_data$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="") 


dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 
