library(TSA)

WN <- function(N, mu, variance) {
  x<-rnorm(n=N, mean=mu,sd=sqrt(variance))
  
  return(x)
}

wn<-WN(1000,0,0.0004)

plot(wn, main="WHITE NOISE", 
     xlab="t",
     typ='l', col="red")

res = McLeod.Li.test(y=wn)
res$p.values
