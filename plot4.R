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


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 



with(P_data, { 
    plot(Global_active_power~Datetime, type="l",  
    ylab="Global Active Power (kilowatts)", xlab="")
    
    plot(Voltage~Datetime, type="l",  
    ylab="Voltage ", xlab="datetime") 
    
    plot(Sub_metering_1~Datetime, type="l",  
    ylab="Energy sub metering", xlab="") 
    lines(Sub_metering_2~Datetime,col='Red') 
    lines(Sub_metering_3~Datetime,col='Blue') 
    legend('topright', col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
           
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
    plot(Global_reactive_power~Datetime, type="l",  
    ylab="Global_Rective_Power",xlab="datetime") 
    
   }) 


 
 dev.copy(png, file="plot4.png", height=480, width=480) 
 dev.off() 
  