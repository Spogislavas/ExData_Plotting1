dataa=read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, sep=";", header=TRUE)
library(dplyr)
data11=tbl_df(dataa)
datafil=filter(data11, Date=="1/2/2007" | Date=="2/2/2007")
datafil1=mutate(datafil, date_time=paste(Date, Time, sep=" "))
datafil1$date_time <- strptime(datafil1$date_time, "%d/%m/%Y %H:%M:%S")
datafil1[, 3:9] <- lapply(datafil1[, 3:9], as.numeric)
datafil1 <- datafil1[, c(10, 3:9)]

plot(datafil1$date_time, datafil1$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(datafil1$date_time, datafil1$Sub_metering_2, type = "l", col = "red")
points(datafil1$date_time, datafil1$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), lwd = c(2,2,2), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png")         
dev.off()     
