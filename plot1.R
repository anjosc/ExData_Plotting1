source('common.R')

plot1 <- function(hpc){
    with(hpc,hist(Global_active_power,col='red',main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)'))
}

save_plot('plot1.png',plot1)
