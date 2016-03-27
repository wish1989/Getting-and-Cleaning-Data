# Getting-and-Cleaning-Data
There are three files:
 1. README.md explains the project.
 2. CodeBook.md describes the variables, the data, and transformations or work performed to clean up the data.
 3. run_analysis.R is the R script for the project.

In accordance with the requirement, the data is downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

After unzipping the zip file, there is a folder named "UCI HAR Dataset", all processes are done within this folder.

The R script in this repo called run_analysis.R does the following.
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set.
 4. Appropriately labels the data set with descriptive variable names.
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
