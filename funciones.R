library(tidyverse)

#nombre a la funcion
#cambiar en unico lugar
#eliminais probabilidad de error edel c&p
df<-tibble::tibble(
  a=rnorm(20),
  b=rnorm(20),
  c=rnorm(20),
  d=rnorm(20),
  e=rnorm(20)
)
df%>%View()
x<-df$a
#calcylar rango de los datos excluyendo Nas e Infinitos
rng<-range(x,na.rm = TRUE)
(x-rng[1])/(rng[2]-rng[1])
rescale_0_1<-function(x){
  rng<-range(x,na.rm = TRUE,finite=TRUE)
  (x-rng[1])/(rng[2]-rng[1])
}
rescale_0_1(c(0,5,10))
rescale_0_1(c(-1,0,1))
help('$')
df$a<-rescale_0_1(df$a)
df$b<-rescale_0_1(df$b)
df$c<-rescale_0_1(df$c)
df$d<-rescale_0_1(df$d)
df$e<-rescale_0_1(df$e)
x<-c(1:10,Inf)
rescale_0_1(x)
help('range')
selec_input()
checkbox_input()
text_input
stringr::str_view()
#C<-5
#mean<-function(x)median(x)

#Condicionales
if(condicion){
  #codigo a ejecutar si la condicion es verdadera
}else{
  #codigo a ejecutar si la condicion es falsa
  
}
has_name<-function(x){
  nms<-names(x)
  if(is.null(nms)){
    #no tiene nombre asignado
    rep(FALSE,length(x))
    
  }else{
    #ausencia de Nas Y
    !is.na(nms) & nms !=""
  }
}
has_name(c(1,2,3))
has_name(mtcars)
if(c(T,F)){}
if(NA){}
#c1 && c2 -> 
# c1 || c1 -> OR
if(any(c(T,F))){
  "TENEMOS AL MENOS UN VERDADERO"
}else{
  "no hay ningun verdadero"
}
if(all(c(T,F))){
  "tenemos todas las condiciones verdaderes"
}else{
  "tenemos alguna condicion falsa"
  
}
identical(0,0L)
dplyr::near(2,sqrt(2)^2)
if(condicion){
  
}else if(condicion2){
  
}else if(condicion3){
  
}else{
  
}

calculate<-function(x,y,op){
  switch(op,
         suma =x+y,
         resta=x-y,
         multiplicacion=x*y,
         division=x/y,
         stop("error no se puede ejecutar la ejecucion ")
         )
}
calculate(2,3,"suma")
calculate(2,3,"division")
calculate(2,3,"antonio")
x<-5
y<-7
if(y<=0){
  log(x)
}else {
  y^x
}



log(x=8,base = 2)
mean(x=c(1,2,3,4,5,10),trim =2,na.rm = T)
t.test(rnorm(100,mean = 0,sd=1),rnorm(100,mean = 1,sd=1),alternative="graiter",paired=T)
stringr::str_c(c("banana","Manzana","pera"),collapse = ",")
standar_ci<-function(x,conf=0.95){
  se<-sd(x)/sqrt(length(x))
  alpha<-1-conf
  mean(x)+se*qnorm(c(alpha/2,1-alpha/2))
}
x<-runif(1000)
standar_ci(x)
standar_ci(x,conf = 0.99)
mean(1:10,na.rm = TRUE)

mean(1:10,n=T)
avg<-mean(120/12+32,na.rm = T)
#x,y,z :vectores
#w:vector de pesos
#df:data,d:data
#i,j,k:subindices
#n:longitud de un vector
#m:numero de columnas 
#p:probabilidades
wt_mean<-function(x,w,na.rm=TRUE){
  stopifnot(is.logical(na.rm),
      length(na.rm)==1,length(x)==length(w))

 
  if(na.rm){
    missing<-is.na(x) | is.na(w)
    x<-x[!missing]
    w<-w[!missing]
  }
  sum(x*w)/sum(w)
}

