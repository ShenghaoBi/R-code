# Load ggplot2 library
library(ggplot2)

ggplot(X1111, aes(x = year, y = coef)) +
  geom_point(color = "blue", size = 3) +  # 点的颜色和大小
  geom_line(color = "blue", size = 1.2) +   # 线的颜色和粗细
  geom_ribbon(aes(ymin = lb, ymax = ub), alpha = 0.2, fill = "lightblue", linetype = "solid") +  # 置信区间的填充和线型
  geom_line(aes(y = lb), linetype = "dashed", color = "blue", size = 1) +  # 下限虚线
  geom_line(aes(y = ub), linetype = "dashed", color = "blue", size = 1) +  # 上限虚线
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray40",size = 0.8) +  # Y=0 虚线
  geom_vline(xintercept = 0, linetype = "dashed", color = "gray40" ,size = 0.8) +  # X=0 虚线
  labs(x = "Year", y = "Coefficient ") +  # 标题和坐标轴标签
  theme_minimal() +  # 主题设置
  theme(panel.grid = element_line(color = "gray", linetype = "dotted"),  # 网格线设置
        axis.text = element_text(size = 10, color = "black"),  # 坐标轴文本设置
        axis.title = element_text(size = 12, face = "bold", color = "black"),  # 坐标轴标题设置
        plot.title = element_text(size = 14, face = "bold", color = "black"),  # 图表标题设置
        legend.position = "bottom",  # 图例位置在底部
        legend.title = element_blank(),  # 去除图例标题
        legend.text = element_text(size = 12, color = "black"),  # 图例文本设置
        legend.key.size = unit(1, "cm"),  # 图例图标大小
        legend.box.spacing = unit(0.5, "cm")) +  # 图例框与图例图标之间的距离
  scale_x_continuous(breaks = seq(-3, 10, 1), expand = c(0.02, 0)) +  # X 轴刻度设置
  scale_y_continuous(expand = c(0.02, 0)) +  # Y 轴刻度设置
  theme(legend.position = "top")  # 图例标签
  theme(axis.ticks.length = unit(0.2, "cm"), axis.ticks = element_line(color = "black"))  # 调整坐标轴刻度样式
  p+theme(legend.position = "bottom") 