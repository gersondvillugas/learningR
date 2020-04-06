library(tidyverse)
t<-tibble(
  a=rnorm(100),
  b=rnorm(100),
  c=rnorm(100),
  d=rnorm(100),
  e=rnorm(100),
  f=rnorm(100)
  
)
median(t$a)
median(t$b)
output<-vector("double",ncol(t)) # 1- ooutput
 

seq_along(t) # 1:ncol(t)
for (i in seq_along(t)) { # 2 - sequence
  output[[i]]<-median(t[[i]]) # 3 - body
}
output
y<-vector("double",0)
seq_along(y)
1:length(y)
# Bucle  for advanced

# modificacion

df<-tibble(
  a=rnorm(100),
  b=rnorm(100),
  c=rnorm(100),
  d=rnorm(100),
  e=rnorm(100),
  f=rnorm(100)
  
)
rescale_0_1 <- function(x){
  
  # Calcular rango de lo datos excluyendo NAs e Infinitos -------------------
  rng <- range(x, na.rm = TRUE, finite = TRUE)
  (x - rng[1])/(rng[2] - rng[1])
}
df$a<-rescale_0_1(df$a)
for (i in seq_along(df)) {
  df[[i]]<-rescale_0_1(df[[i]])
}
df
# patrones de buble
#por posicion
#for (i in seq_along(df))->x[[i]] 
# por elementos
#for ( x in df)->x
# por el nombre
#for( name in names(df))->df[[name]]
df
results<-vector("list",length(df))
results
names(results)<-names(df)
results
for (i in seq_along(df)) {
  name<-names(df)[[i]]
 value<-df[[i]]
 print(paste0(name, " - ",value))
}
 #desonociemiento de la longitud de output
for (i in seq_along(df)) {
  #body
  print(names(df)[[i]])
}
i<-1
while (i<=length(df)) {
  #body
  print(names(df)[[i]])
  
  i<-i+1
}

for (i in seq_along(t)) { # 2 - sequence
  output[[i]]<-mean(t[[i]]) # 3 - body
}

col_mean<-function(df){
output<-vector("double",length(df))
  seq_along(t) # 1:ncol(t)
for (i in seq_along(t)) { # 2 - sequence
  output[[i]]<-mean(t[[i]]) # 3 - body
}
 output  
}
col_mean(df)

col_summary<-function(df,fun){
  output<-vector("double",length(df))
  seq_along(t) # 1:ncol(t)
  for (i in seq_along(t)) { # 2 - sequence
    output[[i]]<-fun(t[[i]]) # 3 - body
  }
  output
}
col_summary(df,mean)
# paquete base de R
apply()
lapply()
sapply()
tapply()
#elemento de la lista ->(purr) ->todos los elementos de la lista
# resolver pequeños problemas que se un en conjunto con una pip %>%
