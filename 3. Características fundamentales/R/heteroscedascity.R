library(TSA)

data(CREF)
r.cref=diff(log(CREF))*100
res = McLeod.Li.test(y=r.cref)
res$p.values

res = McLeod.Li.test(y=CREF)
res$p.values
