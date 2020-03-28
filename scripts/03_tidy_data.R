library(tidyverse)
table<-read_csv("data/population.csv")
table%>%
  mutate(
    rate=cases/population*10000
  )
table%>%
  count(year,wt=cases)
table%>%
  ggplot(aes(year,cases))+
  geom_line(aes(group=country),color="grey")+
geom_point(aes(color=country))  
#à partir de valores con columnas generamos filas
table4a %>%
  gather(`1999`,`2000`,key="year",value = "cases")->tidy4a
table4b %>%
  gather(`1999`,`2000`,key="year",value = "population")->tidy4b
left_join(tidy4a,tidy4b)
#mas largas
table2%>%
  spread(key=type,value = count)
table3%>%
  separate(rate,into=c("cases","population"),sep = "/",convert = TRUE)%>%
  separate(year,sep = 2,into =c("century","TRUE"),
        convert = TRUE
           )
table5%>%
  unite(new_year,century,year,sep = "/")
roi <- tibble(
  year = c(rep(2016,4), rep(2017,4), 2018),
  quarter = c(rep(c(1,2,3,4),2),1),
  return = rnorm(9, mean = 0.5, sd = 1)
)
roi$return[7] = NA

roi %>%
  spread(year, return) %>%
  gather(year, return, `2016`:`2018`, na.rm = TRUE)

roi %>%
  complete(year, quarter)


