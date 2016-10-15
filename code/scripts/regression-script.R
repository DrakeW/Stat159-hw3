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


