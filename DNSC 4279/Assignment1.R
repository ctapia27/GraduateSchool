ridingmowers <- read.csv("/Users/carlatapia/Desktop/DNSC 4279/Assignment 1/RidingMowers.csv")
head(ridingmowers)

#Create a scatterplot comparing Lot Size vs. Income color-coded by ownership
ggplot(ridingmowers) +
  geom_point(mapping=aes(x=Income, y=Lot_Size, col=Ownership))+
  xlab("Income") + ylab("Lot Size") + ggtitle("Lot Size vs. Income")

#Create a plot of Lot Size vs. Income using shape instead of color to visualize the Ownership Variable 
ggplot(ridingmowers) + 
  geom_point(mapping=aes(x=Income,y=Lot_Size, shape=Ownership), size=4)

#Create a histogram of Lot Size 
ggplot(ridingmowers) + geom_histogram(mapping=aes(x=Lot_Size))

#Create a histogram of Income 
ggplot(ridingmowers) + geom_histogram(mapping=aes(x=Income))

#Create a boxplot of Lot Size vs. Ownership
ggplot(ridingmowers) +
  geom_boxplot(mapping=aes(x=Ownership, y=Lot_Size))

#Create a boxplot of Income vs. Ownership
ggplot(ridingmowers) +
  geom_boxplot(mapping=aes(x=Ownership, y=Income))

