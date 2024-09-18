library(ggplot2)

# 假设 X71111 是您的数据框架，包含 id, coef, lb, ub 列
# 假设数据已经准备好 X71111 <- ...

# 将 id 列转换为因子，并指定想要的顺序
X71111$id <- factor(X71111$id, levels = c("Eastern", "Non-eastern", "High administrative", "Low administrative", "High urbanization", "Low urbanization"))

# 创建置信区间可视化图
ggplot(X71111, aes(x = id, y = coef, color = id)) +
  geom_point(shape = 15, size = 6, fill = "black") + # 点的样式和颜色
  geom_errorbar(aes(ymin = lb, ymax = ub), width = 0.1, color = "gray45", size = 0.5) + # 绘制置信区间
  geom_text(aes(label = sprintf("%.3f", coef)), hjust = -0.5, vjust = 0.4, color = "black", size = 4) + # 标注系数，调整vjust值使其在置信区间上方
  labs(x = "", y = "Coefficient") + # 坐标轴标签
  theme_minimal() + # 使用简洁主题
  theme(
    panel.grid.major = element_blank(), # 去掉网格线
    panel.grid.minor = element_blank(), # 去掉次要网格线
    axis.ticks.length = unit(0.3, "cm"), # 增加刻度线长度
    axis.ticks = element_line(color = "black"), # 设置刻度线颜色
    axis.line = element_line(color = "black"), # 添加横纵坐标线
    axis.title.x = element_blank(), # 去掉x轴标题
    axis.text = element_text(size = 10, color = "black") # 设置坐标轴文本大小
  ) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray") + # 添加y=0辅助线，为灰色虚线
  scale_y_continuous(breaks = seq(-0.06, 0.02, 0.02), expand = c(0.02, 0)) +
  coord_cartesian(ylim = c(-0.07, 0.02)) + # 设置y轴范围
  scale_color_manual(
    values = c(
      "Eastern" = "deepskyblue3",
      "Non-eastern" = "deepskyblue3",
      "High administrative" = "orange",
      "Low administrative" = "orange",
      "High urbanization" = "green3",
      "Low urbanization" = "green3"
    ),
    labels = c(
      "Geographical", # 合并两个蓝色标签
      "Administrative", # 合并两个橙色标签
      "Urbanization" # 合并两个绿色标签
    )
  ) +
  labs(color = "Heterogeneity grouping") # 设置图例标题