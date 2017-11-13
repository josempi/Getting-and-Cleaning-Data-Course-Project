######################################################################
##                                                                  ##
## This is the Cleaning and Getting Data Course Project R script    ##
##                                                                  ##
## Author: Jose M. Pi                                               ##
## Date: 11/10/2017                                                 ##
## Version 1.0                                                      ##
##                                                                  ##
######################################################################


##############################
##  SETUP WORKING DIRECTORY ##
##############################
setwd("~/Documents/Data Science/Getting and Cleaning Data/Week 4/Project")
## Create the subdirectory "data" if not already found.
if(!file.exists("./data")){dir.create("./data")}

######################
##  LOAD LIBRARY    ##
######################

##plyr library
library(plyr)


##############################
##  FILE RETRIEVAL SECTION  ##
##############################
## Get the zip file for the project.
## Assign the file link/ location to fileUrl.
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## Download the file
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

## Unzip the file contents into the data subdirectory.
unzip(zipfile="./data/Dataset.zip",exdir="./data")
## Set files path to reach all subdirectories.
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)


##############################
##  DATA LOADING SECTION    ##
##############################

## ACTIVITY DATA ##
## Load the data files for Activity info from the Y_test and Y_train.txt files in the respective     
## Activity data frames (ActivityTest and ActivityTrain).   
## These data frames will contain the activity codes from the accelerometer files - here is the activity code list:
## 1. Walking
## 2. Walking-upstairs
## 3. Walking_downstatirs
## 4. Siting
## 5. Standing
## 6. Laying.
ActivityTest <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
## ActivityTest data frame contains 2,957 rows and 1 column.
ActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
## ActivityTrain data frame contains 7,352 rows and 1 column.

## SUBJECT DATA ##
## These data frames will contain the subject/ user number from the accelerometer files.
## Load the data files for Subject info from the subject_test and subject_train.txt files in the respective 
## Subject data frames (SubjectTest and SubjectTrain).  
SubjectTest <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
## SubjectTest data frame contains 2,957 rows and 1 column.
SubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
## SubjectTrain data frame contains 7,352 rows and 1 column.

## OBSERVATIONS/ MEASUREMENTS ##
## These data frames will contain the observations from the accelerometer files.
## Load the data files for Features info from the x_test and x_train.txt files in the respective
## Feature data frames (FeaturesTest and FeaturesTrain).
FeaturesTest <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
## FeaturesTest data frame contains 2,957 rows and 561 columns.
FeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)
## FeaturesTrain data frame contains 7,352 rows and 561 columns.


##########################
##  DATA MERGE SECTION  ##
##########################
## Prepare the data frames with descriptive coumn names, then merge the data.

## Bind the Activity data frame sets into the Activity data frame.
## The Activity data frame contrains all Activity data from ActivtyTrain and ActivityTest data frames.
Activity <- rbind(ActivityTrain, ActivityTest)
## The Activity data frame contrains 10,299 rows and 1 column.

## Bind the Subject data frame sets into the Subject data frame.
## The Subject data frame contrains all Subject data from SubjectTrain and SubjectTest data frames.
Subject <- rbind(SubjectTrain, SubjectTest)
## The Subject data frame contrains 10,299 rows and 1 column.

## Bind the Features data frame sets into the Festures data frame.
## The Features data frame contrains all the observations data from FeaturesTrain and FeaturesTest data frames.
Features <- rbind(FeaturesTrain, FeaturesTest)
## The Features data frame contrains 10,299 rows and 561 columns.

##  SET COLUMN NAMES  
## Set column name for Subject data frame
names(Subject)<-c("subject")

## Set column name for Activity data frame
names(Activity)<- c("activity")

## Set column name for Features data frame from features.txt
FeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
## The FeaturesNames data frame contrains 561 rows and 2 columns.

## Name the columns in the Features data frame based on the FeatureNames 2nd column, which contains the column names.
names(Features)<- FeaturesNames$V2

##  MERGE ALL DATA 
## Bind the Subject and Activity data frames into MergeSubjectActivity data frame.
MergeSubjectActivity <- cbind(Subject, Activity)
## This bind yields the MergeSubjectActivity data frame with 10,299 rows and 2 columns (subject and activity columns).

## Bind the Features and MergeSubjectActivity data frames into MergeInfo data frame.
MergeInfo <- cbind(Features, MergeSubjectActivity)
## This bind yields the MergeInfo data frame with 10,299 rows and 563 columns (adds the Subject and Activity columns to the MergInfo data set).


##########################################
##  EXTRACT OBSERVATIONS/ MEASUREMENTS  ##
##########################################

## Create a factor list of only the column names that match "mean()" and std()" from MergeInfo.
subsetFeaturesNames <- FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", FeaturesNames$V2)]

## Add "subject" and "activity" column names to the subsetNames factor list.
subsetNames <-c(as.character(subsetFeaturesNames), "subject", "activity" )

## Subset the data into MergeInfo based on the Select statement column names in subsetNames
## which contain columns with the std() and mean() observations, with activity and subject data.
MergeInfo <-subset(MergeInfo,select=subsetNames) 
## MergeInfo subset is created yielding 10,299 rows and 68 columns (selected columns from subsetNames).


################################################################
##  GIVE DESCRIPTIVE ACTIVITY AND COLUMN NAMES TO DATA SET    ##
################################################################

## Load the activity names from activity_lables.txt file.
activityNames <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)

## Factorize the activity column in MergeInfo - converts the activity code number to an activity description.
MergeInfo$activity<- factor(MergeInfo$activity,labels=as.character(activityNames$V2))

## Give descriptive lables to the MergeInfo data frame.
names(MergeInfo)<-gsub("^t", "time", names(MergeInfo))
names(MergeInfo)<-gsub("^f", "frequency", names(MergeInfo))
names(MergeInfo)<-gsub("Acc", "Accelerometer", names(MergeInfo))
names(MergeInfo)<-gsub("Gyro", "Gyroscope", names(MergeInfo))
names(MergeInfo)<-gsub("Mag", "Magnitude", names(MergeInfo))
names(MergeInfo)<-gsub("BodyBody", "Body", names(MergeInfo))


################################################
## Write MergeInfo to the MergeInfo.csv file  ##
################################################

# Write the MergeInfo to a CSV file.
write.table(MergeInfo, file = "MergeInfo.csv",row.name=FALSE, sep = ",")


######################################
##  CREATE SECOND TIDY DATA SET     ##
######################################

## Average each accelerometer variable for each activity and each subject/ user.
MergeInfo2 <-aggregate(. ~subject + activity, MergeInfo, mean)
## Creates a tidy set of 180 rows and 68 columns

## Order in ascending fashion the data data set by the subject column first and activity column second.
MergeInfo2 <-MergeInfo2[order(MergeInfo2$subject,MergeInfo2$activity),]

## Write MergeInfo2 to a text file.
write.table(MergeInfo2, file = "MergeInfoTidyData.txt",row.name=FALSE)



