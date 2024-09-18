library(ggplot2)

# 假设 X71111 是您的数据框架，包含 id, coef, lb, ub 列
# 假设数据已经准备好 X71111 <- ...

# 将 id 列转换为因子，并指定想要的顺序
X82$id <- factor(X82$id, levels = c("NNM", "CM", "KM", "RF", "Gradboost", "LassoCV"))

# 创建置信区间可视化图
ggplot(X82, aes(x = id, y = coef, color = id)) +
  geom_point(shape = 15, size = 6, fill = "black") + # 点的样式和颜色
  geom_errorbar(aes(ymin = lb, ymax = ub), width = 0.1, color = "gray45", size = 0.5) + # 绘制置信区间
  geom_text(aes(label = sprintf("%.3f", coef)), hjust = -0.5, vjust = 0.4, color = "black", size = 3.5) + # 标注系数，调整vjust值使其在置信区间上方
  labs(x = "", y = "Coefficient") + # 坐标轴标签
  theme_minimal() + # 使用简洁主题
  theme(
    panel.grid.major = element_blank(), # 去掉网格线
    panel.grid.minor = element_blank(), # 去掉次要网格线
    axis.ticks.length = unit(0.3, "cm"), # 增加刻度线长度
    axis.ticks = element_line(color = "black"), # 设置刻度线颜色
    axis.line = element_line(color = "black"), # 添加横纵坐标线
    axis.text.x = element_text(angle = 0, hjust = 0.5),  # 设置 X 轴刻度标签大小、角度和位置
    axis.title.x = element_blank(), # 去掉x轴标题
    axis.text = element_text(size = 10, color = "black") # 设置坐标轴文本大小
  ) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray") + # 添加y=0辅助线，为灰色虚线
  coord_cartesian(ylim = c(-0.1, 1)) + # 设置y轴范围
  scale_color_manual(
    values = c(
      "NNM" = "#367DC0",
      "CM" = "#367DC0",
      "KM" = "#367DC0",
      "RF" = "#e47159",
      "Gradboost" = "#e47159",
      "LassoCV" = "#e47159"
    ),
    labels = c(
      "Geographical", # 合并两个蓝色标签
      "Administrative1", # 合并两个橙色标签
      "Resource" # 合并两个绿色标签
    )
  ) +
  labs(color = "Test") # 设置图例标题