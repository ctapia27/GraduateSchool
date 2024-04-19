library(tidyverse)
library(stats) 
library(caret)
library(dplyr)

heart <- read.csv("/Users/carlatapia/Desktop/DNSC 4279/Group Project/heart_data.csv")
heart

heart <- subset(heart, ap_lo >= 20 & ap_lo <= 400)
heart <- subset(heart, ap_hi >= 20 & ap_hi <= 400)
view(heart)

heart$height.norm <- scale(heart$height)
heart$weight.norm <- scale(heart$weight)
heart$ap_hi.norm <- scale(heart$ap_hi)
heart$ap_lo.norm <- scale(heart$ap_lo)
heart

table(heart$cardio)
heart$cardio <- (ifelse(heart$cardio == 0, "FALSE", "TRUE"))
heart$cardio<- factor(heart$cardio)
table(heart$cardio)

library(dplyr)    
heart <- heart %>% 
  mutate(real_age = age/365)
heart

heart.log <- select(heart, 'gender', 'cholesterol','gluc', 'smoke', 'alco', 
                    'active', 'cardio', 'height.norm', 'weight.norm',
                    'ap_hi.norm', 'ap_lo.norm', 'real_age')
heart.log

dim(heart.log)
train.proportion <- 2/3
train.size <- nrow(heart.log) * train.proportion
train.size
set.seed(12345)
train.idx <- sample(1:nrow(heart.log),
                    train.size)
train.data <- heart.log[train.idx,]
test.data <- heart.log[-train.idx,]

table(train.data$cardio)
table(test.data$cardio)

#logistic regression
full.glm <- glm(train.data$cardio ~ gender + gluc + smoke + alco + 
                  + active+cholesterol+height.norm+weight.norm+ 
                  ap_hi.norm+ap_lo.norm+real_age, data =train.data, family = binomial)
summary(full.glm)

step.glm.backward <- step(full.glm, direction = "backward")
summary(step.glm.backward)

dummy.glm <- glm(data=train.data, train.data$cardio ~ 1, family = binomial)
step.glm.forward <- step(dummy.glm, direction = "forward",
                        scope=list(lower=dummy.glm, upper=full.glm))
summary(step.glm.forward)

step.glm.forward.4 <- step(dummy.glm, direction = "forward",
                          scope=list(lower=dummy.glm, upper=full.glm), steps=4)
summary(step.glm.forward.4)

#predictions on full.glm model
train.data$cardio.prob.full.glm <- predict(full.glm, newdata = train.data,
                                          type="response")
test.data$cardio.prob.full.glm <- predict(full.glm, newdata = test.data,
                                         type="response")

test.data$cardio.pred.full.glm <- test.data$cardio.prob.full.glm > 0.5
table(test.data$cardio.pred.full.glm, test.data$cardio)

library(caret)
test.data$cardio.pred.full.glm <- as.factor(test.data$cardio.pred.full.glm)
test.data$cardio <- as.factor(test.data$cardio)
confusionMatrix(test.data$cardio.pred.full.glm, test.data$cardio,positive = "TRUE")

#ROC
table(test.data$cardio.prob.full.glm)
library(plotROC)
ggplot(data=test.data,
       mapping = aes(m = cardio.prob.full.glm, d = cardio)) +
  ggtitle("ROC of Full Logistic Regression") +
  geom_roc(n.cuts=10,labels=FALSE) + 
  style_roc(theme = theme_grey)

library(pROC)
roc.obj <- roc(response = test.data$cardio,
               predictor = test.data$cardio.prob.full.glm)
auc(roc.obj)


#predictions of stepwise backward
train.data$cardio.prob.step.glm.backward <- predict(step.glm.backward, newdata = train.data,
                                           type="response")
test.data$cardio.prob.step.glm.backward <- predict(step.glm.backward, newdata = test.data,
                                          type="response")

test.data$cardio.pred.step.glm.backward <- test.data$cardio.prob.step.glm.backward > 0.5
table(test.data$cardio.pred.step.glm.backward, test.data$cardio)

test.data$cardio.pred.step.glm.backward <- as.factor(test.data$cardio.pred.step.glm.backward)
test.data$cardio <- as.factor(test.data$cardio)
confusionMatrix(test.data$cardio.pred.step.glm.backward, test.data$cardio, positive = 'TRUE')

#ROC
table(test.data$cardio.prob.step.glm.backward)

ggplot(data=test.data,
       mapping = aes(m = cardio.prob.step.glm.backward, d = cardio)) +
  geom_roc(n.cuts=10,labels=FALSE) + 
  ggtitle("ROC of Stepwise Backward Logistic Regression") +
  style_roc(theme = theme_grey)

roc.obj.back <- roc(response = test.data$cardio,
               predictor = test.data$cardio.prob.step.glm.backward)
auc(roc.obj.back)


#predictions of stepwise forward
train.data$cardio.prob.step.glm.forward <- predict(step.glm.forward, newdata = train.data,
                                                   type="response")
test.data$cardio.prob.step.glm.forward <- predict(step.glm.forward, newdata = test.data,
                                                  type="response")

test.data$cardio.pred.step.glm.forward <- test.data$cardio.prob.step.glm.forward > 0.5
table(test.data$cardio.pred.step.glm.forward, test.data$cardio)

test.data$cardio.pred.step.glm.forward <- as.factor(test.data$cardio.pred.step.glm.forward)
test.data$cardio <- as.factor(test.data$cardio)
confusionMatrix(test.data$cardio.pred.step.glm.forward, test.data$cardio, positive = 'TRUE')

#ROC
table(test.data$cardio.prob.step.glm.forward) 
ggplot(data=test.data,
       mapping = aes(m = cardio.prob.step.glm.forward, d = cardio)) +
  geom_roc(n.cuts=10,labels=FALSE) + 
  ggtitle("ROC of Stepwise Forward Logistic Regression") +
  style_roc(theme = theme_grey)

roc.obj.front <- roc(response = test.data$cardio,
               predictor = test.data$cardio.prob.step.glm.forward)
auc(roc.obj.front)

#predictions for stepwise top 4
train.data$cardio.prob.step.glm.forward.4 <- predict(step.glm.forward.4, newdata = train.data,
                                                   type="response")
test.data$cardio.prob.step.glm.forward.4 <- predict(step.glm.forward.4, newdata = test.data,
                                                  type="response")

test.data$cardio.pred.step.glm.forward.4 <- test.data$cardio.prob.step.glm.forward.4 > 0.5
table(test.data$cardio.pred.step.glm.forward.4, test.data$cardio)

test.data$cardio.pred.step.glm.forward.4 <- as.factor(test.data$cardio.pred.step.glm.forward.4)
test.data$cardio <- as.factor(test.data$cardio)
confusionMatrix(test.data$cardio.pred.step.glm.forward.4, test.data$cardio, positive = 'TRUE')

#ROC
table(test.data$cardio.prob.step.glm.forward.4) 
ggplot(data=test.data,
       mapping = aes(m = cardio.prob.step.glm.forward.4, d = cardio)) +
  geom_roc(n.cuts=10,labels=FALSE) + 
  ggtitle("ROC of Top 4 Variables from Stepwise Forward Logistic Regression") +
  style_roc(theme = theme_grey)

roc.obj.4 <- roc(response = test.data$cardio,
               predictor = test.data$cardio.prob.step.glm.forward.4)
auc(roc.obj.4)
