#' @title bin_probability Function
#' @description Function computes the binomial probability after taking in 3 arguments. Also checks if the 
#' inputs entered are valid. 
#' @param success number of successes given n trials (Could be a vector longer than 1)
#' @param trials number of fixed trials
#' @param prob probability of a success in each trial
#' @return The computed binomial probability given the inputs are valid.
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5,prob = 0.5) 
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)

bin_probability <- function(success, trials, prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  if(check_trials(trials) & check_prob(prob) & check_success(success, trials)){
    return(bin_choose(n = trials, k = success) * (prob^success) * ((1 - prob)^(trials - success)))
  }
}

