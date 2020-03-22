library(tidyverse)
library(nycflights13)
nycflights13::flights
#tible es un data frame mejorado para tidyverse
##*int ->numeros 
##´*dbl->numeros reales 
##chr->vector de caracteres  o string
###*ddtm->date+time 
##* lgl->logical,contiene valores booleanos(T,F)
##*fct->factor,variables categoricas 
##  *date ->fecha(dia,mes y hora )
##*filter ->filtra los datos
##*
#*filter ->filtrar observaciones a partir de valores 
##*arrange->reordenar las filas 
##*select()->seleccionar variables por sus nombres
##*mutate()->crea nuevas varialbes con funciones existenten
##*sumarise()->colapsar varios valores para dar  un resumen de los mismos
#group_by()->opera la funcion a la que acompaña grupo a grupo
## 1 data frane
## 2 operaciones 
## 3 resultado en un nuevo data frame
## 4 
##FILTER 
jan1<-filter(flights,month==1,day==1)
may19<-filter(flights,month==5,day==19)

(dec25<-filter(flights,month==12,day==25))
#>,>=,<,<=,==,!=
filter(flights,month==5)

sqrt(2)^2==2
1/pi*pi
near(sqrt(2)^2,2)
filter(flights,month==5 | month==6)
may_junet<-filter(flights,month%in%c(5,6))
filter(flights,dep_delay>60)
filter(flights,!(arr_delay>60 | dep_delay>60))
filter(flights,arr_delay<=60,dep_delay<=60)
age.mery<-NA
is.na(age.mery)
df<-tibble(x=c(1,2,NA,4,5))
df
filter(df,x>2)
filter(df,is.na(x) | x>2)
head(flights,10)
tail(flights)
###arrange reodenar las filas 
sorted_date<-arrange(flights,year,month,day)
tail(sorted_date)




head(arrange(flights,desc(arr_delay)))
head(arrange(flights,desc(dep_delay)))
arrange(df,desc(x))
View(arrange(flights,carrier))
View(arrange(flights,distance))
#########3333
filter(flights,arr_delay>60)
filter(flights,dest=='SFO'  | dest=='OAK' )
##Encuentra todos los vuelos operados por United American (UA) o por American Airlines (AA)
filter(flights,carrier=='UA' | carrier=='AA')
#Encuentra todos los vuelos que salieron los meses de primavera (Abril, Mayo y Junio)

filter(flights,month==4 | month==5 |month==6)
##Encuentra todos los vuelos que llegaron más de una hora tarde pero salieron con menos de una hora de retraso.
filter(flights,arr_delay>60,dep_delay<60)
#Encuentra todos los vuelos que salieron con más de una hora de retraso pero consiguieron llegar con menos de 30 minutos de retraso (el avión aceleró en el aire)
filter(flights,dep_delay>60 ,arr_delay<30)



###¿Cuantos vuelos tienen un valor desconocido de dep_time?

filter(flights,is.na(dep_time))

##Encuentra todos los vuelos que salen entre medianoche y las 7 de la mañana (vuelos nocturnos).

filter(flights, hour >= 0, hour < 7)
NA^0
NA|TRUE
FALSE&NA




filter(flights, between(hour,0,6)) 




#select
arrange(flights,carrier)

View(flights[1:3,])


View(flights[1024:1068,])


select(flights[1024:1068,],dep_delay,arr_delay)
select(flights,year,month,day)
select(flights,dep_time:arr_delay)
select(flights,-(year:day))
select(flights,starts_with("dep"))
select(flights,ends_with("delay"))
select(flights,contains("s"))
select(flights,matches("(.)\\1"))
select(flights,num_range("x",1:5))
rename(flights,deptime=dep_time,año=year,mes=month,dia=day)
select(flights,deptime=dep_time)
select(flights,time_hour,distance,air_time,everything())
