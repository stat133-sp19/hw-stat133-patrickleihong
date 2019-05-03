#' @title bin_mean function
#' @description Function that will take in 2 arguments and return the mean of the binomial distribution.
#' It will also check whether the parameters entered are valid and will return an error if either variable
#' entered is invalid. 
#' @param trials number of fixed trials
#' @param prob probability of a success in each trial
#' @return the mean of the binomial distribution
#' @export
#' @examples
#' bin_mean(10, 0.3)

bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials, prob)
}

#' @title bin_variance function
#' @description Function that will take in 2 arguments and return the variance of the binomial distribution.
#' It will also check whether the parameters entered are valid and will return an error if either variable
#' entered is invalid. 
#' @param trials number of fixed trials
#' @param prob probability of a success in each trial
#' @return the variance of the binomial distribution
#' @export
#' @examples 
#' bin_variance(10, 0.3)

bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials, prob)
}

#' @title bin_mode function
#' @description Function that will take in 2 arguments and return the mode of the binomial distribution.
#' It will also check whether the parameters entered are valid and will return an error if either variable
#' entered is invalid. 
#' @param trials number of fixed trials
#' @param prob probability of a success in each trial
#' @return the mode of the binomial distribution
#' @export
#' @examples
#' bin_mode(10, 0.3)

bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials, prob)
}

#' @title bin_skewness function
#' @description Function that will take in 2 arguments and return the skewness of the binomial distribution.
#' It will also check whether the parameters entered are valid and will return an error if either variable
#' entered is invalid. 
#' @param trials number of fixed trials
#' @param prob probability of a success in each trial
#' @return the skewness of the binomial distribution
#' @export
#' @examples
#' bin_skewness(10, 0.3) 

bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials, prob)
}


#' @title bin_kurtosis function
#' @description Function that will take in 2 arguments and return the kurtosis of the binomial distribution.
#' It will also check whether the parameters entered are valid and will return an error if either variable
#' entered is invalid. 
#' @param trials number of fixed trials
#' @param prob probability of a success in each trial
#' @return the kurtosis of the binomial distribution
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials, prob)
}

