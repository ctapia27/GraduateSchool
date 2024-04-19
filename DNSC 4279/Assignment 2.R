setwd("/Users/carlatapia/Desktop/DNSC 4279/Assignment 2")

library(tidyverse)
library(forecast)

toyota.train <- read.csv("ToyotaCorolla_Train.csv")
head(toyota.train)

toyota.test <- read.csv("ToyotaCorolla_Test.csv")
head(toyota.test)

#Train a linear model using the variables suggested 
toyota.lm <- lm(Price ~ Age_08_04 + KM + Fuel_Type + HP + 
                 Automatic + Doors + Quarterly_Tax + Mfr_Guarantee + 
                 Guarantee_Period + Airco + Automatic_airco + CD_Player + 
                 Powered_Windows + Sport_Model + Tow_Bar, data=toyota.train)
summary(toyota.lm)
toyota.lm$coefficients

#Compute predictions for the test data 
preds.test.full <- predict(toyota.lm, newdata = toyota.test)
preds.test.full

#Create a scatterplot of actual vs. predicted price for the predictions against the test data 
ggplot() +
  geom_point(mapping = aes(x=preds.test.full, y=toyota.test$Price)) + 
  geom_abline(mapping = aes(intercept = 0, slope = 1), col="blue")

#Plot a histogram of residuals for the test data 
ggplot() +
  geom_histogram(mapping = aes(toyota.test$Price - preds.test.full), bins=20)

# Additional Questions
accuracy(preds.test.full,toyota.test$Price)

preds.train.full <- predict(toyota.lm, newdata=toyota.train)
accuracy(preds.train.full, toyota.train$Price)

age.lm <- lm(Price ~ Age_08_04, data=toyota.train)
summary(age.lm)

km.lm <- lm(Price ~ KM, data=toyota.train)
summary(km.lm)

automatic.lm <- lm(Price ~ Automatic, data=toyota.train)
summary(automatic.lm)

cd.lm <- lm(Price ~ CD_Player, data=toyota.train)
summary(cd.lm)

all.lm <- lm(Price ~ Age_08_04 + KM + Automatic + CD_Player, data = toyota.train)
summary(all.lm)
