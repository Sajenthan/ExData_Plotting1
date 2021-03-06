library(lubridate)
library(dplyr)

ED_A1_Q1_1<- read.table("./household_power_consumption.txt",header = TRUE,sep = ";")
ED_A1_Q1_1$Date<-dmy(ED_A1_Q1_1$Date)

ED_A1_Q1_1<-filter(ED_A1_Q1,Date>="2007-02-01",Date<="2007-02-02")

ED_A1_Q1_1$Global_active_power<-as.numeric(ED_A1_Q1_1$Global_active_power)
ED_A1_Q1_1<-mutate(ED_A1_Q1_1,
                   Date_Time=ymd_hms(paste(ED_A1_Q1_1$Date,ED_A1_Q1_1$Time)))
ED_A1_Q1_1$Sub_metering_1<-as.numeric(as.character(ED_A1_Q1_1$Sub_metering_1))
ED_A1_Q1_1$Sub_metering_2<-as.numeric(as.character(ED_A1_Q1_1$Sub_metering_2))
ED_A1_Q1_1$Global_reactive_power<-as.numeric(ED_A1_Q1_1$Global_reactive_power)/400
ED_A1_Q1_1$Voltage<-as.numeric(as.character(ED_A1_Q1_1$Voltage)) 


#plot 3
png(file = "plot3.png")
plot(ED_A1_Q1_1$Date_Time,ED_A1_Q1_1$Sub_metering_1,type = "l",
     col = "black", xlab = "", ylab = "Energy sub metering")

lines(ED_A1_Q1_1$Date_Time,ED_A1_Q1_1$Sub_metering_2, type = "l", col = "red")
lines(ED_A1_Q1_1$Date_Time,ED_A1_Q1_1$Sub_metering_3, type = "l", col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col = c("black","red","blue"))
dev.off()

