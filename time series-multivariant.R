library(xts)
#multivariant time series
(stockprice= ceiling(rnorm(90, mean=500, sd= 40)))
(stock= matrix(stockprice,ncol=3, byrow=F))
(dtindex= as.Date("2018-09-01") + seq(0,29,1))
(ts_xts2 = xts(x=stock, order.by=dtindex))
colnames(ts_xts2)= c('PNB','SBI','HDFC')
ts_xts2
coredata(ts_xts2)
index(ts_xts2)
write.zoo(ts_xts2, "./data/stock_price.csv")

          