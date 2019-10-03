#Explore the blackman.wheat dataset from agridat. 
#Generate a plot that shows the effect of fertiliser treatment across genotypes (gen) and sites (loc).

install.packages("agridat") # install agridat package

library(agridat) #call agridat library

blackman_wheat <-blackman.wheat #load blackman.wheat data

ggplot(data=blackman_wheat,
       mapping=aes(x=gen,
                   y=yield,
                   colour=nitro))+
  geom_point()
  
