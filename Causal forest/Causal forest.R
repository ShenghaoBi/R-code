library(grf)
library(ggplot2)
# 准备数据
data <- X1233 # 数据框名称为X123
# 创建因果森林对象
causal_forest <- causal_forest(Y = data$Y, W = data$DID, X = data[, c("X1", "X2", "X3", "X4", "X5")],  num.trees = 2000)
causal_forest
print(causal_forest)
tau.hat.oob <- predict(causal_forest)
hist(tau.hat.oob$predictions, main = '',xlab='Treatment effect', col = "steelblue1")
# 估计平均处理效应（ATE）
ate <- average_treatment_effect(causal_forest)
# 打印 ATE 估计值
print(ate)



# 提取分组（E等于1）的TE
treatment_effects_1 <- predict(causal_forest, newdata = subset(data, DID == 1)[, c("X1", "X2", "X3", "X4", "X5")])$predictions

# 提取分组（E等于0）的TE
treatment_effects_0 <- predict(causal_forest, newdata = subset(data, DID == 0)[, c("X1", "X2", "X3", "X4", "X5")])$predictions



# 绘制处理组TE的密度图
ggplot(data.frame(TE = treatment_effects_1), aes(x = TE)) +
  geom_density(fill = "red", alpha = 0.5) +
  labs(title = "Treatment Effects in Group 1 (DID = 1)", x = "Treatment Effects") +
  theme_minimal()
# 绘制对照组TE的密度图
ggplot(data.frame(TE = treatment_effects_0), aes(x = TE)) +
  geom_density(fill = "blue", alpha = 0.5) +
  labs(title = "Treatment Effects in Group 0 (DID = 0)", x = "Treatment Effects") +
  theme_minimal()
# 创建数据框
df <- data.frame(TE = c(treatment_effects_1, treatment_effects_0),
                 Group = rep(c("Treatment", "Control"),
                             times = c(length(treatment_effects_1), length(treatment_effects_0))))

# 绘制处理组和对照组TE的密度图
ggplot(df, aes(x = TE, fill = Group)) +
  geom_density(alpha = 0.5) +
  labs(title = "Treatment Effects Density", x = "Treatment Effects", fill = "Group") +
  scale_fill_manual(values = c("red", "blue")) +
  theme_minimal()

# 计算变量重要性
var_importance <- variable_importance(causal_forest)

# 提取X1、X2、X3的重要性
x1_importance <- var_importance[1]
x2_importance <- var_importance[2]
x3_importance <- var_importance[3]
x4_importance <- var_importance[4]
x5_importance <- var_importance[5]
# 创建比重数据框

covariate_df <- data.frame(Covariate = c("X1", "X2", "X3", "X4", "X5"), Importance = c(x1_importance, x2_importance, x3_importance, x4_importance, x5_importance))

# 绘制比重图
ggplot(covariate_df, aes(x = Covariate, y = Importance)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Impact Proportions of Covariates", x = "Covariate", y = "Importance") +
  theme_minimal()