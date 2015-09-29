---
title: "Human Activity Recognition Using Smartphones Project Codebook"
author: "wr0ngc0degen"
output:
  html_document:
    keep_md: yes
---

## Human Activity Recognition Using Smartphones
This is a course project for Getting and Cleaning Data Coursera class.
It's about cleaning and transforming publically available data on Human Activity Recognition Using Smartphones
For raw data details go to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Study design and data processing

###Collection of the raw data
Raw Data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Notes on the original (raw) data 
All the details are in raw dataset

##Creating the tidy datafile

###Guide to create the tidy data file
1. to get tidy dataset we need to download the data using specified link
2. set working directory to the directory with the data (name is "UCI HAR Dataset")
3. run provided script run_analysis.R
4. resulting file is final_data_set.txt (it can be read back into R using 
>read.table("final_data_set.txt", header=TRUE)

###Cleaning of the data
see other details in [README.md] (README.md)

##Description of the variables in the final_data_set.txt file
General description of the file including:
 - resulting is data.frame of 180 objects of 68 variables
 - data represents the mean of every variable grouped by activity and subject. analysis was done only for mean and std of initial provided raw data observations
 - Variables present in the dataset: "activity" "subject_num" "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" "tBodyAcc-std()-X" "tBodyAcc-std()-Y" "tBodyAcc-std()-Z" "tGravityAcc-mean()-X" "tGravityAcc-mean()-Y" "tGravityAcc-mean()-Z" "tGravityAcc-std()-X" "tGravityAcc-std()-Y" "tGravityAcc-std()-Z" "tBodyAccJerk-mean()-X" "tBodyAccJerk-mean()-Y" "tBodyAccJerk-mean()-Z" "tBodyAccJerk-std()-X" "tBodyAccJerk-std()-Y" "tBodyAccJerk-std()-Z" "tBodyGyro-mean()-X" "tBodyGyro-mean()-Y" "tBodyGyro-mean()-Z" "tBodyGyro-std()-X" "tBodyGyro-std()-Y" "tBodyGyro-std()-Z" "tBodyGyroJerk-mean()-X" "tBodyGyroJerk-mean()-Y" "tBodyGyroJerk-mean()-Z" "tBodyGyroJerk-std()-X" "tBodyGyroJerk-std()-Y" "tBodyGyroJerk-std()-Z" "tBodyAccMag-mean()" "tBodyAccMag-std()" "tGravityAccMag-mean()" "tGravityAccMag-std()" "tBodyAccJerkMag-mean()" "tBodyAccJerkMag-std()" "tBodyGyroMag-mean()" "tBodyGyroMag-std()" "tBodyGyroJerkMag-mean()" "tBodyGyroJerkMag-std()" "fBodyAcc-mean()-X" "fBodyAcc-mean()-Y" "fBodyAcc-mean()-Z" "fBodyAcc-std()-X" "fBodyAcc-std()-Y" "fBodyAcc-std()-Z" "fBodyAccJerk-mean()-X" "fBodyAccJerk-mean()-Y" "fBodyAccJerk-mean()-Z" "fBodyAccJerk-std()-X" "fBodyAccJerk-std()-Y" "fBodyAccJerk-std()-Z" "fBodyGyro-mean()-X" "fBodyGyro-mean()-Y" "fBodyGyro-mean()-Z" "fBodyGyro-std()-X" "fBodyGyro-std()-Y" "fBodyGyro-std()-Z" "fBodyAccMag-mean()" "fBodyAccMag-std()" "fBodyBodyAccJerkMag-mean()" "fBodyBodyAccJerkMag-std()" "fBodyBodyGyroMag-mean()" "fBodyBodyGyroMag-std()" "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"

###activity
activity as described by activity_labels.txt
###subject_num
Each number identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

for description of other vars please refer to features_info.txt of initial raw data. the contains of current dataset is mean of every variable grouped by activity and subject
