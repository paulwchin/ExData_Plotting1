plot3 <- function(){
      
      temp <- unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
      pwrdata <- read.table(temp,sep = ";",header=TRUE)
      pwrdata$newDate <- as.Date(pwrdata$Date,"%d/%m/%Y")
      subdata <- subset(pwrdata,newDate == "2007-02-01"| newDate == "2007-02-02")
      subdata$Global_active_power = as.numeric(as.character(subdata$Global_active_power))
      subdata$comdt <- as.POSIXct(paste(subdata$newDate,as.character(subdata$Time)),format = "%Y-%m-%d %H:%M:%S")
      subdata$sub1 <- as.numeric(as.character(subdata$Sub_metering_1))
      subdata$sub2 <- as.numeric(as.character(subdata$Sub_metering_2))
      subdata$sub3 <- as.numeric(as.character(subdata$Sub_metering_3))
      
      png(filename = "plot3.png")
      plot(subdata$comdt,subdata$sub1,type ="l",col = "black",xlab = "",ylab = "Energy sub metering")
      lines(subdata$comdt,subdata$sub2,col = "red")
      lines(subdata$comdt,subdata$sub3,col = "blue")
      legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col = c("black","red","blue"))
      dev.off()
      
      
}