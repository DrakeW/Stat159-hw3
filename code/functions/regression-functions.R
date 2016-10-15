# sum of the squares of residuals (deviations predicted from actual empirical values of data). 
# Input: regression object
# Output: residual sum squares number
residual_sum_squares <- function(reg) {
  sum((data - predict(reg))**2)
}

# Description: sum, over all observations, of the squared differences of each observation from the overall mean.
# Input: regression object
# Output: total sum squares number
total_sum_squares <- function(reg) {
  rss <- residual_sum_squares(reg, data)
  rss + sum((predict(reg) - mean(data))**2)
}

# Description: a number that indicates the proportion of the variance in the dependent variable that is predictable from the independent variable
# Input: regression object
# Output: r squared number
r_squared <- function(reg) {
  rss <- residual_sum_squares(reg, data)
  tss <- total_sum_squares(reg, data)
  1 - rss/tss
}

# Description: f-statistics is a number that indicates the fitness of regression with its coefficients
# Input: regression object
# Output: f statistics number
f_statistic <- function(reg) {
  num_p <- length(reg$coefficients) - 1
  rss <- residual_sum_squares(reg, data)
  tss <- total_sum_squares(reg, data)
  ((tss - rss)/num_p) / (rss/(length(data) - num_p - 1))
}

# Description: RSE is an estimate of the standard error of the residuals
# Input: regression object
# Output: residual standard error number
residual_std_error <- function(reg) {
  num_p <- length(reg$coefficients) - 1
  rss <- residual_sum_squares(reg, data)
  sqrt(rss/(length(data) -num_p - 1))
}

