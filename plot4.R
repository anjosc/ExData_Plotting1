source('common.R')

plot4 <- function(hpc) {
    
    tmp <- par("mfcol")
    par(mfcol=c(2,2))
    with(hpc,{
        plot(datetime,Global_active_power,type="l",xlab = NA,ylab = 'Global Active Power')
        
        plot(datetime,Sub_metering_1,type="l",xlab = NA,ylab = 'Energy sub metering')
        lines(datetime,Sub_metering_2,col="red")
        lines(datetime,Sub_metering_3,col="blue")
        legend("topright", bty = "n",lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        
        plot(datetime,Voltage,type="l")

        plot(datetime,Global_reactive_power,type="l")
        
    })
    par(mfcol=tmp) #restore previous default
}

save_plot('plot4.png',plot4)
