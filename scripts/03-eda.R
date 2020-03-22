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