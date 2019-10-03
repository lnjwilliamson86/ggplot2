library(tidyverse)

gapminder<-read_csv("data/gapminder.csv")# read gapminder csv and assign to gapminder variable

gapminder_1977<-filter(gapminder,year==1977) #filter data for 1977 only
