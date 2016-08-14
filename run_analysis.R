## set working directory
##setwd("c3w4-project") ## NOT RUN
##list.files()          ## NOT RUN

## getting data
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

## merge to single dataset
## train set
names(xTrain) <- features[,2]           # set variable names
names(subjectTrain) <- "subject"        # set variable names
names(yTrain) <- "activity"             # set variable names
mergedTrain <- cbind(xTrain,subjectTrain,yTrain) 
names(mergedTrain)

## test set
names(xTest) <- features[,2]            # set variable names
names(subjectTest) <- "subject"         # set variable names
names(yTest) <- "activity"              # set variable names
mergedTest <- cbind(xTest,subjectTest,yTest) 
names(mergedTest)

## first data set
firstData <- rbind(mergedTrain,mergedTest)

## extract only mean and std for each measurement variables
meanElem <- names(firstData)[grep("mean()",names(firstData))]
stdElem <- names(firstData)[grep("std()",names(firstData))]
meanstdSub <- c(meanElem,stdElem,"subject","activity")
firstData <- firstData[,meanstdSub]

## function to replace activity name
updateActivityNames <- function(x){
        return(activityLabels[x,"V2"])
}

## naming activity descriptively
length(which(is.na(firstData$activity)))        # check if activity contain NA
firstData$activity <- sapply(firstData$activity,updateActivityNames)
length(which(is.na(firstData$activity)))        # check again if activity contain NA

## data set with average of variables
library(dplyr)
groupedData <- group_by(firstData,activity,subject)
summaryData <- summarize_each(groupedData,funs(mean))

## writing to txt
write.table(summaryData,"tidyData.txt",row.names=FALSE)