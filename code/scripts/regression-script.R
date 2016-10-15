csv_data <- read.csv("data/Advertising.csv")
data_file = "data/regression.RData"

# regression objects
reg <- lm(Sales ~ TV + Radio + Newspaper, data = csv_data)
reg_tv <- lm(Sales ~ TV, data = csv_data)
reg_radio <- lm(Sales ~ Radio, data = csv_data)
reg_newspaper <- lm(Sales ~ Newspaper, data = csv_data)
reg_summary <- summary(reg)
save(reg, reg_tv, reg_radio, reg_newspaper, reg_summary, file = data_file)

# plots
plots <- c("images/residual-plot.png", "images/scale-location-plot.png", "images/normal-qq-plot.png")
for (i in 1:3) {
  png(plots[i])
  plot(reg, which = i)
  dev.off()
}

scatterplot_generator <- function (data, col_name1, col_name2) {
  image_file <- paste("images/scatterplot-", col_name1, "-", col_name2, ".png", sep = "")
  png(image_file)
  plot(data[,col_name1], 
       data[,col_name2], 
       main = paste("Scatterplot of", col_name1, " and", col_name2),
       xlab = col_name1, 
       ylab = col_name2)
  reg <- lm(data[,col_name2] ~ data[,col_name1])
  abline(reg, col = "blue")
  dev.off()
}

cols <- c("TV", "Newspaper", "Radio")
for (col in cols) {
  scatterplot_generator(csv_data, col, "Sales")
}

