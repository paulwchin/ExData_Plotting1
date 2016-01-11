plot1 <- function(){
      
      temp <- unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
      pwrdata <- read.table(temp,sep = ";",header=TRUE)
      pwrdata$newDate <- as.Date(pwrdata$Date,"%d/%m/%Y")
      subdata <- subset(pwrdata,newDate == "2007-02-01"| newDate == "2007-02-02")
      subdata$Global_active_power = as.numeric(as.character(subdata$Global_active_power))
      png(filename = "plot1.png")
      hist(subdata$Global_active_power, main = "Global Active Power", xlab = "Global Active power (kilowatts)",col="red")
      dev.off()
      
      
}