
# Velum analysis
  # 24 Hrs
velum_24 <- leavesData$`24-HOURS...3`
velum_24
  # 48 Hrs
velum_48 <- leavesData$`48-HOURS...4`
  # 72 Hrs
velum_72 <- leavesData$`72-HOURS...5`

# 1mg_ml analysis
  # 24 Hrs
mg_ml_24 <- leavesData$`24-HOURS...7` 
  # 48 Hrs
mg_ml_48 <- leavesData$`48-HOURS...8`
  # 72 Hrs
mg_ml_72 <- leavesData$`72-HOURS...9`


# DISTILLED H2O  analysis
  # 24 Hrs
distilled_24 <- leavesData$`24-HOURS...12`
  # 48 Hrs
distilled_48 <- leavesData$`48-HOURS...13`
  # 72 Hrs
distilled_72 <- leavesData$`72-HOURS...14`


# find mean for each hour
  # 24 Hrs
mean_velum_24 <- mean(velum_24)
mean_mg_ml_24 <- mean(mg_ml_24)
mean_distilled_24 <- mean(distilled_24)

  # 48 Hrs
mean_velum_48 <- mean(velum_48)
mean_mg_ml_48 <- mean(mg_ml_48)
mean_distilled_48 <- mean(distilled_48)

  # 72 Hrs
mean_velum_72 <- mean(velum_72)
mean_mg_ml_72 <- mean(mg_ml_72)
mean_distilled_72 <- mean(distilled_72)


# load ggplot l
library(ggplot2)

# Plot of mean values of Velum against time
velum_means <- data.frame(Time = c(24, 48, 72), Mean = c(mean_velum_24, mean_velum_48, mean_velum_72))
ggplot(velum_means, aes(x = Time, y = Mean)) + 
  geom_line() + 
  labs(title = "Mean Velum Values", x = "Time (hours)", y = "Mean Value")
ggsave("velum_means.png")

# Plot of mean values of mg/ml against time
mg_ml_means <- data.frame(Time = c(24, 48, 72), Mean = c(mean_mg_ml_24, mean_mg_ml_48, mean_mg_ml_72))
ggplot(mg_ml_means, aes(x = Time, y = Mean)) + 
  geom_line() + 
  labs(title = "Mean mg/ml Values", x = "Time (hours)", y = "Mean Value")
ggsave("mg_ml_means.png")

# Plot of mean values of Distilled H2O against time
distilled_means <- data.frame(Time = c(24, 48, 72), Mean = c(mean_distilled_24, mean_distilled_48, mean_distilled_72))
ggplot(distilled_means, aes(x = Time, y = Mean)) + 
  geom_line() + 
  labs(title = "Mean Distilled H2O Values", x = "Time (hours)", y = "Mean Value")
ggsave("distilled_means.png")

