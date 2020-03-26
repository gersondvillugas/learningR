library(tidyverse)
iris
class(iris)
iris_tibble<-as.tibble(iris)
t<-tibble(
  x=1:10,
  y=pi,
  z=y*x^2
  
)
t$z
t[2,3]
t2<-tibble(
  `:)`="smiling",
  ` ` ="space",
  `1992`="number"
)
t2
tribble(
  ~x,~y,~z,
#----|--|---|
  "a",4,3.14,
  "b",6,6.38,
  "C",9,-1.25
)
tibble(
  a=lubridate::now()+runif(1e3)*24*60*60,
  b=1:1e3,
  c=lubridate::today()+
    runif(1e3)*30
  ,d=runif(1e3),
  e=sample(letters,1e3,replace = T)
  
)
nycflights13::flights %>%
  print(n=12,width=Inf)


options(tibble.prin_max=12,tibble.print_min=20)
options(dply.print_min=Inf)
options(tibble.width=Inf)
#[['nombre_variable]]
#[[posicion_varialbe]]
#$nombre_Variable
df<-tibble(
  x=rnorm(10),
  y=runif(10)

  
)
df$x
df$y
df%>% .$x

df[["x"]]
df%>% .[["x"]]
df[["y"]]

df[[1]]
df%>% .[[1]]
df[[2]]
df
as.data.frame(df)
#[[]]
dplyr::filter()
dplyr::select()
#[[]] sobre un data.frame , puede devolver un data frame o un vector
#[[]] sobre una tibble ,siempre devuelve un data frame
