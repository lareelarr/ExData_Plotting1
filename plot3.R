## Plot 2 displays a X-Y overlay plot of the Day of observation
## period vs 3 different Sub-metering zones
# Set filename of graphics device
fname = "./pics/plot3.png"
# Open graphics device
png(fname, bg = "white")
# Setup graphics parameters
par(col = "black", lty = 1)
# Plot x-y plot with desired parameters
plot(as.numeric(power_data$date_time), power_data$Sub_metering_1, 
     type = 'l', xaxt = "n", main = NULL,
     xlab = "",
     ylab = "Energy Sub Metering")
# Overlay additional x-y plot
par(col = "red", lty = 1)
lines(as.numeric(power_data$date_time), power_data$Sub_metering_2)
# Overlay additional x-y plot
par(col = "blue", lty = 1)
lines(as.numeric(power_data$date_time), power_data$Sub_metering_3)
# Setup and Change x axis labelling
x_range = c(power_data$date_time[1],power_data$date_time[1440],power_data$date_time[nrow(power_data)])
x = as.factor(x_range)
levels(x) <- c("Thu", "Fri", "Sat")
axis(1,at = x_range,levels(x))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       fill = c("black", "red", "blue"), text.col = "black")
# Close graphics device
dev.off()

