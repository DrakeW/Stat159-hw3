csv_data <- read.csv("data/Advertising.csv")

# summary statistics
summary_stats_generator <- function(data, name, output_file) {
  cat("Summary Statistics for", name, "\n\n", file = output_file, append = TRUE)
  cat(sprintf("Minimum: %0.2f", min(data)), "\n", file = output_file, append = TRUE)
  cat(sprintf("Maximum: %0.2f", max(data)), "\n", file = output_file, append = TRUE)
  cat(sprintf("Median : %0.2f", median(data)), "\n", file = output_file, append = TRUE)
  cat(sprintf("Mean   : %0.2f", mean(data)), "\n", file = output_file, append = TRUE)
  cat(sprintf("Std Dev: %0.2f", sd(data)), "\n\n", file = output_file, append = TRUE)
}

# correlation matrix
correlation_matrix_generator <- function(data, data_file, output_file) {
  cor_matrix <- cor(data, data)
  save(cor_matrix, file = data_file)
  cat("Correlation Matrix \n\n", file = output_file, append = TRUE)
  write.table(cor_matrix, file = output_file, append = TRUE, sep = " ")
}

# histogram
histogram_generator <- function(data, col_name) {
  output_file <- paste("images/histogram-",col_name,".png", sep = "")
  png(output_file)
  hist(data, main = paste("Histogram of", col_name), xlab = paste(col_name, "Advertising"))
  dev.off()
}

output_file <- "data/eda-output.txt"
data_file <- "data/correlation-matrix.RData"

sink(file = output_file)
for (col in c("TV", "Radio", "Newspaper", "Sales")) {
  summary_stats_generator(csv_data[,col], col, output_file)
  histogram_generator(csv_data[,col], col)
}
correlation_matrix_generator(csv_data, data_file = data_file, output_file = output_file)
sink()

png("images/scatterplot_matrix.png")
pairs(csv_data[2:5])
dev.off()

