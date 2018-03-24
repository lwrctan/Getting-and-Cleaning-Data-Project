# Getting-and-Cleaning-Data-Project

This project is an analysis of Human Activity Recognition database built from the recordings of 30 volunteers (subjects) performing
activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Data – Human Activity Recognition Using Smartphones Dataset Version 1.0. This data should be downloaded from the link below and extracted directly into the working directory used for this project. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

run_analysis.R – This R script 
1. read the X_, y_ and subject_ tables from working directory. 
2. merges the training, test and subject data sets to create one data set by using rbind and cbind and name it as 'mergedData'. The subject column is labeled 'Subject' and y column is labeled 'Activity', and the x columns are labeled with the descriptive variable names folloing the features.txt file. 
3. extracts only the measurements on the mean and standard deviation for each measurement by using the grepl function. 
4. get the descriptive activity names of the dataset from the activity_labels.txt file. 
5. calculates average of each variable for each activity and each subject.
6. create a second independent of the result from step 5 and save it as tidy.txt file.

CodeBook.md – Describe all the variables and summaries calculated, along with units, and any other relevant information.
