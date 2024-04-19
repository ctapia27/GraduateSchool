setwd("/Users/carlatapia/Desktop/DNSC 4279/Assignment 5")

library(tidyverse)
library(stats)

bank <- read.csv("/Users/carlatapia/Desktop/DNSC 4279/Assignment 5/banks.csv")

# Developing dummy variable to classify success and weak
table(bank$Financial.Condition)
bank$financial.class <- (ifelse(bank$Financial.Condition>0.5, "weak", "success"))
bank$financial.class<- factor(bank$financial.class)
table(bank$financial.class)

#logit function
logit.bank <- glm(financial.class ~ TotLns.Lses.Assets + TotExp.Assets,
                  data = bank, family= binomial)
summary(logit.bank)

#logit, odds, and probability of new data point
-14.721+8.371*0.6+89.834*0.11
exp(-14.721+8.371*0.6+89.834*0.11)
1/(1+(1/exp(-14.721+8.371*0.6+89.834*0.11)))

#cutoff
Cutoff <- as.numeric(0.5)
Odds <- Cutoff/(1-Cutoff)
Odds
NewLogit <- log(Odds)
NewLogit

exp(8.371)
