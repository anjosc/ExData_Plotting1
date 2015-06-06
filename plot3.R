source('common.R')

plot3 <- function(hpc) {
    with(hpc,{
        plot(datetime,Sub_metering_1,type="l",xlab = NA,ylab = 'Energy sub metering')
        lines(datetime,Sub_metering_2,col="red")
        lines(datetime,Sub_metering_3,col="blue")
        legend("topright", lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    })
}

save_plot('plot3.png',plot3)
