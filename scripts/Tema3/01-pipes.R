library(tidyverse)
dd<-ggplot2::diamonds
dd1<-dd%>%
  dplyr::mutate(price_per_carat=price/carat)
rnorm(1000)%>%
  matrix(ncol = 2)%T>%
    plot()%>%
    str()
#mtcars filtro y se le asigno de vuelta
mtcars%<>%
  filter(cyl==6)
