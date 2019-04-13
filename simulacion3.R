rm(list =ls())
k=500
n=1:k
x<-cumsum(exp(runif(k,0,1)))/n

matplot(n,x,type ="p",col = "red",
        main=expression("convergencia de probabilidad"),
        xlab = expression("n"),
        ylab = expression(theta)
        )
        
runif(1,0,1)        
    

for(i in 1:10)
{print(i)}
cuadrado = 0
 while(cuadrado<=1000)
   {
    n<-n+1
     cuadrado<-n^2
     }
 cuadrado
1024
 n
 desv = function(x,n=length(x)-1){ sum((x-mean(x))^2)/n}
x<-1:10
desv(x)   
desv(c(-1,2,-5,6,9))


#3333333333333
curve(dnorm(x, mean = 100, sd = 20),
      xlim = c(20, 180))

legend("topright",
       c(paste("mu =", 100), paste("SD =", 20)),
       bty = "n")
# n es el número de valores a obtener.
# mu y SD son la media y la desviación estándar
# de la población.

rnorm(n, mu, SD)
muestra <- rnorm(10, 100, 20)
mean(muestra)
sd(muestra)
muestra2 <- rnorm(100, 100, 20)
hist(muestra2, freq = F)
lines(density(muestra2), lty = 2)

