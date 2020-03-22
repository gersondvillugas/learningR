#1
rm(list=ls())
N=5000
y=runif(N,0,1);n=1:length(y)
int_aprox_1=(cumsum(4*exp((4*y-2)*(4*y-2+1))))/n
plot(n,int_aprox_1,type="l",
     xlab=expression(N),ylab=expression(IntegralAprox),main="Pregunta_1")
int_aprox_1[length(y)]
#2 

zz=table(N)/length(n)
plot(zz,main = "Calculo de P[i]")
barplot()
zz[1:7]
