
  # reading data from file
  data<-read.csv("household_power_consumption.txt",sep=";",
               na.strings="?",colClasses=c("character",
               "character","numeric","numeric","numeric","numeric",
               "numeric","numeric","numeric"))
  #subsetting data
  data<-data[which(data[,1]=="1/2/2007")[1]:tail(which(data[,1]=="2/2/2007"),1),]
  #plotting data to plot1.png
  png("plot1.png", width=480,heigh=480)
  hist(data$Global_active_power,col="red",main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)")
  dev.off()
