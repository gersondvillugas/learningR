library(RCurl)
library(request)
library(httr)
library(jsonlite)
library(tidyverse)
request<-GET("https://pomber.github.io/covid19/timeseries.json")
response <- content(request, as = "text", encoding = "UTF-8")

query <-rawToChar(df_covid$content)
jsondata<-fromJSON(query)
jsondata$Afghanistan
columns<-c('country','date','confirmed','deaths','recovered')

for (country in jsondata) {
    country
  }
peru_covid<-jsondata$Peru
peru_covid$date<-as.Date(peru_covid$date)
peru_covid$confirmed
filter(peru_covid,confirmed>10)
arrange(peru_covid,date)

jsondata$Peru
covid_country <- function(country) {
   a<-jsondata[[country]]
   print("hola")
   print(country)
  a$date<-as.Date(a$date)
    return(a)
}
covid_19<-covid_country("Peru")
covid_19
covid_19$confirmed

covid_19%>%
  filter(confirmed>10)%>%
  arrange(date)%>%
  ggplot(aes(x=date,y = confirmed))+
  geom_point()
covid_19%>%
  arrange(date)%>%
  filter(deaths>0)%>%
  mutate(tmortalidad=deaths/confirmed)%>%
  ggplot(aes(x=date,y = tmortalidad))+
  geom_point(na.rm = FALSE)+
  geom_line(na.rm = FALSE)
  
tail(10)
covid_19%>%
  filter(confirmed>10)%>%
  arrange(date)%>%
  ggplot(aes(x=date,y = recovered))+
  geom_point()
covid_19%>%
  filter(confirmed>10)%>%
  arrange(date)%>%
  ggplot(aes(x=date,y = deaths))+
  geom_point()
covid_19%>%
  arrange(date)%>%
  filter(deaths>0)%>%
  mutate(tmortalidad=deaths/confirmed)->covid_19_study
covid_19_study











covid_19<-covid_country("Venezuela")
covid_19
covid_19$confirmed

covid_19%>%
  filter(confirmed>10)%>%
  arrange(date)%>%
  ggplot(aes(x=date,y = confirmed))+
  geom_point()
covid_19%>%
  arrange(date)%>%
  filter(deaths>0)%>%
  mutate(tmortalidad=deaths/confirmed)%>%
  ggplot(aes(x=date,y = tmortalidad))+
  geom_point(na.rm = FALSE)+
  geom_line(na.rm = FALSE)

#tail(10)
covid_19%>%
  filter(confirmed>10)%>%
  arrange(date)%>%
  ggplot(aes(x=date,y = recovered))+
  geom_point()
covid_19%>%
  filter(confirmed>10)%>%
  arrange(date)%>%
  ggplot(aes(x=date,y = deaths))+
  geom_point()
covid_19%>%
  arrange(date)%>%
  filter(deaths>0)%>%
  mutate(tmortalidad=deaths/confirmed)->covid_19_study
covid_19_study


covid_19%>%
  arrange(date)%>%
  filter(deaths>0)%>%
  tail(10)





