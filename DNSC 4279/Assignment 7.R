library(tidyverse)
library(stats) 
library(caret)

wine <- read.csv("/Users/carlatapia/Desktop/DNSC 4279/Assignment 7/wine.csv")
head(wine)

#Converting to wine dataset to tibble 
wine.tibble <- as_tibble(wine)
wine.tibble

#Choosing the data we want to use 
wine.numeric <- wine.tibble %>%
  select(Alcohol, Malic.acid, Ash, Alcalinity.of.ash, Magnesium, Total.phenols,
         Flavanoids, Nonflavanoid.phenols, Proanthocyanins, Color.intensity,
         Hue, OD280.OD315.of.diluted.wines, Proline)
wine.numeric

#Normalizing the dataset
normalizer <- preProcess(wine.numeric,
                         method = c("center", "scale"))
wine.normalized <- predict(normalizer, wine.numeric)
apply(wine.normalized, 2, mean)
apply(wine.normalized, 2, sd)

#K-means model on normalized data using k=3
set.seed(12345)
wine.kmodel <- kmeans(wine.normalized, 
               centers=3)
wine.kmodel
wine.numeric$cluster <- as.factor(wine.kmodel$cluster)

#A. Scatterplots
#i. "Alcohol" on the x-axis and "Flavanoids" on y-axis
ggplot(data=wine.numeric) +
  geom_point(mapping = aes(x=Alcohol, y=Flavanoids, col=cluster,
                           shape=cluster))

#ii. "OD280/OD315 of diluted wines" on the x axis, "Proline" on the y axis
ggplot(data=wine.numeric) +
  geom_point(mapping = aes(x=OD280.OD315.of.diluted.wines, y=Proline, col=cluster,
                           shape=cluster))

#iii. "Hue" on the x axis, "Color intensity" on the y axis
ggplot(data=wine.numeric) +
   geom_point(mapping = aes(x=Hue, y=Color.intensity, col=cluster,
                           shape=cluster))
#B. 
table(wine.numeric$cluster, wine$Cultivar)

#C. 
k.vals <- c(1,2,3,4,5,6,7,8,9,10)
k.tot.withinss <- c()
for (k.val in k.vals) {
  km.k <- kmeans(wine.normalized, k.val)
  current.tot.withinss <- km.k$tot.withinss
  k.tot.withinss <- c(k.tot.withinss, current.tot.withinss)
}

ggplot() +
  geom_line(mapping = aes(x=k.vals, y=k.tot.withinss)) + 
  xlab("k") + ylab("Total Sum of Squares within Clusters")

#E. 
wine.tibble$cluster <- as.factor(wine.kmodel$cluster)
ggplot(data=wine.tibble) +
  geom_point(mapping = aes(x=Alcohol, y=Flavanoids, col = cluster, shape = Cultivar)) +
  scale_shape()
