## Plot 1 displays a histogram of the frequency of occurrence of 
## ranges of Global Active Power
# Set filename of graphics device
fname = "./pics/plot1.png"
# Open graphics deveice
png(fname, bg = "white")
# plot histogram with desired parameters
hist(power_data$Global_active_power, 
     freq = TRUE, col = "red",
     main = gsub("_"," ", colnames(power_data[3])), 
     xlab = c(gsub("_"," ", colnames(power_data[3])), "(kW)"))
# Turn device off
dev.off()
