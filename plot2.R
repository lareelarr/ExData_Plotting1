## Plot 2 displays a X-Y plot of the Day of the period vs 
## Global Active Power
# Set filename of graphics device
fname = "./pics/plot2.png"
# Open graphics device
png(fname, bg = "white")
# Setup graphics parameters
par(col = "black", lty = 1)
# Plot x-y plot with desired parameters
plot(as.numeric(power_data$date_time), power_data$Global_active_power, 
     type = 'l', xaxt = "n", main = NULL,
    xlab = "",
    ylab = c(gsub("_"," ", colnames(power_data[3])), "(kW)"))
# Setup and Change x axis labelling
x_range = c(power_data$date_time[1],power_data$date_time[1440],power_data$date_time[nrow(power_data)])
x = as.factor(x_range)
levels(x) <- c("Thu", "Fri", "Sat")
axis(1,at = x_range,levels(x))
# Turn device off
dev.off()