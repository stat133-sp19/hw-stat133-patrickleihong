
#' @title bin_choose Function
#' @description Function that takes in 2 arguments: n (number of trials) and k (number of successes) and
#' and calculates the number of combinations in which k successes occurs in n trials.
#' @param n The number of trials
#' @param k The number of successes (Could be a vector longer than 1)
#' @return The number of combinations in which k successes occur in n trials.
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(n = 5, k = 0)
#' bin_choose(n = 5, k = 1:3)

bin_choose <- function(n, k){
  n <- rep(n, length(k))
  if(any(k > n)){
    stop("k cannot be greater than n")
  }
  else{
    return(factorial(n) / (factorial(k) * factorial(n-k)))
  }
}

