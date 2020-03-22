#Prob 8 Propuesto Cap 3 Sheldon Ross

rm(list=ls())
K=1000
U=matrix(data = runif(2*K,0,1), nrow = K, ncol = 2, byrow = FALSE,
         dimnames = NULL)

U
n=1:length(U[,1])
n
U[,1]
U[,2]

int_aprox=(cumsum(exp(U[,1]+U[,2])^2))/n
plot(n,int_aprox,type="l",
     xlab=expression(N),ylab=expression(IntegralAprox),main="Preg_8_ProbPropuesto")
int_aprox[length(U[,1])]





rm(list=ls())
P=c(0.20,0.15,0.25,0.40)


X=function(P,n){
  # V.A. Discreta Finita
  # n: Numero de valores a simular
  P=cumsum(P)
  runif(1,0,1)
  X=rep(0,n)
  for (j in 1:n){
    U=runif(1,0,1)
    i=1
    while(P[i]<U){
      i=i+1
    }
    X[j]=i
  }
  return(X)
}
