#Carla Tapia
#September 24, 2023
#Assignment 2
setwd("/Users/carlatapia/Desktop/ISTM 4214/Assignments/Assignment 2")

#installing necessary packages and running them
install.packages("matrixStats")
install.packages("modeest")
library(matrixStats) 
library(modeest)
library(psych)

#viewing the attitude dataset
View(attitude)
dim(attitude)

#Computing Mean of all the variables at once using colMeans 
colMeans(attitude)

#Computing Median of all variables at once 
colMedians(as.matrix(attitude))

#Computing Mode of all variables 
mfv(attitude$rating)
mfv(attitude$complaints)
mfv(attitude$privileges)
mfv(attitude$learning)
mfv(attitude$raises)
mfv(attitude$critical)
mfv(attitude$advance)

#Computing max of all variables at once, transforming the dataset to be read as a matrix to be able to run
colMaxs(as.matrix(attitude))

#Computing min the same way as max was computed
colMins(as.matrix(attitude))

#Computing range of all varaibles at once using the same as.matrix function
colRanges(as.matrix(attitude))

#Computing quantiles of all variables at once
colQuantiles(as.matrix(attitude))

#Computing IQRs
colIQRs(as.matrix(attitude))

#Computing Variance
colVars(as.matrix(attitude))

#Compute Standard Deviation
colSds(as.matrix(attitude))

#Computing correlation
cor(attitude)

#Ensuring all calculations computed above are correct using summary and describe function
summary(attitude)
describe(attitude)

#Making Linear Regression Models

#plotting attitude data set to see the correlation matrix 
plot(attitude)

#creating the first linear regression model to include all variables in the data set
model1 <- lm(rating ~ .,attitude)
summary(model1)
#Analysis of Model1:
#based on model1, the R-sq is 0.7326 meaning that model1 can explain 73.26% of the data
#because of the R-sq being 73.26%, our model1 explanation power is quite high and is valid/meaningful

#for individual IVs:
#complaints = as one unit of complaints increases, the rating increases by 0.61319 units
            # t-value is high compared to all the variables being 3.809 and the p-value is quite small, being 0.000903 < 0.001
            # based on the t-value and p-value of complaints, it is statistically significant

#privileges = as one unit of privileges increases, the rating decreases by 0.07305 units
            # t-value is very low compared to all the variables being -0.538 and the p-value is high, being 0.595594 > 0.001 ,0.01, 0.5, and 0.1
            # based on the t-value and p-value of privileges, it is not statistically significant

#learning = as one unit of learning increases, the rating increases by 0.32033 units
          # t-value is the second highest compared to all the variables being 1.901 and the p-value is lower, being 0.069925 <  0.1
          # based on the t-value and p-value of learning, it is statistically significant

#raises = as one unit of raises increases, the rating increases by 0.08173 units
        # t-value is low compared to all the variables being 0.369 and the p-value is high, being 0.715480 > 0.001 ,0.01, 0.5, and 0.1
        # based on the t-value and p-value of raises, it is not statistically significant

#critical = as one unit of critical increases, the rating increases by 0.03838 units
          # t-value is very low compared to all the variables being 0.261 and the p-value is high, being 0.796334 > 0.001, 0.01, 0.5, and 0.1
          # based on the t-value and p-value of critical, it is not statistically significant

#advance = as one unit of advance increases, the rating decreases by 0.21706 units
          # t-value is the lowest compared to all the variables being -1.218 and the p-value is high, being 0.235577 > 0.001, 0.01, 0.5, and 0.1
          # based on the t-value and p-value of advance, it is not statistically significant

#based on the analysis of the independent variables, I will create a second model that only includes the statistically significant variables, complaints and learning

#Creating model2
model2 <- lm(rating ~ complaints + learning, attitude)
summary(model2)
#Analysis of Model2
#based on model2, the R-sq is 0.708 meaning that model2 can explain 70.8% of the data, though it decreased slightly from model1, it did not decrease significantly and 
  # and the model maximizes the number of independent variables (using 2 variables instead of 6) while maximizing model fit
#because of the R-sq being 70.8%, our model2 explanation power is quite high and is valid/meaningful

#for individual IVs:
#complaints = as one unit of complaints increases, the rating increases by 0.6435 units
            # t-value is high compared to all the variables being 5.432 and the p-value is very small, being 9.57e-06 < 0.001
            # based on the t-value and p-value of complaints, it is statistically significant

#learning = as one unit of learning increases, the rating increases by 0.2112 units
          # t-value is the low compared to complaints being 1.571 and the p-value is high, being 0.128 >  0.001, 0.01, 0.05, and 0.1
          # based on the t-value and p-value of learning, it is not statistically significant

#based on the analysis of model2, I could create a model using only complaints as the variable 

#Creating model3
model3 <- lm(rating ~ complaints, attitude)
summary(model3)
#Analysis of Model3
#based on model3, the R-sq is 0.6813 meaning that model1 can explain 68.13% of the data
#because of the R-sq decreasing from model2 and model1, I would not use this model as it did not maximize the model fit and has a lower R-sq

#After creating multiple models, I would use Model2 for linear regression as it maximizes the number independent variables 
  # while maximizing model fit

#Using stepwise backwards to see which variables the model would choose
step.lm.back <- step(model1, direction = "backward")
summary(step.lm.back)
#The stepwise backwards model came up with the same model as my model2, using complaints and learning as the independent variables for the model
