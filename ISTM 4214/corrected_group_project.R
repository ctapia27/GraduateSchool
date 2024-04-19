library(tidyverse)
library(stats)

hotel <- read.csv("/Users/carlatapia/Desktop/ISTM 4214/Group Project/Robust regression discontinuity estimates of the causal effect of the TripAdvisor’s bubble rating on hotel popularity/data_rdd.csv")
View(hotel)

hotel_model <- hotel[,-1:-3]
View(hotel_model)

#### Linear Regression ####
# Looking at the models to see which variables are significant to use in the logistic regression model
# based on human logic 
model1 <- glm(class_4_5 ~ views + n_reviews + location_grade + 
                discount + discount_perc + price_curr_min + price_min +
                price_max + award_travellers_choice + award_greenleaders +
                award_cert_excellence + photos + amenities_Airport.transportation +
                amenities_Beach + amenities_amenity_free_internet_title_ad3 +
                amenities_Pool,data=hotel_model, family=binomial)
summary(model1)

model2 <- glm(class_4_5 ~ views + n_reviews + location_grade + discount +
                price_min + award_cert_excellence + award_travellers_choice +
                photos + amenities_Airport.transportation, data=hotel_model, family=binomial)
summary(model2)

model3 <- glm(class_4_5 ~ discount+
                price_min + price_max + award_cert_excellence +award_travellers_choice+
                amenities_Airport.transportation, data=hotel_model, family=binomial)
summary(model3)

# Using variables in model3 in logistic regression model

### Logistic Regression ###
table(hotel_model$class_4_5)

dim(hotel_model)
train.proportion <- 2/3
train.size <- nrow(hotel_model) * train.proportion
train.size
set.seed(12345)
train.idx <- sample(1:nrow(hotel_model),
                    train.size)
train.data <- hotel_model[train.idx,]
test.data <- hotel_model[-train.idx,]

table(train.data$class_4_5)
table(test.data$class_4_5)

full.glm <- glm(class_4_5 ~ discount+ 
                  price_min + price_max + award_cert_excellence +
                  amenities_Airport.transportation, data=train.data, family=binomial)
summary(full.glm)

train.data$class.prob.full.glm <- predict(full.glm, newdata = train.data,
                                           type="response")

test.data$class.prob.full.glm <- predict(full.glm, newdata = test.data,
                                          type="response")

test.data$class.pred.full.glm = ifelse(test.data$class.prob.full.glm > 0.5, "1", "0")
test.data$class.pred.full.glm <- as.factor(test.data$class.pred.full.glm)

table(test.data$class.pred.full.glm, test.data$class_4_5)

library(caret)
test.data$class_4_5 <- as.factor(test.data$class_4_5)
table(test.data$class_4_5)
table(test.data$class.pred.full.glm)
confusionMatrix(test.data$class.pred.full.glm, test.data$class_4_5)

#ROC and AUC curves
table(test.data$class.prob.full.glm)
library(plotROC)
ggplot(data=test.data,
       mapping = aes(m = class.prob.full.glm, d = class_4_5)) +
  geom_roc(n.cuts=9,labels=FALSE) + 
  style_roc(theme = theme_grey)

library(pROC)
roc.obj <- roc(response = test.data$class_4_5,
               predictor = test.data$class.prob.full.glm)
auc(roc.obj)
