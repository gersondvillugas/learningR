library(tidyverse)
library(lubridate)
library(nycflights13)
today()
now()
ymd("2015-06-13")
mdy("January 30th,2018")
dmy("8-Jun-2018")
ymd(20180608)
ymd_hms("2018-06-08  19:35:28")
mdy_hm("06/30/2017  05:30",tz = "GMT")
flights%>%
  select(year,month,day,hour,minute)%>%
  mutate(departure=make_datetime(year,month,hour,minute))
make_date_time_100<-function(year,month,day,time){
  
  make_datetime(year,month,day,time%/%100,time%%100)
}
flights_dt<-flights%>%
  filter(!is.na(dep_time),!is.na(arr_time))%>%
  mutate(
    dep_time=make_date_time_100(year,month,day,dep_time),
    arr_time=make_date_time_100(year,month,day,arr_time),
    sched_dep_time=make_date_time_100(year,month,day,sched_dep_time),
    sched_arr_time=make_date_time_100(year,month,day,sched_arr_time)
    
  )%>%
  select(origin,dest,ends_with("delay"),ends_with("time"))
flights_dt%>%View()
flights_dt%>%
  ggplot(aes(dep_time))+
  geom_freqpoly(binwidth=24*60*60)
flights_dt%>%
  filter(dep_time<ymd(20130102))%>%
  ggplot(aes(dep_time))+
  geom_freqpoly(binwidth=600)#600 s=10m
as_datetime(60*60*2018)
as_date(365*12+35)#cada unidad representa un dia
nowww<-now()
nowww
year(nowww)
month(nowww,label = TRUE,abbr = FALSE)
mday(nowww)
yday(nowww)
wday(nowww,label = TRUE)
hour(nowww)
minute(nowww)
second(nowww)
flights_dt%>%
  mutate(wday=wday(dep_time,label=TRUE,abbr=FALSE))%>%
  ggplot(aes(x=wday))+
  geom_bar()
flights_dt%>%
  mutate(minute=minute(dep_time))%>%
   group_by(minute)%>%
  summarise(
    avg_delay=mean(arr_delay,na.rm=TRUE),
    n=n()
    
  )%>%
  ggplot(aes(minute,avg_delay))+
  geom_line()
  
flights_dt%>%
  mutate(minute=minute(sched_dep_time))%>%
  group_by(minute)%>%
  summarise(
    avg_delay=mean(arr_delay,na.rm=TRUE),
    n=n()
    
  )%>%
  ggplot(aes(minute,n))+
  geom_line()
#floor_Date()
#round_Date()
#ceiling_Date()
flights_dt%>%
  count(week=floor_date(dep_time,"week"))%>%
  ggplot(aes(week,n))+
  geom_line()
d<-now()
d
year(d)<-2030
d
month(d)<-09
d
hour(d)<-hour(d)+3
d
update(d,year=2020,month=10,mday=7,hour=4)
dmy("01-02-2018")%>%
  update(mday=30)
dmy("01-02-2018")%>%
  update(hour=54321)
flights_dt%>%
  mutate(dep_hour=update(dep_time,yday=1))%>%
  ggplot(aes(dep_hour))+
  geom_freqpoly(binwidth=300)
jb_age<-today()-ymd(19920824)
as.duration(jb_age)
dseconds(3250)
dminutes(1024)
dhours(c(12,24))
ddays(5:10)
dweeks(4)
dyears(1)
2*dyears(1)
dyears(1) + dweeks(13)+dhours(22)
tomorrow<-today()+ddays(1)
tomorrow
last_year<-today()-dyears(1)
last_year
one_pm<-ymd_hms("2016-03-12 13:00:00",tz="America/New_york")
one_pm
one_pm+ddays(1)
one_pm+days(1)
seconds(35)
minutes(15)
hours(c(12,24))
days(7)
weeks(4)
months(1:6)
10*month(6)+days(8)
days(20)+hours(32)+minutes(45)
ymd("2016-05-19")+years(2)
flights_dt%>%
  filter(arr_time<dep_time)
flights_dt%>%
  mutate(
    overnight=arr_time<dep_time,
    arr_time=arr_time+days(overnight*1),
    sched_arr_time=sched_arr_time+days(overnight*1)
    
  )->flights_dt
flights_dt%>%
  filter(overnight,arr_time<dep_time)
dyears(1)/ddays(365)
years(1)/days(1)
next_year<-today()+years(1)
(today()%--% next_year )%/%days(1)
#Time zones 
#IANA-><continente>/<city>
#Europe/Madrid,Europe /Paris,America/New_york
Sys.timezone()
length(OlsonNames())
  head(OlsonNames())
(X1<-ymd_hms("2018-06-08 12:00:00",tz="America/New_York"))
(X2<-ymd_hms("2018-06-08 18:00:00",tz="Europe/Copenhagen"))
c(x1,x2)  
