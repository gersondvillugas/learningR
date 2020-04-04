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