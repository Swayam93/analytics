# xts  - create object and export data
library(xts)
#multivariant time series
(stockprice= ceiling(rnorm(90, mean=500, sd= 40)))
(stock= matrix(stockprice,ncol=3, byrow=F))
(dtindex= as.Date("2018-09-01") + seq(0,29,1))
(ts_xts2 = xts(x=stock, order.by=dtindex))
colnames(ts_xts2)= c('PNB','SBI','HDFC')
ts_xts2

#create matrix : 1 col for 1 share
(stockprices = matrix(c(100,103, 105, 205, 210, 207, 530, 500, 535), ncol=3, byrow = F))
(cdtindex = c('25-09-2018', '27-09-2018', '28-09-2018'))
#convert to date format
(dtindex = as.Date(cdtindex, format="%d-%m-%Y"))
#now we have index + matrix for xts object

(ts_xts = xts(x=stockprices, order.by=dtindex))
#this series is not continuous but has missing dates

#-----
#matrix data extract
coredata(ts_xts)
#extract dates
index(ts_xts)


#write to csv file
write.zoo(ts_xts, "./data/zoodata.csv")