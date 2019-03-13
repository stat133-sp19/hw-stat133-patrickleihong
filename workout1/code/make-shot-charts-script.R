#Title: Shot Charts Code
#Description: Code used to make individual shot charts that map all the shots a player took on a basketball court
#Inputs: Data files containing shot locations and shots made for each individual player
#Outputs: Graphs of each players individual shots mapped onto a basketball court

library(ggplot2)
library(jpeg)
library(grid)

court_file <- "images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

iguodala <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE)
iguodala_scatterplot <- ggplot(data = iguodala) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))
iguodala_shot_chart <- ggplot(data = iguodala) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
pdf(file = "images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
iguodala_shot_chart
dev.off()

green <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE)
green_scatterplot <- ggplot(data = green) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))
green_shot_chart <- ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
pdf(file = "images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
green_shot_chart
dev.off()

durant <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE)
durant_scatterplot <- ggplot(data = durant) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))
durant_shot_chart <- ggplot(data = durant) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
pdf(file = "images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
durant_shot_chart
dev.off()

thompson <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE)
thompson_scatterplot <- ggplot(data = thompson) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))
thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
pdf(file = "images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
thompson_shot_chart
dev.off()

curry <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE)
curry_scatterplot <- ggplot(data = curry) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))
curry_shot_chart <- ggplot(data = curry) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
pdf(file = "images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
curry_shot_chart
dev.off()

shots_data <- read.csv("data/shots-data.csv", stringsAsFactors = FALSE)

gsw_shot_charts <- ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 Season)') +
  facet_wrap(~ name) +
  theme_minimal()
pdf(file = "images/gsw-shot-charts.pdf", width = 8, height = 7)
gsw_shot_charts
dev.off()

png(file = "images/gsw-shot-charts.png", units = "in", width = 8, height = 7, res = 720)
gsw_shot_charts
dev.off()


