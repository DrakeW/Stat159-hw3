library(testthat)

source("../functions/regression-functions.R")

x <- lm(mpg ~ disp + hp, data = mtcars)
y <- mtcars$mpg

context("Test for RSS")
test_that("RSS should work", {
  expect_gt(residual_sum_squares(x, y), 0)
  expect_equal(residual_sum_squares(x, y), sum(x$residuals**2))
  expect_type(residual_sum_squares(x, y), 'double')
})

context("Test for TSS")
test_that("TSS should work", {
  expect_gt(total_sum_squares(x, y), 0)
  expect_equal(total_sum_squares(x, y), sum((mtcars$mpg - mean(mtcars$mpg))**2))
  expect_type(total_sum_squares(x, y), 'double')
})

context("Test for R-Squared")
test_that("R-Squared should work", {
  expect_gt(r_squared(x, y), 0)
  expect_equal(r_squared(x, y), summary(x)$r.squared)
  expect_type(r_squared(x, y), 'double')
})

context("Test for F-Statistic")
test_that("F-Statistic should work", {
  expect_equal(f_statistic(x, y), unname(summary(x)$fstatistic[1]))
  expect_type(f_statistic(x, y), 'double')
})

context("Test for RSE")
test_that("RSE should work", {
  expect_gt(residual_std_error(x, y), 0)
  expect_equal(residual_std_error(x, y), summary(x)$sigma)
  expect_type(residual_std_error(x, y), 'double')
})