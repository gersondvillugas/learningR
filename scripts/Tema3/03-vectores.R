library(tidyverse)
#vector atomico:logico,integer,double(numeric),character,complex
#listas:vectores recursivos y heterogeneos
#NA ->ausencia de una valor dentro de un vector
#NULL -> ausiencia del vector,es como un vector de longitud 0
typeof(letters)
typeof(1:10)
length(letters)
x<-list("a","b",1:10)
typeof(x)
#vectores aumentados
#factor :es un vector aumentado sobre los enteros
#data y datetime :vectores aumentos sobre vectores nuemericos
#data frame y tibble :Vector aumentado sobre listas
#vectores atomicos -----------------------------------------------
#Logicos :TRUE,FALSE,NA
1:10 %%3==0
c(TRUE,TRUE,FALSE,NA,FALSE)
#NUMERICO
typeof(1)
typeof(1L)
typeof(1.5L)
x<-sqrt(2)^2
x-2
dplyr::near(x,2)
x<-c(c(-1,0,1)/0,NA,2)

is.finite 
is.infinite(x)
is.na(x)
#   character 
x<-"dabale arroz a la zorra abad"
pryr::object_size(x)
y<-rep(x,10000)
pryr::object_size(y)
#complex 
1+5i
#casting  -------------------------
as.logical(c(1,1,0))
as.integer(c(T,F,T))
as.double(c(1,2,3))
as.character(c(1,2,3))
x<-sample(20,size = 100,replace = TRUE)
x
y<-x>10
y
sum(y) #cuantos elementos >10 hay en el array

mean(y) #que proprocion de elemenots son >10
if (length(x)) { # 0 ->F otra cosa T //length(x)>0
  #hacer algo con el vector
}
typeof(c(TRUE,1L))
typeof(c(1.6,"a"))

is_logical(c(T,T,T))            #lgl
is_integer(c(1L,2L,3L,4L))      #int
is_double(c(1,2,3,4))           #dbl
is_numeric(c(1,2,3,4L))         #int, dbl
is_character(c("a","b", "c"))   #chr
is_atomic(c(T,T, 1,2L, "a"))    #lgl, int, dbl, chr

is_list(list(1,2,3))            #list

is_vector(c(T,T))               #lgl, int, dbl, chr, list

is_scalar_integer(c(4L))
#Recycling rule ----------------------------
sample(10)+12
rep(12,10)
runif(10)>0.5
1:10+1:2
1:10+1:3
tibble(
  x=1:4,
  y=rep(1:2,each=2)
  
)
c(x=4,y=2,z=-1)
set_names(1:3,c("x","y","z"))
x<-letters
x
x[c(3,2,6)]
x[c(1,1,2,2)]
x[c(-3,-1)]
x[-c(6:15)]
x<-c(4,5,NA,2,1,1)
x[!is.na(x)]
x[x%%2==0]
x<-c(abc=1,def=2,ghi=3)
x[c("def","abc")]
x["abc"]
x[["abc"]]
x<-matrix(1:9,byrow = T,ncol=3)
x
x[1,]
x[,1]
x[-2,]
x[,-1]
# Lists -----------------------------
x<-list(1,2,3)
x
str(x)
x<-list(x=1,y=2,z=3)
str(x)
x<-list("x",1,pi,TRUE)
str(x)
x<-list(list(1,2,3),list(pi,2*pi))
x
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
  d=list(-2,5)
  
)
x[1:2]
str(x[1:2])
x[4]
x[c("a","b")]
x[[1]]
str(x[[1]])
x$a
x[[1]][1]
x<-1:12
attr(x,"desc")
attr(x,"desc")<-"vector de las horas del dia"
attr(x,"created")<-"juan gabriel gomilla"
attr(x,"created")
attributes(x)
as.Date
x<-factor(c("L","M","J","S","D"),
          levels = c("L","M","X","J","V","S","D")
          )
x
#date  & date-time
x<-as.Date("1988-05-19")
typeof(x)
attributes(x)
unclass(x)
#POSOXct
x<-lubridate::ymd_hm("1998-05-19 16:30")
x
typeof(x)
unclass(x)
