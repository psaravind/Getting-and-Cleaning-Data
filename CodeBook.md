# Introduction

The purpose of this repository is to demonstrate how to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

This repository will be graded by my peers in the "Coursera Getting and Cleaning Data" Sep 2014 class.

Along with this file this repository contains a R script "run_analysis.R" that takes the data from "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" and creates a tidy data set.

# Script run_analysis.R

This script does the following

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Source Data set

Data used for this project is from data collected from wearable computing device.  More details about the data is available at 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data for the project was obtained from: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# File and Variable Description

Data set in the zipped file has following

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Features are normalized and bounded between [-1, 1] and each veature vector is a row on the text file

# Data Cleansing and transformation
After downloading and unzipping the data set, the Train data containing 7352 observations and 561 variables was merged with test data containing 2947 observations and 561 variables.  The combined data set had total of 10299 observations with 561 variables.

Features label was cleansed my removing characters "-()" and to make the variable more easy to manipulate the variable names were transformed to lower characters.

This feature label was applied as column names to the merged data set.

Since we are only interested in measurements on the mean and standard deviation, the merged data set was filtered to variable names that had "mean" and "std" in the label, reducing the variables to 86. 

Activity Id's were replaced with activity labels for better reading.

Activity label and Subject data was merged to combined data set.

To create a tidy data set, aggregate function was used to calculate the mean of all variables by activity & subject.  This step produced a data set of 180 observations with 88 variables including activity and subject. 
