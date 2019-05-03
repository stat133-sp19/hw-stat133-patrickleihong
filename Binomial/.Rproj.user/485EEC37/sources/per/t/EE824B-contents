context("test if the binomial main functions are working as intended and check for any errors")

test_that("test if bin_choose works as intended",{
  
  expect_equal(bin_choose(n = 5, k = 2), 10)
  expect_equal(bin_choose(n = 5, k = 1:3), c(5, 10, 10))
  expect_type(bin_choose(n = 5, k = 2), "double")
  expect_is(bin_choose(n = 5, k = 2),  "numeric")
})

test_that("test if bin_choose will return an error if k is invalid",{
  
  expect_error(bin_choose(n = 5, k =6))
  expect_error(bin_choose(n = 0, k = 1))
})

test_that("test if bin_probability is working as intended",{
  
  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5), 0.3125)
  expect_equal(bin_probability(success = 0:2, trials = 5, prob = 0.5), c(0.03125, 0.15625, 0.31250))
  expect_type(bin_probability(success = 2, trials = 5, prob = 0.5), "double")
  expect_is(bin_probability(success = 2, trials = 5, prob = 0.5), "numeric")
})

test_that("test if bin_probability will return an error if success, trials, or prob is invalid",{
  
  expect_error(bin_probability(success = 2, trial = 5, prob = 1.3))
  expect_error(bin_probability(success = 2, trial = 5, prob = -0.2))
  expect_error(bin_probability(success = 2, trial = -2, prob = 0.5))
  expect_error(bin_probability(success = 5, trial = 3, prob = 0.5))
  expect_error(bin_probability(success = 2, trial = -2, prob = 1.3))
})

test_that("test if bin_distribution is working as intended",{
  
  expect_is(bin_distribution(trials = 5, prob = 0.5), "bindis")
  expect_is(bin_distribution(trials = 5, prob = 0.5), "data.frame")
  expect_type(bin_distribution(trials = 5, prob = 0.5), "list")
})

test_that("test if bin_distribution will return an error if trials or prob is invalid",{
  
  expect_error(bin_distribution(trials = 5, prob = 1,3))
  expect_error(bin_distribution(trials = 5, prob = -0.2))
  expect_error(bin_distribution(trials = -2, prob = 0.5))
  expect_error(bin_distribution(trials = -2, prob = 1.3))
})

test_that("test if bin_cumulative is working as intended",{
  
  expect_is(bin_cumulative(trials = 5, prob = 0.5), "bincum")
  expect_is(bin_cumulative(trials = 5, prob = 0.5), "data.frame")
  expect_type(bin_cumulative(trials = 5, prob = 0.5), "list")
})

test_that("test if bin_cumulative will return an error if trials or prob is invalid",{
  
  expect_error(bin_cumulative(trials = 5, prob = 1.3))
  expect_error(bin_cumulative(trials = 5, prob = -0.2))
  expect_error(bin_cumulative(trials = -2, prob = 0.5))
  expect_error(bin_cumulative(trials = -2, prob = 1.3))
})
