#Carla Tapia 
#Assignment 3
#October 8, 2023 

setwd("/Users/carlatapia/Desktop/ISTM 4214/Assignments/Assignment 3")
install.packages('tidyverse')
install.packages('knitr')
install.packages("maps")
library(maps)
library(tidyverse)
library(knitr)
library(ggplot2)
library(dplyr)
library(gridExtra)

### Task 1 ###
Cars93 <- as_tibble(MASS::Cars93)

#a
qplot(x= EngineSize, y = Price, data= Cars93, xlab= "Engine Size", ylab= "Price", main= "Engine Size vs. Price")
#The relationship between Price and Engine Size is a linear positive relationship. 
#Based on the plot, it looks like there is a positive correlation but as Engine Size increases, price becomes more scattered.

#b
ggplot(data = Cars93) +
  geom_point(aes(x= EngineSize, y= Price)) + labs(title= "Engine Size vs. Price")

#c
ggplot(data = Cars93) +
  geom_point(aes(x= EngineSize, y= Price, shape= DriveTrain, color= Type))
#A) The different types of cars do seem to cluster. Compact cars look like they stay between the 2-3 Engine Size range.
    # Large cars are do not go below a 3 in Engine Size. Mid-size cars stay between 2-4.5 in Engine Size and vary widely in Price. 
    # Small cars stay relatively in the 1-2 Engine Size range and on the lower end of pricing. Sporty cars range across all the Engine Sizes and between 10-40 in Price.
    # Lastly, vans range from 2.5-4.5 in Engine Size and are also on the lower end of Price. 
#B) The different types of DriveTrain also seem to have a pattern. 4WD has a positive linear relationship with Engine Size and price but stays at the lower end of each variable.
    # Front also has a positive linear relationship with both variables but tends to scatter when increasing in Engine Size. 
    # Rear is very scattered between Price and Engine Size, it is a bit unclear to discern if there is a positive relationship or no relationship between the variables. 

#d
ggplot(data = Cars93)+
  geom_boxplot(aes(x = AirBags, y = Price))
#Driver & Passenger and Driver only airbags both have an outlier with Price. Driver & Passenger airbags have a higher median price, as well as a higher minimum and maximum
# compared to Driver only and having no airbags. 

### Task 2 ###
head(USArrests)
states <- map_data("state")
View(states)
arrests <- USArrests
names(arrests) <- tolower(names(arrests))
arrests$region <- tolower(rownames(USArrests))
choro <- merge(states, arrests, sort = FALSE, by = "region")
choro <- choro[order(choro$order), ]
qplot(long, lat, data = choro, group = group, fill = assault,
      geom = "polygon") 

### Task 3 ###
olympics <- read.csv("summer_winter_olympics.csv")
head(olympics)
View(olympics)

#a
plot1 <- ggplot(data = olympics, aes(x=Total)) + geom_histogram(bins = 15) + labs(x = "Summer Total", title= "Summer Games Total")
plot1

#b
plot2 <- ggplot(data= olympics, aes(x=Total.1)) + geom_histogram(bins = 15) + labs(x = "Winter Total", title= "Winter Games Total")
plot2

#c
grid.arrange(plot1, plot2, ncol=2)
grid.arrange(plot1, plot2)

#d
plot3 <- ggplot(data=olympics, aes(x=X..Summer)) + geom_histogram() + labs(x= "Total Summer", title="Summer Total Medals Won")
plot4 <- ggplot(data=olympics, aes(x=X..Winter)) + geom_histogram() + labs(x="Total Winter", title="Winter Total Medals Won")
grid.arrange(plot3, plot4, ncol=2)
grid.arrange(plot3, plot4)

#e
ggplot(data=olympics)+
  geom_point(aes(x=Total.1, y= Total, size = Combined.total)) + labs(title="Medals given out in Summer & Winter", x="Winter Total", y = "Summer Total") +
  geom_smooth(aes(x=Total.1, y= Total), method="lm")
#There seems to be a positive linear correlation between the number of medals given out in the winter and summer. 
#using cor() function to verify inference 
cor(olympics$Total.1, olympics$Total)

#f
ggplot(data=olympics)+
  geom_point(aes(x=X..Winter, y= X..Summer, size = X..Games)) + labs(title="Summer & Winter Game Participation", x="Winter Total", y = "Summer Total") +
  geom_smooth(aes(x=X..Winter, y= X..Summer), method="lm")
#There also seems to be a positive linear correlation between the number of games a country participates in the Summer and Winter 
#using cor() function to verify inference 
cor(olympics$X..Winter, olympics$X..Summer)


#g
plot5 <- ggplot(data=olympics, aes(x=X)) + geom_histogram()
plot6 <- ggplot(data=olympics, aes(x=X.1)) + geom_histogram()
plot7 <- ggplot(data=olympics, aes(x=X.2)) + geom_histogram()
plot8 <- ggplot(data=olympics, aes(x=X.3)) + geom_histogram()
plot9 <- ggplot(data=olympics, aes(x=X.4)) + geom_histogram()
plot10 <- ggplot(data=olympics, aes(x=X.5)) + geom_histogram()
grid.arrange(plot5, plot6, plot7, plot8, plot9, plot10)

#h
plot11 <- ggplot(data=olympics, aes(x=X)) + geom_histogram(bins=10)
plot12 <- ggplot(data=olympics, aes(x=X.1)) + geom_histogram(bins=10)
plot13 <- ggplot(data=olympics, aes(x=X.2)) + geom_histogram(bins=10)
plot14 <- ggplot(data=olympics, aes(x=X.3)) + geom_histogram(bins=10)
plot15 <- ggplot(data=olympics, aes(x=X.4)) + geom_histogram(bins=10)
plot16 <- ggplot(data=olympics, aes(x=X.5)) + geom_histogram(bins=10)
grid.arrange(plot11, plot12, plot13, plot14, plot15, plot16)
