install.packages("randomForest")
library(randomForest)
library(caret)
library(gains)

heart <- read.csv("/Users/carlatapia/Desktop/DNSC 4279/Group Project/heart_data.csv")
dim(heart)

table(heart$cholesterol)
heart$cholesterol <- (ifelse(heart$cholesterol>1, "bad", "good"))
heart$cholesterol<- factor(heart$cholesterol)
table(heart$cholesterol)

library(dplyr)    
heart.tranformed <- heart %>% 
  mutate(real_age = age/365)
heart.tranformed

set.seed(12345)
train.proportion <- 0.75
val.proportion <- 0.25

train.index <- sample(1:nrow(heart.tranformed), nrow(heart.tranformed)*train.proportion)
train.data <- heart.tranformed[train.index,]
validation.data <- heart.tranformed[-train.index,]

View(train.data)

chol.rf.1 <- randomForest(cholesterol ~ gender + height + weight + ap_hi + ap_lo + gluc + smoke +
                            alco + active + cardio + real_age, data=train.data)
validation.data$preds.chol.rf.1 <- predict(chol.rf.1,
                                      newdata=validation.data,
                                      type="class")
summary(validation.data$preds.chol.rf.1)
confusionMatrix(validation.data$preds.chol.rf.1,
                validation.data$cholesterol,
                positive="good")

probs.chol.rf.1 <- predict(chol.rf.1,
                      newdata=validation.data,
                      type="prob")
head(probs.chol.rf.1)
validation.data$cholesterol.probs.1 <- probs.chol.rf.1[,2]
head(validation.data$cholesterol.probs.1)

library(gains)
gain.1 <- gains(as.numeric(validation.data$cholesterol), 
                validation.data$cholesterol.probs.1,
                groups=50)
head(gain.1)

total.cholesterol <- sum(as.numeric(validation.data$cholesterol))
yvals <- c(0,gain.1$cume.pct.of.total*total.cholesterol)
xvals <- c(0,gain.1$cume.obs)

lift.inputs <- data.frame("xvals"=xvals,
                          "yvals"=yvals,
                          "model"="Model 1")
ggplot(data=lift.inputs) + 
  geom_line(mapping = aes(x=xvals, y=yvals, col=model)) +
  xlab("Predicted Good Cholesterol") + ylab("Actual Good Cholesterol") + 
  ggtitle("Model Comparison") + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  geom_abline(intercept = c(0,0), 
              slope=total.cholesterol/nrow(validation.data),
              linetype="dashed")

## Model parameter tuning ##
mtry.vals <- c(1:7)
mtry.results <- c()

for (mtry.val in mtry.vals) {
  print(mtry.val)
  # train a random forest with mtry = mtry.val
  rf.current <- randomForest(cholesterol ~ gender + height + weight + ap_hi + ap_lo + gluc + smoke +
                               alco + active + cardio + real_age, data=train.data, mtry = mtry.val,ntree=200)
  
  # obtain predictions for the current model 
  # and "Balanced Accuracy" for those predictions
  rf.preds <- predict(rf.current, newdata=validation.data)
  cm <- confusionMatrix(rf.preds, validation.data$cholesterol)
  balanced.accuracy <- cm$byClass['Balanced Accuracy']
  mtry.results <- c(mtry.results, balanced.accuracy)
}

# plot the results
ggplot() + 
  geom_point(mapping = aes(x=mtry.vals, y=mtry.results)) + 
  xlab("mtry") + ylab("Balanced Accuracy")

mtry.vals <- rep(c(1:7),5)
mtry.results <- c()
ggplot() +
  geom_jitter(mapping = aes(x=mtry.vals, y=mtry.results), width=0.1) +
  xlab("mtry") + ylab("Balanced Accuracy")

# different nodesizes 
set.seed(12345)
nodesize.vals <- rep(c(1,2,3,4,5,7,10,15,20,30,50,100,200,300),5)
nodesize.results <- c()

for (nodesize.val in nodesize.vals) {
  print(nodesize.val)
  # train a random forest with nodesize = nodesize.val
  rf.current <- randomForest(cholesterol ~ gender + height + weight + ap_hi + ap_lo + gluc + smoke +
                               alco + active + cardio + real_age, data=train.data,
                             ntree = 200,
                             mtry=4,
                             nodesize=nodesize.val)
  # obtain predictions for the current model 
  # and "Balanced Accuracy" for those predictions
  rf.preds <- predict(rf.current, newdata=validation.data)
  cm <- confusionMatrix(rf.preds, validation.data$cholesterol)
  balanced.accuracy <- cm$byClass['Balanced Accuracy']
  nodesize.results <- c(nodesize.results, balanced.accuracy)
}
ggplot() + 
  geom_jitter(mapping = aes(x=nodesize.vals, y=nodesize.results), width=0.01) + 
  xlab("nodesize") + ylab("Balanced Accuracy") + 
  scale_x_log10()

# boxplot alternative
ggplot() + 
  geom_boxplot(mapping = aes(x=factor(nodesize.vals), y=nodesize.results)) + 
  xlab("nodesize") + ylab("Balanced Accuracy")

#different samp size
set.seed(12345)
sampsize.vals <- rep(c(10,20,50,100,200,300,400,500,668),2)
sampsize.results <- c()

for (sampsize.val in sampsize.vals) {
  print(sampsize.val)
  # train a random forest with sampsize = sampsize.val
  rf.current <- randomForest(cholesterol ~ gender + height + weight + ap_hi + ap_lo + gluc + smoke +
                               alco + active + cardio + real_age, data=train.data,
                             ntree = 200,
                             mtry=4,
                             sampsize=sampsize.val)
  
  # obtain predictions for the current model 
  # and "Balanced Accuracy" for those predictions
  rf.preds <- predict(rf.current, newdata=validation.data)
  cm <- confusionMatrix(rf.preds, validation.data$cholesterol)
  balanced.accuracy <- cm$byClass['Balanced Accuracy']
  sampsize.results <- c(sampsize.results, balanced.accuracy)
}
ggplot() + 
  geom_jitter(mapping = aes(x=sampsize.vals, y=sampsize.results), width=0.01) + 
  xlab("sampsize") + ylab("Balanced Accuracy") + 
  scale_x_log10()

#ntree 
ntree.vals <- rep(c(1,2,5,10,20,50,100,200,500,1000,2000,3000,5000,10000),2)
ntree.results <- c()

for (ntree.val in ntree.vals) {
  print(ntree.val)
  # train a random forest with ntree = ntree.val
  rf.current <- randomForest(cholesterol ~ gender + height + weight + ap_hi + ap_lo + gluc + smoke +
                               alco + active + cardio + real_age, data=train.data,
                             ntree = ntree.val,
                             mtry=4,
                             sampsize=300)
  
  # obtain predictions for the current model 
  # and "Balanced Accuracy" for those predictions
  rf.preds <- predict(rf.current, newdata=validation.data)
  cm <- confusionMatrix(rf.preds, validation.data$cholesterol)
  balanced.accuracy <- cm$byClass['Balanced Accuracy']
  ntree.results <- c(ntree.results, balanced.accuracy)
}
# plot the results
ggplot() + 
  geom_jitter(mapping = aes(x=ntree.vals, y=ntree.results), width=0.1, height=0) + 
  xlab("ntree") + ylab("Balanced Accuracy") + 
  scale_x_log10()
