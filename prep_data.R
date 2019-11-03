## This script preps the data needed to run the plot operations
dat_file = "./data/household_power_consumption.txt"
power_data <- read.delim(dat_file, header = TRUE, 
            sep = ";", col.names = header, nrows = 2880, 
            skip = 66636)
temp <- with(power_data, paste(as.character(Date),
        as.character(Time)))
temp2 <- strptime(temp, "%d/%m/%Y %H:%M:%S")
temp3 <- as.POSIXct(temp2)
power_data <- mutate(power_data, date_time = temp3)