
# Velum analysis

velum_24 <- leavesData$`24-HOURS...3`   # 24 Hrs

velum_48 <- leavesData$`48-HOURS...4`   # 48 Hrs

velum_72 <- leavesData$`72-HOURS...5`   # 72 Hrs

# 1mg_ml analysis

mg_ml_24 <- leavesData$`24-HOURS...7`   # 24 Hrs

mg_ml_48 <- leavesData$`48-HOURS...8`   # 48 Hrs
  # 72 Hrs
mg_ml_72 <- leavesData$`72-HOURS...9`   # 72 Hrs


# DISTILLED H2O  analysis

distilled_24 <- leavesData$`24-HOURS...12`   # 24 Hrs

distilled_48 <- leavesData$`48-HOURS...13`   # 48 Hrs

distilled_72 <- leavesData$`72-HOURS...14`   # 72 Hrs


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


# average means for each treatement
avg_mean_velum <- mean(c(mean_velum_24, mean_velum_48, mean_velum_72))
avg_mean_mg_ml <- mean(c(mean_mg_ml_24, mean_mg_ml_48, mean_mg_ml_72))
avg_mean_distilled_h20 <- mean(c(mean_distilled_24, mean_distilled_48, mean_distilled_72))


# load ggplot l
library(ggplot2)

# Plot of mean values of Velum against time
velum_means <- data.frame(Time = c(24, 48, 72), Mean = c(mean_velum_24, mean_velum_48, mean_velum_72))
ggplot(velum_means, aes(x = Time, y = Mean)) + 
  geom_line() + 
  labs(title = "Mean Velum Values", x = "Time (hours)", y = "Mean Value")
ggsave("velum_means_leaves.jpg")

# Plot of mean values of mg/ml against time
mg_ml_means <- data.frame(Time = c(24, 48, 72), Mean = c(mean_mg_ml_24, mean_mg_ml_48, mean_mg_ml_72))
ggplot(mg_ml_means, aes(x = Time, y = Mean)) + 
  geom_line() + 
  labs(title = "Mean mg/ml Values", x = "Time (hours)", y = "Mean Value")
ggsave("mg_ml_means_leaves.jpg")


# Plot of mean values of Distilled H2O against time
distilled_means <- data.frame(Time = c(24, 48, 72), Mean = c(mean_distilled_24, mean_distilled_48, mean_distilled_72))
ggplot(distilled_means, aes(x = Time, y = Mean)) + 
  geom_line() + 
  labs(title = "Mean Distilled H2O Values", x = "Time (hours)", y = "Mean Value")
ggsave("distilled_means_leaves.jpg")



# Combine the mean values into one data frame
means <- data.frame(Time = rep(c(24, 48, 72), 3),
                    Mean = c(mean_distilled_24, mean_distilled_48, mean_distilled_72,
                             mean_velum_24, mean_velum_48, mean_velum_72,
                             mean_mg_ml_24, mean_mg_ml_48, mean_mg_ml_72),
                    Group = rep(c("Distilled H2O", "Velum", "mg/ml"), each = 3))


ggplot(means, aes(x = Time, y = Mean, fill = Group)) +
  geom_bar(stat = "identity", position = "dodge", width = 10) +
  labs(title = "Distilled H2O, Velum, and mg/ml",
       x = "Time (hours)", y = "Mean Value", fill = "Group") +
  theme(panel.background = element_rect(fill = "white"), plot.background = element_rect(fill = "white")) +
  scale_x_continuous(limits = c(0, 72)) +
  scale_y_continuous(limits = c(0, NA))
ggsave("means_combined_bar_leaves.jpg")



# performing hypotheses testing

# create a data frame with the means for each group

# VELUM
means <- data.frame(
  Group = c("1st Replicate", "2nd Replicate", "3rd Replicate"),
  Hrs24 = velum_24,
  Hrs48 = velum_48,
  Hrs72 = velum_72
)

# load tidyr and dplry lbrary
library(tidyr)
library(dplyr)


# plot the means as a bar plot

means %>% 
  pivot_longer(cols = Hrs24:Hrs72, names_to = "Hours", values_to = "Means") %>% 
  ggplot(aes(x = Group, y = Means, fill = Hours)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(title = "Velum  Test Samples",
       x = "Group",
       y = "data") +
  scale_fill_manual(values = c("red", "blue", "green")) +
  theme_minimal()
ggsave("velum_replicates_leaves_plot.jpg", plot = last_plot(), width = 8, height = 6, dpi = 300)


# mg/ml

means <- data.frame(
  Group = c("1st Replicate", "2nd Replicate", "3rd Replicate"),
  Hrs24 = mg_ml_24,
  Hrs48 = mg_ml_48,
  Hrs72 = mg_ml_72
)

# plot the means as a bar plot
library(ggplot2)
library(tidyr)
library(dplyr)

means %>% 
  pivot_longer(cols = Hrs24:Hrs72, names_to = "Hours", values_to = "Means") %>% 
  ggplot(aes(x = Group, y = Means, fill = Hours)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(title = "mg_ml Test Samples",
       x = "Group",
       y = "data") +
  scale_fill_manual(values = c("red", "blue", "green")) +
  theme_minimal()
ggsave("mg_ml_replicates_leaves__plot.jpg", plot = last_plot(), width = 8, height = 6, dpi = 300)

# Distilled h20

means <- data.frame(
  Group = c("1st Replicate", "2nd Replicate", "3rd Replicate"),
  Hrs24 = mg_ml_24,
  Hrs48 = mg_ml_48,
  Hrs72 = mg_ml_72
)

# plot the means as a bar plot
library(ggplot2)
library(tidyr)
library(dplyr)

means %>% 
  pivot_longer(cols = Hrs24:Hrs72, names_to = "Hours", values_to = "Means") %>% 
  ggplot(aes(x = Group, y = Means, fill = Hours)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(title = "Distilled h20 Test Samples",
       x = "Group",
       y = "data") +
  scale_fill_manual(values = c("red", "blue", "green")) +
  theme_minimal()
ggsave("distilled_leaves__replicates_plot.jpg", plot = last_plot(), width = 8, height = 6, dpi = 300)



 