source('common.R')

plot2 <- function(hpc){
    with(hpc,plot(datetime,Global_active_power,type="l",xlab = NA,ylab = 'Global Active Power (kilowatts)'))
}

save_plot('plot2.png',plot2)
