## Plot 4 displays multiple plots on one graphics device
fname = "./pics/plot4.png"
png(fname, bg = "white")
# Setup multi-plot window
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

# Plot observation intervals vs Global Active Power
par(col = "black", lty = 1)
plot(as.numeric(power_data$date_time), power_data$Global_active_power, 
     type = 'l', xaxt = "n", main = NULL,
     xlab = "",
     ylab = c(gsub("_"," ", colnames(power_data[3])), "(kW)"))
x_range = c(power_data$date_time[1],power_data$date_time[1440],power_data$date_time[nrow(power_data)])
x = as.factor(x_range)
levels(x) <- c("Thu", "Fri", "Sat")
axis(1,at = x_range,levels(x))

# Plot observation intervals vs Voltage

plot(as.numeric(power_data$date_time), power_data$Voltage, 
     type = 'l', xaxt = "n", main = NULL,
     xlab = "datetime",
     ylab = "Voltage")
x_range = c(power_data$date_time[1],power_data$date_time[1440],power_data$date_time[nrow(power_data)])
x = as.factor(x_range)
levels(x) <- c("Thu", "Fri", "Sat")
axis(1,at = x_range,levels(x))

# Plot observation intervals vs. Submetering
plot(as.numeric(power_data$date_time), power_data$Sub_metering_1,
     type = 'l', xaxt = "n", main = NULL,
     xlab = "",
     ylab = "Energy Sub Metering")

par(col = "red", lty = 1)
lines(as.numeric(power_data$date_time), power_data$Sub_metering_2)

par(col = "blue", lty = 1)
lines(as.numeric(power_data$date_time), power_data$Sub_metering_3)

x_range = c(power_data$date_time[1],power_data$date_time[1440],power_data$date_time[nrow(power_data)])
x = as.factor(x_range)
levels(x) <- c("Thu", "Fri", "Sat")
axis(1,at = x_range,levels(x))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       fill = c("black", "red", "blue"), text.col = "black",
       bty = "n", cex = 0.7)

# Plot observation intervals vs Global Reactive Power
par(col = "black", lty = 1)
plot(as.numeric(power_data$date_time), power_data$Global_reactive_power, 
     type = 'l', xaxt = "n", main = NULL,
     xlab = "datetime",
     ylab = c(gsub("_"," ", colnames(power_data[4])), "(kVa)"))
x_range = c(power_data$date_time[1],power_data$date_time[1440],power_data$date_time[nrow(power_data)])
x = as.factor(x_range)
levels(x) <- c("Thu", "Fri", "Sat")
axis(1,at = x_range,levels(x))
dev.off()