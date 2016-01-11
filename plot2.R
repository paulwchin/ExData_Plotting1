plot2 <- function(){
      
      temp <- unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
      pwrdata <- read.table(temp,sep = ";",header=TRUE)
      pwrdata$newDate <- as.Date(pwrdata$Date,"%d/%m/%Y")
      subdata <- subset(pwrdata,newDate == "2007-02-01"| newDate == "2007-02-02")
      subdata$Global_active_power = as.numeric(as.character(subdata$Global_active_power))
      subdata$comdt <- as.POSIXct(paste(subdata$newDate,as.character(subdata$Time)),format = "%Y-%m-%d %H:%M:%S")
      
      png(filename = "plot2.png")
      plot(subdata$comdt,subdata$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
      dev.off()
      
      
}