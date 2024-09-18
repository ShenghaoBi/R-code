
library(synthdid)
library(ggplot2)
set.seed(12345)

X12345<-as.data.frame(X12345)
setup = panel.matrices(X12345)
tau.hat = synthdid_estimate(setup$Y, setup$N0, setup$T0)
print(summary(tau.hat))

se = sqrt(vcov(tau.hat, method='placebo'))
sprintf('point estimate: %1.2f', tau.hat)
sprintf('95%% CI (%1.2f, %1.2f)', tau.hat - 1.96 * se, tau.hat + 1.96 * se)

# 绘制平行趋势图

a<- plot(tau.hat, se.method='placebo') 
A<-a+theme(legend.position = c(0.18,0.94))
b<-A+scale_x_continuous(breaks =c(2015,2016,2017,2018,2019,2020,2021),
                   labels =c("2015","2016","2017","2018","2019","2020","2021") )
b+geom_vline(xintercept = 2019, linetype = "dashed", color = "gray40" ,size = 0.5)

synthdid_units_plot(tau.hat,se.method="placebo")

#检查处理前平行趋势
plot(tau.hat,overlay=1,se.method = 'placebo')

# 采用 did 和 sc 的方法去进行估计

tau.did = did_estimate(setup$Y,setup$N0,setup$T0)
estimates = list(tau.did,tau.hat)
names(estimates) = c(
                     'Diff-in-Diff',
                     'Synthetic-DID')


# 二种平行趋势图的比较
c<-synthdid_plot(estimates,se.method = 'placebo')
d<-c+theme(legend.position = c(0.18,0.94))
D<-d+scale_x_continuous(breaks =c(2015,2016,2017,2018,2019,2020,2021),
                        labels =c("2015","2016","2017","2018","2019","2020","2021") )
D+geom_vline(xintercept = 2019, linetype = "dashed", color = "gray40" ,size = 0.5)