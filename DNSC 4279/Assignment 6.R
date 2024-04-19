setwd("/Users/carlatapia/Desktop/DNSC 4279/Assignment 6")
library(rpart) 
library(rpart.plot) 
library(gains)
library(tidyverse)
library(caret)

telco <- read_csv("/Users/carlatapia/Desktop/DNSC 4279/Assignment 6/Telco_Customer_Churn_cleaned.csv")
telco

#Transforming 'Churn' variable from categorical to factor 
table(telco$Churn)
telco$Churn <- as.factor(telco$Churn)
table(telco$Churn)
class(telco$Churn)

#Training a decision tree 
telco.tree<- rpart(Churn ~ .,
                        data=telco,
                        method="class",
                        maxdepth=3,
                        cp=0.01)

prp(telco.tree, type=1, extra=1, under=TRUE, split.font=2, varlen=-10,
    main="Telco Churn Decision Tree")


