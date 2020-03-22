library(tidyverse)
#vector atomico:locial,integer,double(numerico),character,complex,row
#lista:vectores recursivos y heterogeneos
#NA->ausencia de un valor dentro de un vector
#NUL-L> ausencia del vector,es como un vector de longitud 0
  typeof(letters)
  typeof(1:10)
length(letters)
x<-list("a","b",1:10)
length(x)
typeof(x)
#factor :vector aumentado sobre los enteros
#date y date-time:vectores aumentados sobre vectores numericos
#data frame y tibble:vector aumentado sobre listas
#vectores atomicos
#Logicos:True,False,NA
1:10%%3==0
c(TRUE,TRUE,FALSE,NA,FALSE)
#NUMERICO:numeros  double.
typeof(1)
typeof(1L)
x<-sqrt(2)^2
x-2
dplyr::near(x,2)
x<-c(c(-1,0,1)/0,NA,2)
is.finite(x)
is.infinite(x)
is.na(x)
is.nan(x)
#character
x<-"dabale arroz a la zorra el abad"
pryr::object_size(x)
y<-rep(x,10000)
pryr::object_size(y)
#pinter-> 8 bytes 
#complex
1+5i
(8*10000+152)/1000
152*10000/1000/1024
NA      #LOGICO
NA_character_ #CARACTER
NA_complex_  #COMPLEJO
NA_integer_  #ENTERO
NA_real_      #DOUBLE

#subsetting

x<-letters
x
x[c(3,2,6)]
x[c(1,1,7,7,3,3,3)]
x[c(-3,-5,-7)]
x[-c(6:15)]
x<-c(4,5,8,NA,2,1,3,NA)
x[!is.na(x)]
x[x%%2==0]
x<-c(abc=1,def=2,ghi=3)
x[c("def")]
x<-matrix(1:9,byrow=T, ncol = 3)
x
x[,1]
x[,-1]
x[-2,]
x<-list(1,2,3)
x
str(x)
x<-list(x=1,y=2,z=3)
str(x)
y<-list("x",1L,pi,TRUE)
str(y)
x<-list(list(1,2,3),list(pi,sqrt(2)))
str(x)
x1<-list(c(1,2),c(3,4))
x1
x2<-list(list(1,2),list(3,4))
x2
x3<-list(1,list(2,list(3)))
x3
x<-list(
  a=1:3,
  b="soy un string",
  c=pi,
  d=list(-2,-5)
)
x
x[1:2]
str(x[1:2])
x[4]
str(x[4])
x[c("a","c")]
x[[1]]
str(x[[1]])
x[["a"]]
x[[1]][[1]]
x<-1:12
attr(x,"desc")
attr(x,"desc")<-"vector de las horas del dia"
attr(x,"desc")
as.Date
methods("as.Date")
getS3method("as.Date","character")
getS3method("as.Date","numeric")
 methods("print")
 #augmented vectors
 #factor
 x<-factor(c("L","M","M","J"),
           levels = c("L","M","x","J","V","S","D"))
typeof(x) 
attributes(x)
unclass(x)
#date&date-time
x<-as.Date("1998-05-19")
typeof(x)
attributes(x)
unclass(x)
#POSIXct
x<-lubridate::ymd_hm("1998-05-19 16:30")
typeof(x)
attributes(x)
unclass(x)
attr(x,"tzone")<-"US/Pacific"
x
attr(x,"tzone")<-"US/Eastern"
x
#posoxlt
y<-as.POSIXlt(x)
typeof(y)
attributes(y)
attr(y,"names")
#Tible
tb<-tibble(x=1:5,y=6:10)
typeof(tb)
attributes(tb)
