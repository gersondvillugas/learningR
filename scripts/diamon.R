getwd()
library(tidyverse)
ggplot(diamonds,aes(caratprice))+
  geom_hex()
ggsave("figures/diamonds_hex.pdf")

write_csv(diamonds,"data/diamonds.csv")