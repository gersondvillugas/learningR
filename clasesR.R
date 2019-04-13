library(tidyverse)
library(nycflights13)
library(forcats)
foo_foo<-litle_bunny()

hop()
scoop()
bop()
#variables intermedias
foo_foo1<-hop(foo_foo,through=forest)
foo_foo2<-scoop(foo_foo1,up=field_mice)
foo_foo3<-bop(foo_foo2,on=head())
dd<-ggplot2::diamonds
dd1<-dd%>%
   dplyr::mutate(price_per_carat=price/carat)
install.packages("pryr")
pryr::object_size(dd)
pryr::object_size(dd1)
pryr::object_size(dd,dd1)
dd$carat[1]<-NA
pryr::object_size(dd)
pryr::object_size(dd1)
pryr::object_size(dd,dd1)
#sobreescribir la variable original
foo_foo<-hop(foo_foo,tho=forest)
foo_foo<-scoop(foo_foo,up=field_mice)
foo_foo<-bop(foo_foo,on=head)
bop(scoop(hop(foo_foo,tho=forest),up=field_mice),on=head)
#usar una pipe 
foo_foo%>%
  hap(throug=forest)%>%
  scoop(up=fied_mice)%>%
  bap(on=head)
assign("x",3)
"X"%>%assign(6)
env<-environment()
"x"%>%assign(6,envir=env)
x
tryCatch(stop("¡"),error=function(e)"me he encontroado un error")
rnorm(1000)%>%
  matrix(ncol=2)%T>%
  plot()%>%
  str()
mtcars %$%
  cor(disp,mpg)
mtcars %<>%
  filter(cyl==6)
nycflights13::flights
summarise(flights,delay=mean(dep_delay,na.rm = T))
by_month_group<-group_by(flights,year,month)
summarise(by_month_group,delay=mean(dep_delay,na.rm = T))
by_day_group<-group_by(flights,year,month,day)
summarise(by_day_group,delay=mean(dep_delay,na.rm=T)
          ,median=median(dep_delay,na.rm = T)
          , min=min(dep_delay,na.rm = T)
          )
min_rank(summarise(group_by(flights,carrier),delay=mean(dep_delay,na.rm = T)))
transmute(summarise(group_by(flights,carrier)
                    ,
                    delay=mean(dep_delay,na.rm = T))
             ,sorted=min_rank(delay)
          )
mutate(summarise(group_by(flights,carrier)
                    ,
                    delay=mean(dep_delay,na.rm = T))
          ,sorted=min_rank(delay)
)
