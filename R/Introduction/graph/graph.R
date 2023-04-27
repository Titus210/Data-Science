# set working directory
setwd("C:/Users/user/Documents/GitHub/Data Science/Data-Science/R/Introduction/graph")
getwd()

# read csv file
data=read.csv("yearData.csv")
# print file data
data
# get summary of data
summary(data)

str(data)

# plot the data
plot(data)

# load graph data
library(ggplot2)

# plot spots
ggplot(data,aes(Time.years..,Sun.Spot.Number)) +
  geom_point()


# plot a line curve
ggplot(data,aes(Time.years..,Sun.Spot.Number)) +
  geom_line() +
  labs(title = "Sun spots Graph")

# plot bar chart
ggplot(data,aes(Time.years..,Sun.Spot.Number)) +
  geom_bar(stat = "identity")


install.packages("ggplot2", dependencies=TRUE)

