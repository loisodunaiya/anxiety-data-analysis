# 1. Create the dataset
research_data <- data.frame(
  ID = c("P1", "P2", "P3", "P4", "P5"),
  Age = c(22, 25, 19, 28, 24),
  Gender = c("Female", "Male", "Female", "Male", "Female"),
  Anxiety = c(12, 18, 9, 21, 15)
)

# 2. Create anxiety categories
research_data$Anxiety_Group <- ifelse(
  research_data$Anxiety <= 4, "Nonexistent",
  ifelse(research_data$Anxiety <= 10, "Mild",
         ifelse(research_data$Anxiety <= 20, "Moderate", "Severe"))
)

# 3. Load ggplot2
library(ggplot2)

# 4. Create the graph
ggplot(research_data, aes(x = Anxiety_Group, fill = Anxiety_Group)) +
  geom_bar() +
  scale_fill_manual(
    values = c(
      "Mild" = "skyblue",
      "Moderate" = "orange",
      "Severe" = "red"
    )
  ) +
  labs(
    title = "Distribution of Anxiety Categories",
    x = "Anxiety Category",
    y = "Number of Participants",
    fill = "Anxiety Level"
  )

# 5. Save the graph
ggsave("anxiety_distribution.png", width = 8, height = 6, dpi = 300)