setwd("/Users/carlatapia/Desktop/DNSC 4279/Assignment 3")

library(forecast)
library(tidyverse)
library(ggplot2)

validation.data <- read.csv("/Users/carlatapia/Desktop/DNSC 4279/Assignment 3/imports-85-validation.csv")
train.data <- read.csv("/Users/carlatapia/Desktop/DNSC 4279/Assignment 3/imports-85-train.csv")
test.data <- read.csv("/Users/carlatapia/Desktop/DNSC 4279/Assignment 3/imports-85-test.csv")

dim(test.data)
dim(train.data)

#B: Produce a histogram of the target variable using the training data 
ggplot(data=train.data)+
  geom_histogram(mapping = aes(normalized.losses), bins=10)

#Train 4 models 
full.lm <- lm(data=train.data, normalized.losses ~ .)
summary(full.lm)

step.lm.backward <- step(full.lm, direction = "backward")
summary(step.lm.backward)

dummy.lm <- lm(data=train.data, normalized.losses ~ 1)
step.lm.forward <- step(dummy.lm, direction = "forward",
                        scope=list(lower=dummy.lm, upper=full.lm))
summary(step.lm.forward)

step.lm.forward.3 <- step(dummy.lm, direction = "forward",
                        scope=list(lower=dummy.lm, upper=full.lm), steps=3)
summary(step.lm.forward.3)

#D: Produce a plot of actuals vs. predict values for normalized loses against the validation
# set for each model
predict.full.lm <- predict(full.lm, newdata=validation.data)
ggplot(data = validation.data)+
  geom_point(mapping=aes(x=predict.full.lm, y=normalized.losses))+ 
  geom_abline(mapping = aes(intercept=0, slope=1), col="red")+
  ggtitle("Full.lm Scatterplot")

predict.step.lm.backward <- predict(step.lm.backward, newdata = validation.data)
ggplot(data = validation.data)+
  geom_point(mapping=aes(x=predict.step.lm.backward, y=normalized.losses))+ 
  geom_abline(mapping = aes(intercept=0, slope=1), col="red")+
  ggtitle("Step.lm.backward Scatterplot")

predict.step.lm.forward <- predict(step.lm.forward, newdata = validation.data)
ggplot(data = validation.data)+
  geom_point(mapping=aes(x=predict.step.lm.forward, y=normalized.losses))+ 
  geom_abline(mapping = aes(intercept=0, slope=1), col="red")+
  ggtitle("Step.lm.forward Scatterplot")

predict.step.lm.forward.3 <- predict(step.lm.forward.3, newdata = validation.data)
ggplot(data = validation.data)+
  geom_point(mapping=aes(x=predict.step.lm.forward.3, y=normalized.losses))+ 
  geom_abline(mapping = aes(intercept=0, slope=1), col="red")+
  ggtitle("Step.lm.forward.3 Scatterplot")

accuracy(predict.full.lm, validation.data$normalized.losses)
accuracy(predict.step.lm.backward, validation.data$normalized.losses)
accuracy(predict.step.lm.forward, validation.data$normalized.losses)
accuracy(predict.step.lm.forward.3, validation.data$normalized.losses)

#G: Train dataset
predict.full.lm.train <- predict(full.lm, newdata=train.data)
predict.step.lm.backward.train <- predict(step.lm.backward, newdata = train.data)
predict.step.lm.forward.train <- predict(step.lm.forward, newdata = train.data)
predict.step.lm.forward.3.train <- predict(step.lm.forward.3, newdata = train.data)

accuracy(predict.full.lm.train, train.data$normalized.losses)
accuracy(predict.step.lm.backward.train, train.data$normalized.losses)
accuracy(predict.step.lm.forward.train, train.data$normalized.losses)
accuracy(predict.step.lm.forward.3.train, train.data$normalized.losses)

#I: Obtain predictions for each model against the test data
predict.full.lm.test <- predict(full.lm, newdata=test.data)
predict.step.lm.backward.test <- predict(step.lm.backward, newdata = test.data)
predict.step.lm.forward.test <- predict(step.lm.forward, newdata = test.data)
predict.step.lm.forward.3.test <- predict(step.lm.forward.3, newdata = test.data)

accuracy(predict.full.lm.test, test.data$normalized.losses)
accuracy(predict.step.lm.backward.test, test.data$normalized.losses)
accuracy(predict.step.lm.forward.test, test.data$normalized.losses)
accuracy(predict.step.lm.forward.3.test, test.data$normalized.losses)

