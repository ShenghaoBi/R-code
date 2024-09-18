library(ggplot2)

# 将id列转换为因子，并指定想要的顺序
X83$id <- factor(X83$id, levels = c("NNM", "CM", "KM")) 

# 创建置信区间可视化图
ggplot(X83, aes(x = id, y = coef)) +
  geom_point(shape = 15, size = 6, color = "deepskyblue3", fill = "black") + # 点的样式和颜色
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
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray")+ # 添加y=0辅助线，为灰色虚线
  coord_cartesian(ylim = c(-0.5, 0.1)) # 设置y轴范围