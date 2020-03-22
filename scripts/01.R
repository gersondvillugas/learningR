#Data visulization-11 de mayo de 2018
library(tidyverse)
library(nycflights13)
library(lubridate)
library(nycflights13)
ggplot2::ggplot()
#Los coches con motor mas grande consumen mas combustible
#que los coches con motor mas puequeño.
#la relacion consumo /tamaño es lineal?es positiva?es no lineal 
#es postivia ?es negativa?

ggplot2::mpg


View(mpg)
help(mpg)
?mpg
#displ:tamaño del motor del coche en litros
#hwy:numero de millas recorridas en autopista por galon de conbustible(3.780)

ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))
 #ggplot(data=<DATA_FRAME>)+
 #<GEOM_FUNCTION> (mapping=aes(<MAPPINGS>))
#color de los puntos
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,color=class))
#tamañi de los puntos (conviene que sea numerico)
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,size=class))
#transparencia de los puntos
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,alpha=class))
#forma de los puntos(solo permite 6 formas a la vez)
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,shape=class))
#eleccion manual de esteticas 
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy),color="red")
#podemos color=nombre de color en formato string
#size=tamaño del punto en mm
#shape =Forma del punto con numeros del 0 a 24

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,size=class))







ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy),
             shape=23,size=10,color="red",fill="yellow")

##FACETS
##facet_wrap(<FORMULA_VARIABLE>):Debe ser discreta
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))+
  facet_wrap(~class,nrow=2)
#face_grid<formula-varialbe1><formual variable2>
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))+
  facet_grid(drv~cyl)
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))+
  facet_grid(.~cyl)
#diferentes geometrias
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))
ggplot(data=mpg)+
  geom_smooth(mapping = aes(x=displ,y=hwy))

ggplot(data=mpg)+
  geom_smooth(mapping = aes(x=displ,y=hwy,linetype=drv))


ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,color=drv))+

  geom_smooth(mapping = aes(x=displ,y=hwy,linetype=drv,color=drv))

ggplot(data=mpg)+
  geom_smooth(mapping = aes(x=displ,y=hwy,group=drv,color=drv),
              show.legend = T)

ggplot(data=mpg,mapping = aes(x=displ,y=hwy))+
  geom_point(mapping = aes(shape=class))+
  geom_smooth(mapping = aes(color=drv))
ggplot(data=mpg,mapping = aes(x=displ,y=hwy))+
  geom_point(mapping = aes(color=class))+
  geom_smooth(data=filter(mpg,class=="suv"))

##FACETS
##facet_wrap(~<FORMULA_VARIABLE>):la variable debe ser discreta
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))+
  facet_wrap(~class,nrow = 3)
##facet_grid(<FORMULA_VARIABLE1>)
ggplot(data = mpg)+
  geom_smooth(mapping = aes(x=displ,y=hwy,color=drv,group=drv),
              show.legend = T)
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))+
  geom_smooth(mapping = aes(x=displ,y=hwy))
##Ejemplo del dataset de diamantes
View(diamonds)

ggplot(data = diamonds)+
    geom_bar(mapping = aes(x=cut))
  ggplot(data=diamonds)+
 stat_count(mapping = aes(x=cut))
  
demo_diamonds<-tribble(
   ~cut,  ~freqs,
  "Fair", 1610,
  "Good", 4906,
  "Very Good", 12082,
  "Premium", 13791,
  "Ideal",  21551
  
)
View(demo_diamonds)
ggplot(data = demo_diamonds)+
  geom_bar(mapping = aes(x=cut,y=freqs),stat = "identity")

ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut,y=..prop..,group=1))


ggplot(data = diamonds)+
  stat_summary(
    mapping=aes(x=cut,y=price),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
   
    )

ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut,colour=cut))
ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut,fill=cut))
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut,fill=clarity))
##position="identity"
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut,colour=clarity),position = "identity",alpha=0.2)
##position=fill
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut,fill=clarity),position = "fill")
##position="dodge"
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut,fill=clarity),position = "dodge")
##volvemos al scatterplot
##position="jitter"
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy),position ="jitter" )
#sistemas de coordenadas de ggplot
#coord_flip( )->cambia los papeles x e y
ggplot(data = mpg,mapping = aes(x=class,y=hwy))+
  geom_boxplot()
  coord_flip()
###coord_quickmap()->configrua el aspect ratio para mapas
  usa<-map_data("italy")
  install.packages("maps")
  ?map_data
  ggplot(usa,aes(long,lat,group=group))+
    geom_polygon(fill="blue",color="white")+
    coord_quickmap()
  #coord_polar()
  ggplot(data = diamonds)+
    geom_bar(
      mapping = aes(x=cut,fill=cut),
      show.legend = F,
      with=1
      
      
    )+
    theme(aspect.ratio = 1)+
    labs(x=NULL)+
    coord_polar()
#gramatica por capas de ggplot2
  #<GEOM_FUNCTION>(
  #  mapping=aes(<MAPPINGS>),
  #   stat=<STAT>
  #   position=<POSITITION>
  #   <COORDINATE_FUNCTION>()+)
  #  <FACE_FUNCTION
  #>
  #
  #
  #
    
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=clarity,fill=clarity,y=..count..))+
coord_polar()+
  facet_wrap(~cut)+
labs(x=NULL,y=NULL,title="ejemplo final de ggplot con jb",caption="dos variables cruzadas de diamonds",
     subtitle="aprender ggplot ´puede ser divetido"

     )

nycflights13::flights
##tible es un data frame mejorado para tidyverse 
##*int ->numeros enteros
## *dbl-> numeros reales (double)
## *chr->vector de caracteres
##*dttm ->date +time 
##* *lgl->logical contiene valores boleanos
##*fctr->factor,variables categoricas
##*date ->fecha(dia,mes y año)
##*filter ->filtrar observaciones a partir de valores 
##*arrange->reordenar las filas 
##*select()->seleccionar variables por sus nombres
##*mutate()->crea nuevas varialbes con funciones existenten
##*sumarise()->colapsar varios valores para dar  un resumen de los mismos
#group_by()->opera la funcion a la que acompaña grupo a grupo
## 1 data frane
## 2 operaciones 
## 3 resultado en un nuevo data frame
## 4 
