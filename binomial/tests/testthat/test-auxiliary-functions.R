context("testing whether the summary auxiliary functions are working as intended")

test_that("test that aux_mean is working properly",{

  expect_equal(aux_mean(trials = 10, prob = 0.3), 3)
  expect_length(aux_mean(trials = 10, prob = 0.3), 1)
  expect_type(aux_mean(trials = 10, prob = 0.3), "double")
  expect_is(aux_mean(trials = 10, prob = 0.3), "numeric")
})

test_that("test that aux_variance is working properly",{

  expect_equal(aux_variance(trials = 10, prob = 0.3), 2.1)
  expect_length(aux_variance(trials = 10, prob = 0.3), 1)
  expect_type(aux_variance(trials = 10, prob = 0.3), "double")
  expect_is(aux_variance(trials = 10, prob = 0.3), "numeric")
})

test_that("test that aux_mode is working properly",{

  expect_equal(aux_mode(trials = 10, prob = 0.3), 3)
  expect_equal(aux_mode(trials = 9, prob = 0.5), c(5,4))
  expect_length(aux_mode(trials = 10, prob = 0.3), 1)
  expect_type(aux_mode(trials = 10, prob = 0.3), "double")
  expect_is(aux_mode(trials = 10, prob = 0.3), "numeric")
})

test_that("test that aux_skewness is working properly",{

  expect_equal(aux_skewness(trials = 10, prob = 0.3), 0.2760262, tolerance = 1e-7)
  expect_length(aux_skewness(trials = 10, prob = 0.3), 1)
  expect_type(aux_skewness(trials = 10, prob = 0.3), "double")
  expect_is(aux_skewness(trials = 10, prob = 0.3), "numeric")
})

test_that("test that aux_kurtosis is working properly",{

  expect_equal(aux_kurtosis(trials = 10, prob = 0.3), -0.1238095, tolerance = 1e-7)
  expect_length(aux_kurtosis(trials = 10, prob = 0.3), 1)
  expect_type(aux_kurtosis(trials = 10, prob = 0.3), "double")
  expect_is(aux_kurtosis(trials = 10, prob = 0.3), "numeric")
})
