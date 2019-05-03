#' @title bin_variable Function
#' @description The function takes in two arguments and returns a list containing the elements trials 
#' and prob. The list will contain the number of trials and the probability of success. The returned object
#' will be of class binvar which is a binomial variable oject. The function will also check whether the inputs
#' are valid and will return an error if they are not.
#' @param trials trials number of fixed trials
#' @param prob probability of success in each trial 
#' @return A list containing the following named elements: Trials and Probability of success.
#' @export
#' @examples
#' bin_variable(trials = 5, prob = 0.5)

bin_variable <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  var <- list(trials = trials, prob = prob)
  class(var) <- "binvar"
  var
}

#' @export
print.binvar <- function(x, ...){
  cat('"Binomial Variable"\n\n')
  cat("Parameters \n")
  cat("- number of trials:", x$trials ,"\n")
  cat("- prob of success :", x$prob ,"\n")
  invisible(x)
}


#' @export
summary.binvar <- function(x, ...){
  sum <- list(trials = x$trials, prob = x$prob, 
              mean = aux_mean(trials = x$trials, prob = x$prob),
              variance = aux_variance(trials = x$trials, prob = x$prob),
              mode = aux_mode(trials = x$trials, prob = x$prob),
              skewness = aux_skewness(trials = x$trials, prob = x$prob),
              kurtosis = aux_kurtosis(trials = x$trials, prob = x$prob))
  class(sum) <- "summary.binvar"
  sum
}

#' @export
print.summary.binvar <- function(x, ...){
  cat('"Binomial Variable"\n\n')
  cat("Parameters \n")
  cat("- number of trials:", x$trials ,"\n")
  cat("- prob of success :", x$prob ,"\n\n")
  cat("Measures \n")
  cat("- mean    :", aux_mean(trials = x$trials, prob = x$prob), "\n")
  cat("- variance:", aux_variance(trials = x$trials, prob = x$prob), "\n")
  cat("- mode    :", aux_mode(trials = x$trials, prob = x$prob), "\n")
  cat("- skewness:", aux_skewness(trials = x$trials, prob = x$prob), "\n")
  cat("- kurtosis:", aux_kurtosis(trials = x$trials, prob = x$prob), "\n")
  invisible(x)
}

