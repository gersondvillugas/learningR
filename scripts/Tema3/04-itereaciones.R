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
# purr ¡-------------------------------------------------------------------------
map() #crea una lista
map_lgl() # crea un vector logico
map_int() #crea un vector de enteros
map_dbl()#crea un vector de double
map_chr() #crea un vector de caracteres
map_dbl(df,mean)
map_dbl(df,median)
map_dbl(df,sd)
df%>%
   map_dbl(median)
df%>%
  map_dbl(mean)
df%>%
  map_dbl(sd)
df %>% map_dbl(mean,trim=0.5)
z<-list(x=1:5,y=6:10)
map_int(z,length)
mtcars
models<-mtcars %>%
  split(.$cyl)%>%
  map(function(df) lm(mpg~wt,data=df))


models<-mtcars %>%
  split(.$cyl)%>%
  map(~lm(mpg~wt,data= .))
models %>%
  map(summary) %>%
  map_dbl("r.squared")
x<-list(list(1,2,3),list(4,5,6),list(7,8,9))
x%>%map_dbl(2)
#map() <-> lapply()
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
#sirve para un umbral para quedarnos con valores mayores
threshold<- function(x,cutoff=0.75)x[x>cutoff] 
x1%>%sapply(threshold)%>%str()
vapply(df,is.numeric,logical(1))
map_lgl(df,is.numeric)
safe_log<-safely(log)
str(safe_log(12))
str(safe_log("antonio"))
x<-list(1,10,"z",-8)
x%>%map(safe_log)%>%
  str()
x <- list(1, 10, "z", -8)
x %>% map(safe_log) %>% transpose() %>% str()
x %>% map(safe_log) %>% transpose() -> y
y$error %>% map_lgl(is_null) -> is_ok
x[!is_ok]
y$result[is_ok] %>%flatten_dbl()

x %>%map_dbl(possibly(log, NA_real_))

list(5,-5) %>% map(quietly(log)) %>% str()
# Multiple mappings -------------------------------------------------------

mu <- list(2, 17, -5)

mu %>%
  map(rnorm, n = 10) %>%
  str()

sigma <- list(1, 5, 25)

seq_along(mu) %>% # . valdrá 1, 2 y 3 respectivamente
  map(~rnorm(10, mu[[.]], sigma[[.]])) %>%
  str()

map2(mu, sigma, rnorm, n = 10) %>% str()

map2 <- function(x, y, f, ...){
  out <- vector("list", length(x))
  for(i in seq_along(x)){
    out[[i]] <- f(x[[i]], y[[i]], ...)
  }
}


n <- list(10, 15, 22)

args <- list(n, mu, sigma)

args %>%
  pmap(rnorm) %>% 
  str()

?rnorm

args_ok <- list(mean = mu, sd = sigma, n = n) 

args_ok %>% pmap(rnorm) %>% str()

param <- tribble(
  ~mean, ~sd, ~n,
  2,     1,   10,
  17,    5,   15,
  -5,    25,  22
)

param %>% pmap(rnorm)


f <- c("runif", "rnorm", "rpois")
param <- list(
  list(min = -5, max = 5),
  list(sd = 3),
  list(lambda = 12)
)

invoke_map(f, param, n = 15) %>% str()

matchs <- tribble(
  ~f,      ~params,
  "runif", list(min = -5, max = 5),
  "rnorm", list(sd = 5), 
  "rpois", list(lambda = 12)
)
matchs %>% mutate(sim = invoke_map(f, params, n = 15)) %>% View()


x <- list("hola", 123, -pi)
x %>% walk(print)

plots <- mtcars %>%
  split(.$cyl) %>%
  map(~ggplot(., aes(mpg, wt)) + geom_point())
paths <- str_c(names(plots), ".pdf") 

pwalk(list(paths, plots), ggsave, path = "data/")

iris %>%
  keep(is.factor) %>%
  str()

iris %>%
  discard(is.factor) %>%
  str()

x <- list(1:5, letters, list(16))
x %>% some(is_character)
x %>% every(is_vector)

x <- sample(12)
x %>% detect(~.<7)
x %>% detect_index(~.<7)

x %>% head_while(~.>7)
x %>% tail_while(~.<7)

dfs <- list(
  age = tibble(name = "Juan Gabriel", age = 30),
  sex = tibble(name = c("Juan Gabriel", "María"), sex = c("M", "F")),
  trt = tibble(name = "María", treatment = "Mrs")
) 

dfs %>% reduce(full_join)

vs <- list(
  1:5,
  c(1,3,5,6,8,10),
  c(1,2,3,7,8,10),
  c(1,2,4,6,9,10)
)