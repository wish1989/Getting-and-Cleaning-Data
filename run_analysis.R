run_analysis <- function(){

## Load package "dplyr"
library(dplyr)
options(width=105)
## Load and merge the training and the test sets 
## to create one data set as "alldata".
train <- read.csv("train\\X_train.txt",header = FALSE, sep = "")
test <- read.csv("test\\X_test.txt",header = FALSE, sep = "")
alldata <- rbind(train,test)

## Extracts only the measurements on the mean 
## and standard deviation for each measurement to be "mean_std".
features <- read.csv("features.txt",header = FALSE, sep = "")
features <- features[,2]
featurelog <- grep("mean|std",features)
mean_std <- alldata[,featurelog]

##Appropriately labels the data set with descriptive variable names.
colnames(mean_std) <- features[featurelog]

## Uses descriptive activity names to name the activities 
## as column "activity" in the data set
testlabel <- read.csv("test\\y_test.txt",header = FALSE, sep = "")
trainlabel <- read.csv("train\\y_train.txt",header = FALSE, sep = "")
actlabel <- read.csv("activity_labels.txt",header = FALSE, sep = "")
actlabel <- actlabel[,2]
alllabel <- rbind(trainlabel,testlabel)
mean_std <- mutate(mean_std,activity=actlabel[alllabel[,1]])

## Creates a second, independent tidy data set as "tb2"
## with the average of each variable for each activity and each subject.
testsubj <- read.csv("test\\subject_test.txt",header = FALSE, sep = "")
trainsubj <- read.csv("train\\subject_train.txt",header = FALSE, sep = "")
subjectdata <- rbind(trainsubj,testsubj)
mean_std <- mutate(mean_std,subject=subjectdata[,1])

arrangeddt <- arrange(mean_std,subject,activity)

m=ncol(arrangeddt);
tb2 <- matrix(nrow = length(actlabel)*30, ncol=m)
names(tb2) <- names(arrangeddt)
namelist <- names(arrangeddt)
colnames(tb2) <- namelist

k=1;
for(i in 1:30){
	for(j in actlabel){
		subtb <- arrangeddt[(arrangeddt$subject==i)&(arrangeddt$activity==j),1:(m-2)]
		tb2[k,1:(m-2)] <- colMeans(subtb)
		tb2[k,m-1] <- j
		tb2[k,m] <- i
		k=k+1
	}

}

tb2 <- tb2[,c(m,(m-1),(1:(m-2)))]
tb2
}