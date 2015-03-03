
  Sys.setlocale("LC_ALL","US")
  # reading data from file
  data<-read.csv("household_power_consumption.txt",sep=";",
                 na.strings="?",colClasses=c("character",
                                             "character","numeric","numeric","numeric","numeric",
                                             "numeric","numeric","numeric"))
  #subsetting data
  data<-data[which(data[,1]=="1/2/2007")[1]:tail(which(data[,1]=="2/2/2007"),1),]
  # adding Datetime column to data
  data$Date<-strptime(data$Date,format="%d/%m/%Y")
  datetime <- paste(as.Date(data$Date), data$Time)
  data$Datetime <- as.POSIXct(datetime)
  #plotting data to plot3.png
  png("plot3.png", width=480,heigh=480)
  with(data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
  })
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
