# set working directory to location where dataset is stored

setwd("C:/Users/lwrctan/Desktop/Coursera/Month3Week4/Project")

## STEP 1: Merges the training and the test sets to create one data set

# read tables and merge training and test files of X, y and Subject 

X_train <- read.table("X_train.txt")
X_test <- read.table("X_test.txt")
X_merged <- rbind(X_train, X_test)

y_train <- read.table("y_train.txt")
y_test <- read.table("y_test.txt")
y_merged <- rbind(y_train, y_test)

subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
subject_merged <- rbind(subject_train, subject_test)

mergedData <- cbind(subject_merged, y_merged, X_merged)

## STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.

# add column name 

features <- read.table("features.txt")

names(mergedData) <- c("Subject", "Activity", as.character(features$V2))

# find column names with "mean()" or "std()"
colmeanstd <- grepl("mean\\(\\)", names(mergedData)) | grepl("std\\(\\)", names(mergedData))

# remove FALSE columns
mergedData <- mergedData[, colmeanstd]

# add back first two columns

names(subject_merged) <- "Subject"
names(y_merged) <- "Activity"

mergedData <- cbind(subject_merged, y_merged, mergedData)

## STEP 3: Uses descriptive activity names to name the activities in the data set.

# Use activity names in 'activity_labels.txt'

ActivityNames <- c("WALKING", "WALKING UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

## STEP 4: Appropriately labels the data set with descriptive activity names. 

# replace activity names as per 'activity_labels.txt'

mergedData$Activity <- ActivityNames[mergedData$Activity]

## STEP 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# create the tidy data set

library(plyr)

tidy <- ddply(.data = mergedData, .variables = c("Subject", "Activity"), .fun = numcolwise(mean))

# write the tidy data set to a file
write.table(tidy, "tidy.txt", row.names=FALSE)

