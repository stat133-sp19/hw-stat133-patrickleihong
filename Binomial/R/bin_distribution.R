#' @title bin_distribution Function
#' @description The bin_distribution Function takes in two arguments and returns a data frame with two classes:
#' The primary class is "bindis" which indicates the object is of the binomial distribution class. The other class
#' is the data.frame class. This keeps the object as a data frame. The first column of the data frame will be
#' the successes of the probability distribution and the second column will contain its respective probability.
#' The function will also return an error if either arguments entered are invalid.
#' @param trials number of fixed trials
#' @param prob probability of success in each trial
#' @return data frame with two classes with the probability distribution and the first column will be
#' successes and the second column will be the probability.
#' @export
#' @examples
#' class(bin_distribution(trials = 10, prob = 0.5))

bin_distribution <- function(trials, prob){
  success <- c(0:trials)
  dat <- data.frame("success" = success, "probability" = bin_probability(success, trials, prob))
  class(dat) <- c("bindis", "data.frame")
  return(dat)
}


#' @export
plot.bindis <- function(x, ...){
  plot <- x
  barplot(plot$probability, names.arg = plot$success, xlab = "successes", ylab = "probability", main = "Binomial Distribution")
}
