Coursera Getting and Cleaning Data - Sep 2014
=============================================

The purpose of this repository is to demonstrate how to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This repository will be graded by my peers in the "Coursera Getting and Cleaning Data" Sep 2014 class.

This repository has 3 files:

# README.md this file

# run_analysis.R

R script "run_analysis.R" that takes the data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and creates a tidy data set.

This script does the following

1. Downlod and unzip the input file
2. Merges the training and the test sets to create one data set
3. Extracts only the measurements on the mean and standard deviation for each measurement
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# CodeBook.md

Codebook that provides the details on the data set files and the variables used to compute the summaries.  This file also details the data cleansing and manipulation process for creating the tidy data.
