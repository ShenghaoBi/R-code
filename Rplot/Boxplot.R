# 加载必要的库
library(ggplot2)

# 假设数据框的名称为 df，并且列名分别为 year 和 Y
# 如果数据框名称是 X123，应将 df 替换为 X123
df <- X888 # 数据框名称为X12345
# 转换 year 列为因子（factor），以保证年份按照顺序排列
df$year <- as.factor(df$year)

# 使用 ggplot2 画箱型图，并调整主题和标签
ggplot(df, aes(x = year, y = Y)) +
  geom_boxplot(fill = "#95CFF9", color = "#367DC0") +
  labs(y = "CI", x = "Year") +  # 标注 Y 和 X 轴的名称
  theme_minimal(base_size = 14) +  # 使用最小化主题，并设置基础字体大小为 14
  theme(axis.line = element_line(color = "black", size = 0.5),  # 设置坐标轴线
        axis.text.x = element_text(size = 15, angle = 0, hjust = 0.5),  # 设置 X 轴刻度标签大小、角度和位置
        axis.text.y = element_text(size = 15),  # 设置 Y 轴刻度标签大小
        axis.ticks = element_line(color = "black"),  # 设置刻度线的颜色
        axis.title = element_text(size = 16, face = "bold"),  # 设置坐标轴标题大小和粗细
        panel.grid.major = element_line(color = "gray90", linetype = "dashed"),  # 设置主要网格线为虚线
        panel.grid.minor = element_blank()) +  # 去除次要网格线
  scale_y_continuous(limits = c(0, 8))  # 设置 Y 轴范围为 0 到 15


# 使用 ggplot2 画箱型图，并将异端值从图中去除，并设置Y轴范围
ggplot(df, aes(x = year, y = Y)) +
  geom_boxplot(fill = "lightblue", color = "blue", outlier.shape = NA) +
  labs(y = "Y") +
  theme_minimal() +
  ylim(0, 4)