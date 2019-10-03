library(tidyverse) #load tidyverse package

gapminder<-read_csv("data/gapminder_data.csv")# read gapminder csv and assign to gapminder variable

gapminder_1977<-filter(gapminder,year==1977) #gets gapminder that is filtered for 1977 only

ggplot(data=gapminder_1977) #provide ggplot with gapminder_1977

ggplot(data=gapminder_1977, # maps the gpaminder_data to aesthetics 
       mapping=aes(x=gdpPercap,
                   y=lifeExp,
                   colour=continent,
                   size=pop))

ggplot(data=gapminder_1977, # maps the gpaminder_data to aesthetics 
       mapping=aes(x=gdpPercap,
                   y=lifeExp,
                   colour=continent,
                   size=pop)) +
  geom_point() # applies the aesthetics to the geometry 

ggplot(data=gapminder_1977, # maps the gpaminder_data to aesthetics 
       mapping=aes(x=gdpPercap,
                   y=lifeExp,
                   colour=continent,
                   size=pop)) +
  geom_point() + # applies the aesthetics to the geometry 
  scale_x_log10() #scales x axis to log10

ggplot(data = gapminder_1977) +
  geom_point( mapping = aes(x = gdpPercap,
                            y = lifeExp,
                            colour = continent,
                            size = pop) )+
  scale_x_log10 #shows the same as the code above but mapping is located in the geom_point function instead)

#challenge 4 this shows that there are lots of variations but you should consider 
#carefully the mapping to produce a graph that is actaully meaningful
ggplot(data=gapminder_1977, # maps the gpaminder_data to aesthetics 
       mapping=aes(x=country,
                   y=year,
                   colour=pop)) +
  geom_point() + # applies the aesthetics to the geometry 
 

#challenge 6
ggplot(gapminder_1977, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(colour = "blue", size = 5) #sets all points as blue and size 5

ggplot(data = gapminder_1977, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)) +
  geom_point(colour="pink" ,size=5) +
  scale_x_log10() #shows that setting an aesthetic overwites the mapping

ggplot(data = gapminder_1977, 
       mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)) +
  geom_point(alpha=0.5,shape="square") +
  scale_x_log10() #sets the opacity of 50% and shape of square

#challenge 7 
ggplot(data=gapminder,
       mapping=aes(x=year,
                    y=lifeExp))+
  geom_point() #using gapminder data mapping year on x and life exp on y applying point geometry

ggplot(data=gapminder,
       mapping=aes(x=year,
                   y=lifeExp))+
  geom_point(colour="purple",shape="star") #usign the name as above but sets colour and shape in 

ggplot(data=gapminder,
       mapping=aes(x=year,
                   y=lifeExp,
                   group=country,
                   colour=continent))+
  geom_line()+ # for a line graph need to tell r which groups to have on the same line otherwise they will form a single line
  geom_point(colour="black") #adds a point to the line and colours it black

ggplot(data=gapminder,
       mapping=aes(x=year,
                   y=lifeExp,
                   group=country,))+
  geom_line(aes(colour=continent))+ 
  geom_point() #note that the order of the geom is important as they are added in layers. If point is first then the line is plotted over it.

#transformations and statistics
ggplot(data=gapminder,
       mapping=aes(x=gdpPercap,y=lifeExp))+
  geom_point(alpha=0.3)+
  scale_x_log10()+
  geom_smooth(method="lm",size=2) # adds a trendline need to tell it which method to use, able to set values as in any other geom. 

ggplot(data=gapminder,
       mapping=aes(x=gdpPercap,y=lifeExp))+
  geom_point(aes(colour=continent))+
  scale_x_log10()+
  scale_colour_manual(values=c("red","green","purple","blue","black")) # allows you to manually select the colours using a vector (c function)

#challenge 9
ggplot(data=gapminder,
       mapping=aes(x=gdpPercap,y=lifeExp))+
  geom_point(colour="green")+
  scale_x_log10()+
  geom_smooth(method="lm")

#challenge 10  
ggplot(data=gapminder,
       mapping=aes(x=gdpPercap,y=lifeExp,colour=continent))+
  geom_point(shape="triangle")+
  scale_x_log10()+
  geom_smooth(method="lm")

#challenge 11
ggplot(data=gapminder,
       mapping=aes(x=gdpPercap,y=lifeExp,colour=continent))+
  geom_point()+
  scale_x_log10()+
  scale_colour_manual(values=c("steelblue","peachpuff2","hotpink","green4","plum2")) #manual definition fo the colour

ggplot(data=gapminder,
       mapping=aes(x=gdpPercap,y=lifeExp,colour=continent))+
  geom_point()+
  scale_x_log10()+
  scale_colour_brewer(palette="Set1") #use of colour brewer palette

#separating figures
a_countries<-gapminder %>%
  filter(str_starts(country,"A")) # filter gapminder for country name starting with A

ggplot(data=a_countries, # builds a plot of lifeExp over time only for a countries
       mapping=aes(x=year,
                  y=lifeExp,
                  group=country,
                  colour=continent))+
  geom_line()+
  facet_wrap(~country)# facet wrap gives a plot for each country

#challenge 12
ggplot(data=gapminder,
       mapping = aes(x=gdpPercap,
                     y=lifeExp,
                     colour=continent,
                     size=pop))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year) #displays the gdpPercap and life expecancy colour for continent, size for pop with a panel for each year

gapminder_rich<-filter(gapminder_1977,gdpPercap>30000)

ggplot(data=gapminder_1977,
       mapping = aes(x=gdpPercap,
                     y=lifeExp,
                     colour=continent,
                     size=pop,
                     label=country))+
  geom_point()+
  scale_x_log10()+
  geom_text(data=gapminder_rich,size=2,colour="black")# add a label to each point you can provide data separately to geom_text

#a ggplot can be saved as a variable in the same way that you can with a data frame
rough_plot<-ggplot(data=a_countries, # builds a plot of lifeExp over time only for a countries
       mapping=aes(x=year,
                   y=lifeExp,
                   group=country,
                   colour=continent))+
  geom_line()+
  facet_wrap(~country)# facet wrap gives a plot for each country

rough_plot+scale_colour_brewer(palette="Dark2") # takes the rough_plot varialbe and applies the colour_brewer palette 

rough_plot+
  labs(title= "Life Expectancy over time for 'A' countries",
       x="Year",
       y="Life expectancy",
       colour="Continent",
       caption="Data source:Gapminder")+ # adds labels
  theme(
    panel.grid.major=element_blank(),
    plot.title=element_text(size=14),
    axis.line=element_line(colour="blue",size=4)
  )#allows to design specific parts of the plot one by one

ggsave("figures/my-first-plot.png") #saves plot into a file on the computer by default on the last plot you have run
ggsave("figures/my-first-plot.png",plot=rough_plot,width=12,height=10,units=cm ) #specifies the plot to save as a png file. if you change the file extension you can get jpeg etc, also specifies the image size to be saved. 
