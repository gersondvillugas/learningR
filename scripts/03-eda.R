##Variacion
##Variables categoricas:factor o vector de caracteres
library(tidyverse)
ggplot(data=diamonds)+
  geom_bar(mapping=aes(x=cut))
diamonds%>% 
   count(cut)
#Variable continua:conjunto infinito de valores ordenados(numeros,fechas)
ggplot(data=)+
  geom_histogram(mapping = aes(x=carat),binwidth = 0.5)

diamonds%>% 
  count(cut_width(carat,0.5))
diamonds_filter<-diamonds %>%
   filter(carat<3)
ggplot(data=diamonds_filter)+
  geom_histogram(mapping=aes(x=carat),binwidth=0.005)
ggplot(data=diamonds_filter,mapping = aes(x=carat,color=cut))+
  geom_freqpoly(bindwidth=0.1)
#outliers
ggplot(diamonds)+
  geom_histogram(mapping = aes(x=y),bindwidth=0.5)+
  coord_cartesian(ylim = c(0,100))
unusual_diamonds<-diamonds%>%
  filter(y<2 | y>30) %>%
  select(price,x,y,z)%>%
  arrange(y)
View(unusual_diamonds)
#elimina toda la fila de valores atipicos
good_diamonds<-diamonds%>%
  filter(between(y,2.5,29.5))
#remplaza los varlores atipicos por NAs
good_diamonds<-diamonds%>%
  mutate(y=ifelse(y<2 | y>30,NA,y))
ggplot(data=good_diamonds,mapping = aes(x=x,y=y))+
  geom_point(na.rm = T)
#  parte proporcional de la hora en cuestion binwidth=1/4
view(nycflights13::flights)
nycflights13::flights%>%
  mutate(
    cancelled =is.na(dep_time),
    sched_hour=sched_dep_time%/%100,
    sched_min=sched_dep_time %%100,
    sched_dep_time=sched_hour+sched_min/60
  )%>%
  ggplot(mapping = aes(sched_dep_time))+
  geom_freqpoly(mapping = aes(color=cancelled)
                
                ,binwidth=1/4)
#COVARACION
#muestra la relacion entre dos mas variables
#Categoria vs Continua
ggplot(data=diamonds,mapping = aes(x=price))+
  geom_freqpoly(mapping = aes(color=cut,binwidth=500))


ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut))

# si calculamos la ares debajo de la curva 
ggplot(data=diamonds,mapping = aes(x=price,y=..density..))+
  geom_freqpoly(mapping = aes(color=cut,binwidth=500))
ggplot(data = diamonds,mapping = aes(x=cut,y=price))+
  geom_boxplot()

ggplot(data = mpg,mapping = aes(x=class,y=hwy))+
  geom_boxplot()
ggplot(data = mpg)+
  geom_boxplot(mapping = aes(x=reorder(class,hwy,FUN=median),y=hwy))

ggplot(data = mpg)+
  geom_boxplot(mapping = aes(x=reorder(class,hwy,FUN=median),y=hwy))+
  coord_flip()
#categoria vs categoria
ggplot(data=diamonds)+
  geom_count(mapping = aes(x=cut,y=color))
diamonds%>%
  count(color,cut)
#mientras mas claro es mas caen hay las observaciones
diamonds%>%
  count(color,cut) %>%
  ggplot(mapping = aes(x=cut,y=color))+
  geom_tile(mapping = aes(fill=n))
#d3heatmp
#heatmaply
#continua vs continua

ggplot(data = diamonds)+
  geom_point(mapping = aes(x=carat,y=price),alpha=0.01)
ggplot(data = diamonds)+
  geom_point(mapping = aes(x=carat,y=price),alpha=0.01)
install.packages("hexbin")
library(hexbin)
ggplot(data = diamonds)+
  geom_bin2d(mapping = aes(x=carat,y=price))
ggplot(data = diamonds)+
  geom_hex(mapping = aes(x=carat,y=price))
diamonds%>%
  filter(carat<3)%>%
  ggplot(,mapping = aes(x=carat,y=price))+
  geom_boxplot(mapping = aes(group=cut_width(carat,20)))
#Relaciones y los patrones
# * ¿ Coincidencias?
# * Relaciones queimplica el patron?
# * ¿Fuerza de la relacion?
# * ¿otras variables afectadas?
# * ¿Subgrupos ?
ggplot(data=faithful)+
  geom_point(mapping = aes(x=eruptions,y=waiting))

library(modelr)                              
mod=lm(log(price)~log(carat),data = diamonds)
mod
diamonds_pred<-diamonds%>% 
  add_residuals(mod)%>%
  mutate(res=exp(resid))
ggplot(data=diamonds_pred)+
  geom_point(mapping = aes(x=carat,y=resid))
ggplot(data=diamonds_pred)+
  geom_boxplot(mapping = aes(x=cut,y=resid))
faithful%>%
  filter(eruptions>3)%>%
  ggplot()+
  geom_freqpoly(mapping = aes(x=eruptions),binwidth=0.2)

diamonds%>%
  count(cut,clarity)%>%
  ggplot(aes(clarity,cut,fill=n))+
  geom_tile()
