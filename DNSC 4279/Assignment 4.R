setwd("/Users/carlatapia/Desktop/DNSC 4279/Assignment 4")

library(caret)
library(tidyverse)
library(FNN)
library(gains)

wine.train <- read.csv("/Users/carlatapia/Desktop/DNSC 4279/Assignment 4/wine_train(1).csv")
wine.validation <- read.csv("/Users/carlatapia/Desktop/DNSC 4279/Assignment 4/wine_validation(1).csv")

# Create a new factor variable called "quality.class"
table(wine.train$quality)
wine.train$quality.class <- (ifelse(wine.train$quality>5, "good", "bad"))
wine.train$quality.class<- factor(wine.train$quality.class)
table(wine.train$quality.class)

wine.validation$quality.class <- (ifelse(wine.validation$quality>5, "good", "bad"))
wine.validation$quality.class<- factor(wine.validation$quality.class)
table(wine.validation$quality.class)

class(wine.train$quality.class)
class(wine.validation$quality.class)

wine.train.norm <- wine.train
wine.validation.norm <- wine.validation

# Use all other variables as predictors and normalize 
selected.vars <- c("fixed.acidity", "volatile.acidity", "citric.acid", 
                   "residual.sugar", "chlorides", "free.sulfur.dioxide",
                   "total.sulfur.dioxide","density", "pH", 
                   "sulphates", "alcohol")
normalizer <- preProcess(wine.train[,selected.vars],
                         method = c("center", "scale"))
wine.train.norm[,selected.vars] <- predict(normalizer, wine.train[,selected.vars])
wine.validation.norm[,selected.vars] <- predict(normalizer, wine.validation[,selected.vars])

# Obtain k-nearest neighbors classifier predictions for validation data 
wine.knn.1.preds <- FNN::knn(train = wine.train.norm[,selected.vars],
                             test = wine.validation.norm[,selected.vars],
                             cl = wine.train.norm$quality.class,
                             k=1)
head(wine.knn.1.preds)
length(wine.knn.1.preds)
nrow(wine.validation.norm)
summary(wine.knn.1.preds)
summary(wine.train.norm$quality.class)
length(wine.train.norm$quality.class)

confusionMatrix(wine.knn.1.preds, wine.validation.norm$quality.class,
                positive="good")

# Try values 1, 3, 5, 7, 9, 11, 13, & 15 and determine which model performs best measured by Balanced Accuracy 
sensitivity.vals <- c()
specificity.vals <- c()
k.vals <- c(1, 3, 5, 7, 9, 11, 13, 15)
for (k.val in k.vals) {
  wine.knn.preds <- FNN::knn(train = wine.train.norm[,selected.vars],
                             test = wine.validation.norm[,selected.vars],
                             cl = wine.train.norm$quality.class,
                             k=k.val)
  cf <- confusionMatrix(wine.knn.preds, wine.validation.norm$quality.class, positive="good")
  sensitivity <- cf$byClass['Sensitivity']
  specificity <- cf$byClass['Specificity']
  # save off our accuracy metrics for this model
  sensitivity.vals <- c(sensitivity.vals, sensitivity)
  specificity.vals <- c(specificity.vals, specificity)
}

sensitivity.df <- data.frame("k"=k.vals,
                             "metric"="Sensitivity (TPR)",
                             "value"=sensitivity.vals)
specificity.df <- data.frame("k"=k.vals,
                             "metric"="Specificity (TNR)",
                             "value"=specificity.vals)
results.df <- rbind(sensitivity.df, specificity.df)
head(results.df)
tail(results.df)

balanced.accuracy <- (sensitivity.vals + specificity.vals) / 2
best.index <- which.max(balanced.accuracy)
best.index
k.vals[best.index]
wine.knn.preds.best <- FNN::knn(train = wine.train.norm[,selected.vars],
                                test = wine.validation.norm[,selected.vars],
                                cl = wine.train.norm$quality.class,
                                k=k.vals[best.index])
confusionMatrix(wine.knn.preds.best, wine.validation.norm$quality.class,
                positive = "good")

# Best model performance is for the model with k=11

# Additional Questions
mean(wine.train.norm$fixed.acidity)
sd(wine.train.norm$fixed.acidity)
