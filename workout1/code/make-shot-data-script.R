#Title: Shot data 
#Description: Load and manipulate the data for shots taken from each player and then combine all the data sets into one dataframe
#Inputs: Shot data from individual players
#Outputs: Summary data from the csv files loaded in

iguodala <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE)
iguodala$name <- c("Andre Iguodala")
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"
iguodala$minute <- iguodala$period * 12 - iguodala$minutes_remaining
sink(file = "output/andre-iguodala-summary.txt")
summary(iguodala)  

green <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE)
green$name <- c("Draymond Green")
green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"
green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"
green$minute <- green$period * 12 - green$minutes_remaining
sink(file = "output/draymond-green-summary.txt")
summary(green)

durant <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE)
durant$name <- c("Kevin Durant")
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes"
durant$minute <- durant$period * 12 - durant$minutes_remaining
sink(file = "output/kevin-durant-summary.txt")
summary(durant)

thompson <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE)
thompson$name <- c("Klay Thompson")
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_yes"
thompson$minute <- thompson$period * 12 - thompson$minutes_remaining
sink(file = "output/klay-thompson-summary.txt")
summary(thompson)

curry <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE)
curry$name <- c("Stephen Curry")
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"
curry$minute <- curry$period * 12 - curry$minutes_remaining
sink(file = "output/stephen-curry-summary.txt")
summary(curry)

shots_data <- rbind(iguodala, green, durant, thompson, curry)
write.csv(
  x = shots_data,
  file = "data/shots-data.csv"
  )
sink(file = "output/shots-data-summary.txt")
summary(shots_data)
