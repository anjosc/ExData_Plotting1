loadHPC <- function(){

    if (!file.exists('hpc.csv')) {
        library(sqldf)
        library(lubridate)


        #url <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip'
        url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
        zipfile <- 'household_power_consumption.zip'
        download.file(url,zipfile,method="curl")
        unzip(zipfile)

        hpc <- read.csv.sql('household_power_consumption.txt',sep = ';',sql = 'select * from file where Date in  ("1/2/2007", "2/2/2007")')
        closeAllConnections()

        Sys.setlocale('LC_TIME','en_US.UTF8') #otherwise we might not get weekdays in english
        hpc$datetime <- dmy_hms(paste(hpc$Date,hpc$Time))
        hpc <- hpc[,c(10,3:9)]

        write.csv(hpc,'hpc.csv',row.names = FALSE)
    }
    
    read.csv('hpc.csv',colClasses = c("POSIXct",rep("numeric",7)))
}

save_plot <- function(file_name,func){
    dataset <- loadHPC()
    png(file_name,480,480,bg="transparent")
    func(dataset)
    dev.off()
}

