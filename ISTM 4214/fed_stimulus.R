#Carla Tapia Assignment 1
#September 6, 2023

setwd("/Users/carlatapia/Desktop/ISTM 4214/Assignments/Assignment 1")

fed_stimulus <- read.csv("Use_of_ARRA_Stimulus_Funds.csv")
View(fed_stimulus)
head(fed_stimulus) #using head so it can appear in the Rmd file

#sum and mean of payment column
#adding na.rm=TRUE to exclude NA values in the column so the output will be a number
mean(fed_stimulus$Payment.Value, na.rm=TRUE)
sum(fed_stimulus$Payment.Value, na.rm=TRUE)

#creating subset of data 
#saving the subset into fed_stimulus_sub
fed_stimulus_sub <- subset(fed_stimulus, Project.Status == "Completed 50% or more")
View(fed_stimulus_sub)
head(fed_stimulus_sub) #using head so it can appear in the Rmd file 