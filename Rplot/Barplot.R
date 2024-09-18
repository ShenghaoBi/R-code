library(ggplot2)
data <- X888
# 根据value列的值对数据进行降序排序
data_sorted <- data[order(data$value), ]
# 使用barplot函数柱状图
barplot(height = data_sorted$value, names.arg = data_sorted$name, 
        col = "#367DC0", horiz = TRUE, las = 1, xlab='Importance value', xlim = c(0, 0.30))