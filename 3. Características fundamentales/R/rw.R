library(TSA)

RW <- function(N, x0, mu, variance) {
  z<-cumsum(rnorm(n=N, mean=0, 
                  sd=sqrt(variance)))
  t<-1:N
  x<-x0+t*mu+z
  return(x)
}

P1<-RW(100,10,0,0.0004)
P2<-RW(100,10,0,0.0004)

plot(P1, main="Random Walk", 
     xlab="t",ylab="Price", ylim=c(9.7,10.3),
     typ='l', col="red")

par(new=T)  # para hacer ambos dibujos en el mismo plot

plot(P2, main="Random Walk", 
     xlab="t",ylab="Price", ylim=c(9.7,10.3),
     typ='l', col="blue")

res = McLeod.Li.test(y=P1)
res$p.values
