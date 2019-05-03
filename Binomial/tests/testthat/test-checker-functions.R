context("testing the checker functions for proper functionality")

test_that("test that check_prob works with prob: 0 <= prob <= 1",{

  expect_true(check_prob(prob = 0.5))
  expect_true(check_prob(prob = 0.1))
  expect_true(check_prob(prob = 0.9))
  expect_true(check_prob(prob = 0))
  expect_true(check_prob(prob = 1))
})

test_that("test that check_prob will return an error if prob is either > 1 or < 0",{

  expect_error(check_prob(prob = 1.2))
  expect_error(check_prob(prob = -0.5))
})

test_that("test that check_prob works when prob is of length 1",{

  expect_true(check_prob(prob = 0.5))
})

test_that("test that check_prob will return a warning if prob has a length that is not 1",{

  expect_warning(check_prob(prob = c(0.5, 0.5, 0.8, 0.1)))

})

test_that("test that check_trials will work when trials is a non negative number",{

  expect_true(check_trials(trials = 2))
  expect_true(check_trials(trials = 0))
})

test_that("test that check_trials will return an error if trials is a negative number",{

  expect_error(chec_trials(trials = -2))
})

test_that("test that check_trials works when trials is of length 1",{

  expect_true(check_trials(trials = 2))
})

test_that("test that check_trials will return a warning if trials has a lenth that is not 1",{

  expect_warning(check_trials(trials = 2:5))
})

test_that("test that check_success will work when trials is greater than or equal to success",{

  expect_true(check_success(success = 2, trials = 5))
  expect_true(check_success(success = 0, trials = 3))
  expect_true(check_success(success = 2, trials = 2))
})

test_that("test that check_success will return an error when success is greater than trials",{

  expect_error(check_success(success = 5, trials = 2))
  expect_error(check_success(success = 1, trials = 0))
})

test_that("test that check_success will work when success is of length 1 or greater than length 1",{

  expect_true(check_success(success = 2, trials = 5))
  expect_true(check_success(success = 1:5, trials = 5))
  expect_true(check_success(success = c(1,3,5,7), trials = 8))
})
