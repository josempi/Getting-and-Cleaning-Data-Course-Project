## Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:

[link]http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
[link]https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You will find a R script file called run_analysis.R that does the following: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names and creates a data file called MergeInfo.CSV.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject, and creates a CSV data file called MergeInfoTidyData.csv
     
The file CodeBook.md contains a description of the variables, example of the data (truncated), and the transformation steps taken to merge all of the data into on file.

Input Files:
1. test/Y_test.txt  -- This file contains accelerometer activity code info
2. train/Y_train.txt -- This file contains accelerometer activity code info
3. test/subject_test.txt  -- This file contains accelerometer subject/ user ID info
4. train/subject_train.txt -- This file contains accelerometer subject/ user ID info
5. test/X_test.txt -- This file contains accelerometer measurements/ observations info
6. train/subject_train.txt -- This file contains accelerometer measurements/ observations info

Output Files:
1. MergeInfo.CSV -- contains merged accelerometer information
2. MergeInfo2.CSV -- contains tidy accelerometer information

Script File:
1. run_analysis.R

Environment:
1. RStudio Version 1.0.153
2. OS - OSX El Capitan, V. 10.11.6

Code Book:
1. CodeBook.md --  contains a description of the variables, data and transformations performed

Processing Approach:
1. Download the data files using the above link
2. Load the required data files
3. Bind the Activity, Subject and Features (measurements) data
4. Name the Activity, Subject and Features columns with descriptive names
5. Extract only the columns with std() and mean() measurements/ observations
6. Convert activity codes to decriptive activities
7. Relable column names in the MergeInfo data frame with better descriptions
8. Write the MergeInfo data frame to MergeInfo.CSV
9. Aggregate data from MergeInfo into the MergeInfo2 data frame with the average of all variables
10. Sort MergeInfo2 by Subject and Activity columns
11. Write the MergeInfo2 file to MergeInfoTidyData.csv




1. test/subject_test.txt
2. train/subject_train.txt