wt_var<-function(x,w){
  mu<-wt_mean(x,w)
  sum(w*(x-mu)^2)/sum(w)
}
wt_sd<-function(x,w){
  sqrt(wt_var(x,w))
}
wt_mean(1:6,1:3)
wt_mean(1:6,6:1,na.rm = T)
#...
sum(1:10)
str_c(c("a","b","c","d","e"))
commas<-function(...)stringr::str_c(...,collapse = ",")
commas(letters[1:10])
rule<-function(...,pad="="){
  title<-paste0(...)
  width<-getOption("width")-nchar(title)-5
  cat(title,"",stringr::str_dup(pad,width),"\n",sep ="")
}
rule("Seccion numero 1")
sum(c(1,2),na.rm = T)
my_function<-function(x,y,z){
  if(length(x)==0 || length(y)==0){
    return(0)
  }
  ##el codigo mas adelante con otras funciones ..
}
my_function<-function(x){
  if(!x){
    return(0)
  }
  #aqui
  #va
  #un codigo mylargo
  
}
#transformacion_el objeto de entrada es modificiado antes de ser devuelto
#efecto secundario:
show_nas<-function(df){
  n<-sum(is.na(df))
  cat("Numero de Nas:",n,"\n",sep="")
  invisible(df)
}
x<-show_nas(diamonds)
class(x)
dim(x)
mtcars%>%
  show_nas()%>%
  mutate(mpg=ifelse(mpg>20,NA,mpg))%>%
  show_nas()
f<-function(x){
  x+y
}

y<-5
f(3)
y<-30
f(3)
'+'<-function(x,y){
  if(runif(1)<0.1){
    sum(x,y)
    
  }
  else{
    sum(x,y)*1.5
  }
}
table(replicate(1000,2+3))
rm('+')
col_medians<-function(df){
  output<-vector("double",length(df))
  for(i in seq_along(df)){
    output[[i]]<-median(df[[i]])
  }
  output
}
col_medians(df)


col_means<-function(df){
  output<-vector("double",length(df))
  for(i in seq_along(df)){
    output[[i]]<-mean(df[[i]])
  }
  output
}


col_sd<-function(df){
  output<-vector("double",length(df))
  for(i in seq_along(df)){
    output[[i]]<-mean(df[[i]])
  }
  output
}
f1<-function(df) abs(df-mean(df))^1
f2<-function(df) abs(df-mean(df))^2
f3<-function(df) abs(df-mean(df))^3

f1<-function(df,i=1) abs(df-mean(df))


col_summary<-function(df,fun){
  output<-vector("double",length(df))
  for(i in seq_along(df)){
    output[[i]]<-fun(df[[i]])
  }
  output
}
col_summary(df,mean)
col_summary(df,sd)
col_summary(df,min)
#paquet base de R
apply()
lapply()
sapply()
tapply()
#elemento->(purr)->todos los elementos de la lista
#resolver pequeños problemas que se unan en conjunto con un pipe %>%
map() #crea una lista
map_lgl()#crea un vector logico
map_int()#crea un vec enteros
map_dbl()#crea un vector de double
map_chr()#crea un vector de caracteres
map_dbl(df,mean)
map_dbl(df,median)
map_dbl(df,sd)
df%>%map_dbl(mean)
df%>%map_dbl(sd)
df%>%map_dbl(mean,trim=0.5)
z<-list(x=1:5,y=6:10)
map_int(z,length)
mtcars
models<-mtcars%>%
  split(.$cyl)%>%
  map(~lm(mpg~wt,data=.))
models%>%
  map(summary)%>%
  map_dbl(~.$r.squared)
models%>%
  map(summary)%>%
  map_dbl("r.squared")
x<-list(list(1,2,3),list(4,5,6),list(7,8,9))
x%>%map_dbl(2)
#map()<->lapply()
#sapply()
x1<-list(
  runif(5),
  runif(5),
  runif(5)
  
  
)
x2<-list(
  runif(5)/2,
  runif(5)/2,
  runif(5)
  
  
)
x1

x2
x3<-list(
  
  0.8,
  0.9,
  0.85
)
x3
threshold<-function(x,cutoff=0.75) x[x>cutoff]
x1%>%sapply(threshold)%>%str()
x2%>%sapply(threshold)%>%str()
x3%>%sapply(threshold)%>%str()
vapply(df,is.numeric,logical(1))
map_lgl(df,is.numeric)
  safe_log<-safely(log)

str(safe_log(12))
str(safe_log("antonio"))
x<-list(1,10,"z",-8)
x%>%map(safe_log)%>%str()
