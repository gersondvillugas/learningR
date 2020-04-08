# Familia de modelos que expresa /relacion a estudiar
# y=a_1*x +a_0 ->relacion lineal
# y=a_2*x^2 + a_1*x + a_0 ->relacion cuadratica

#ajusta el modelo:buscar los parametros del modelo que hayamos
#y=6x-8
#y=2x^2-5x+8
library(tidyverse)
library(modelr)
options(na.action = na.warn)
sim1%>%view()
sim1%>%
  ggplot(aes(x,y))+
  geom_point()
#y=a_0+a_1* x 
models<-tibble(
  a0=runif(300,-20,40),
  a1=runif(300,-5,5),
  
)
models
sim1%>%
  ggplot(aes(x,y))+
  geom_abline(aes(intercept=a0,slope=a1),data=models,alpha=0.2)+
  geom_point()
model1<-function(a0,a1,data){
  
  a0+data$x * a1
}
model1(3,1.2,sim1)
sim1$y-model1(3,1.2,sim1)

rmse <- function(mod,data) {
  diff<-data$y-model1(mod[1],mod[2],data)
  sqrt(mean(diff^2))
}
rmse(c(3,1.2),sim1)
sim1_rmse <- function(a0,a1) {
  rmse(c(a0,a1),sim1)
}  
models<-models%>%
  mutate(rmse=purrr::map2_dbl(a0,a1,sim1_rmse))
models%>%View()
sim1%>%
  ggplot(aes(x,y))+
  geom_point(size=2,color="grey30")+
  geom_abline(aes(intercept=a0,slope=a1,color=-rmse),
              data=filter(models,rank(rmse) <= 10))


# y=a0+  a1*x + a2*x2 + .....  + an*xn
lm(y~x,data=sim1)->sim1_mod
coef(sim1_mod)
summary(sim1_mod)
grid<-sim1%>%
  data_grid(x)
grid
grid<-grid%>%
  add_predictions(sim1_mod)
grid
sim1%>%
  ggplot(aes(x))+
  geom_point(aes(y=y))+
  geom_line(aes(y=pred),data=grid,color="red",size=2)
sim1<-sim1%>%
  add_residuals(sim1_mod)
sim1%>%
  ggplot(aes(resid))+
  geom_freqpoly(binwidth=0.5)
sim1%>%
  ggplot(aes(x,resid))+
  geom_point()+
  geom_ref_line(h=0)
# y~x <-> y=a0+a1 * y<-> y=a0+out0+a1 * out1
df<-tribble(
  ~y,~x1,~x2,
  4, 2 , 5,
  5, 1 , 6
)
model_matrix(df,y~x1)
model_matrix(df,y~x1-1)
model_matrix(df,y~x1+x2)
sim2%>%
  ggplot(aes(x,y))+
  geom_point()
mod2<-lm(y~x,data=sim2)
sim2
grid<-sim2%>%
  data_grid(x)
grid
grid<-sim2%>%
  data_grid(x)%>%
  add_predictions(mod2)
grid
sim2%>%
  ggplot(aes(x))+
  geom_point(aes(y=y))+
  geom_point(data=grid,aes(y=pred),color="red",size=4)
sim3%>%
   ggplot(aes(x1,y))+
  geom_point(aes(color=x2))
mod1<-lm(y~x1+x2,data=sim3)
mod2<-lm(y~x1*x2,data=sim3)

grid<-sim3 %>% 
  data_grid(x1,x2) %>%
  gather_predictions(mod1,mod2)

grid
sim3%>%
  data_grid(x1,x2) %>%
  spread_predictions(mod1,mod2)
sim3%>% 
  ggplot(aes(x1,y,color=x2))+
  geom_point()+
  geom_line(data=grid,aes(y=pred))+
  facet_wrap(~model)
grid%>% View()
sim3%>%
  gather_residuals(mod1,mod2) %>%
  ggplot(aes(x1,resid,color=x2))+
  geom_point()+
  facet_grid(model~x2)
