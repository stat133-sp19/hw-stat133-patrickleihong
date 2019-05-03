aux_mean <- function(trials, prob){
  return(trials * prob)
}

aux_variance <- function(trials, prob){
  return(trials * prob * (1 - prob))
}

aux_mode <- function(trials, prob){
  return(floor(trials * prob + prob))
}

aux_skewness <- function(trials, prob){
  return((1 - 2*prob) / (sqrt(trials * prob * (1 - prob))))
}

aux_kurtosis <- function(trials, prob){
  return((1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob)))
}