library(ggplot2)

# Assuming you have defined X1111, lb, ub, and other required data

ggplot(X111, aes(x = year, y = coef)) +
  geom_point(color = "blue", size = 3) + 
  geom_line(color = "blue", size = 1.2) + 
  geom_ribbon(aes(ymin = lb, ymax = ub), alpha = 0.2, fill = "lightblue", linetype = "solid") + 
  geom_line(aes(y = lb), linetype = "dashed", color = "blue", size = 1) + 
  geom_line(aes(y = ub), linetype = "dashed", color = "blue", size = 1) + 
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray40", size = 0.8) + 
  labs(x = "Distance", y = "Coefficient") + 
  theme_minimal() +
  theme(
    axis.text = element_text(size = 10, color = "black"),
    axis.title = element_text(size = 10, face = "bold", color = "black"),
    plot.title = element_text(size = 10, face = "bold", color = "black"),
    legend.position = "bottom",
    legend.title = element_blank(),
    legend.text = element_text(size = 12, color = "black"),
    legend.key.size = unit(1, "cm"),
    legend.box.spacing = unit(0.5, "cm"),
    axis.ticks.length = unit(0.2, "cm"),
    axis.ticks = element_line(color = "black"),
    axis.line = element_line(color = "black"),
    panel.grid.major = element_blank(), # Remove major grid lines
    panel.grid.minor = element_blank() # Remove minor grid lines
  ) +
  scale_x_continuous(breaks = seq(100, 500, 100), expand = c(0.02, 0)) +
  scale_y_continuous(breaks = seq(-0.015, 0.02, 0.005))

