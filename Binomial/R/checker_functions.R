check_prob <- function(prob){
  if(prob <= 1 & prob >= 0){
    return(TRUE)
  }
  else{
    stop("p has to be a number between 0 and 1")
  }
}

check_trials <- function(trials){
  if(trials >= 0){
    return(TRUE)
  }
  else{
    stop("trials cannot be negative")
  }
}

check_success <- function(success, trials){
  for(i in 1:length(success)){
    if(success[i] <= trials & success[i] >= 0){
    }
    else if(success[i] < 0){
      stop("success cannot be negative")
    }
    else{
      stop("success cannot be greater than trials")
    }
  }
  return(TRUE)
}


