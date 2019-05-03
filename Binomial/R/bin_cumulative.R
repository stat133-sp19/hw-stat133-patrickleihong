#' @title bin_cumulative Function 
#' @description The function takes in two arguments and returns a data frame with two classes: the primary 
#' class is bincum which is an object with class binomial cumulative distribution, and data frame to keep
#' the object as a data frame. The data frame returned will contain 3 columns. The first column are the 
#' successes of the probability distribution, the second column is the respective probabilities, and the 
#' third column is the cumulative of all the probabilities. The function will also check whether the 
#' inputs are valid and will return an error if they are not.
#' @param trials trials number of fixed trials
#' @param prob probability of success in each trial 
#' @return data frame of two classes (bincum and data.frame) that has 3 columns containing the probability
#' distribution and cumulative probabilities. The first column is successes, second column is probabilities,
#' and third column is cumulative.
#' @export
#' @examples
#' bin_cumulative(trials = 5, prob = 0.2)

bin_cumulative <- function(trials, prob){
  dat <- bin_distribution(trials, prob)
  prob <- dat[,2]
  cum <- 1
  for(i in 1:nrow(dat)){
    if(i == 1){
      cum[i] <- prob[i]
    }
    else{
      cum[i] <- prob[i] + cum[i-1]
    }
  }
  dat <- data.frame(dat, "cumulative" = cum)
  class(dat) <- c("bincum", "data.frame")
  return(dat)
}

#' @export
plot.bincum <- function(x, ...){
  plot <- x
  plot(x=plot$success, y=plot$cumulative, cex = 2, xlab = "successes", ylab = "probability")
  lines(x = plot$success, y = plot$cumulative)
}
