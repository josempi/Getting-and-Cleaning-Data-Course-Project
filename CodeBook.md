## Getting and Cleaning Data Course Project
## CodeBook.md

Data Location:
1. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Script File:
1. run_analysis.R

Environment:
1. RStudio Version 1.0.153
2. OS - OSX El Capitan, V. 10.11.6

Input Files:
1. test/Y_test.txt  -- This file contains accelerometer activity code info
    - 1 column, 2,947 rows
        1. V1 - Column contains the accelerometer activity code
    - Activity codes:
        1. Walking
        2. Walking_upstairs
        3. Walking_downstairs
        4. Siting
        5. Standing
        6. Laying

2. train/Y_train.txt -- This file contains accelerometer activity code info
    - 1 column, 7,352 rows
        1. V1 - Column contains the accelerometer activity code
    - Activity codes:
        1. Walking
        2. Walking_upstairs
        3. Walking_downstairs
        4. Siting
        5. Standing
        6. Laying

3. test/subject_test.txt  -- This file contains accelerometer subject/ user ID info
    - 1 column, 2,947 rows
        1. V1 - Column contains the accelerometer subject ID code

4. train/subject_train.txt -- This file contains accelerometer subject/ user ID info
    - 1 column, 7,352 rows
        1. V1 - Column contains the accelerometer subject ID code

5. test/X_test.txt -- This file contains accelerometer measurements/ observations info
    - 561 columns, 2,947 rows
        1. V1 to V561 - Columns contains the accelerometer measurements

6. train/subject_train.txt -- This file contains accelerometer measurements/ observations info
    - 561 columns, 7,352 rows
        1. V1 to V561 - Columns contains the accelerometer measurements
    
7. features.txt -- This file contains the accelerometer column names
    - 2 columns, 561 rows
        1. V1 - Feature Code
        2. V2 - Feature Name
        
8. activity_labels.txt -- This files contains the activity codes and descriptions
    - 2 columns, 6 rows
        1. V1 - Activity Code
        2. V2 - Activity Name

Processing Approach:
1. Download the data files using the above link
2. Load the required data files
    1. ActivityTest will load the Y_test.txt data
    1. ActivityTrain will load the Y_train.txt data
    1. SubjectTest will load the subject_test.txt data
    1. SubjectTrain will load the subject_train.txt data
    1. FeaturesTest will load the x_test.txt data
    1. FeaturesTrain will load the x_train.txt data
        
3. Bind the Activity, Subject and Features (measurements) data
    1. Bind the ActivityTest and ActivityTrain into the Activity data frame
    - 1 column, 10,299 rows
        1. V1 - Column contains the accelerometer activity code
    - Activity codes:
        1. Walking
        2. Walking_upstairs
        3. Walking_downstairs
        4. Siting
        5. Standing
        6. Laying
        
    2. Bind the SubjectTest and SubjectTrain into the Subject data frame
     - 1 column, 10,299 rows
        1. V1 - Column contains the accelerometer subject ID code
     
    3. Bind the FeaturesTest and the FeaturesTrain into the Features data frame
    - 561 columns, 10,299 rows
        1. V1 to V561 - Columns contains the accelerometer measurements

4. Name the Activity, Subject and Features columns with descriptive names
    1. Use the features.txt file to lable the column names for the Features data frame
        - Columns too numerous to list
    2. Label the Subject data frame V1 column to subject
    3. Label the Activity data frames V1 column to activity
    
5. Merge all data into the MergeInfo data frame
    1. Bind the Features (measurements), subject and activity data frames into MergeInfo
    
6. Extract only the columns with std() and mean() measurements/ observations
    1. Compacts the MergeInfo data frame to 68 columns
    2. Here is the selected/ extracted column list:
    
        -	tBodyAcc-mean()-X
        -	tBodyAcc-mean()-Y
        -	tBodyAcc-mean()-Z
        -	tBodyAcc-std()-X
        -	tBodyAcc-std()-Y
        -	tBodyAcc-std()-Z
        -	tGravityAcc-mean()-X
        -	tGravityAcc-mean()-Y
        -	tGravityAcc-mean()-Z
        -	tGravityAcc-std()-X
        -	tGravityAcc-std()-Y
        -	tGravityAcc-std()-Z
        -	tBodyAccJerk-mean()-X
        -	tBodyAccJerk-mean()-Y
        -	tBodyAccJerk-mean()-Z
        -	tBodyAccJerk-std()-X
        -	tBodyAccJerk-std()-Y
        -	tBodyAccJerk-std()-Z
        -	tBodyGyro-mean()-X
        -	tBodyGyro-mean()-Y
        -	tBodyGyro-mean()-Z
        -	tBodyGyro-std()-X
        -	tBodyGyro-std()-Y
        -	tBodyGyro-std()-Z
        -	tBodyGyroJerk-mean()-X
        -	tBodyGyroJerk-mean()-Y
        -	tBodyGyroJerk-mean()-Z
        -	tBodyGyroJerk-std()-X
        -	tBodyGyroJerk-std()-Y
        -	tBodyGyroJerk-std()-Z
        -	tBodyAccMag-mean()
        -	tBodyAccMag-std()
        -	tGravityAccMag-mean()
        -	tGravityAccMag-std()
        -	tBodyAccJerkMag-mean()
        -	tBodyAccJerkMag-std()
        -	tBodyGyroMag-mean()
        -	tBodyGyroMag-std()
        -	tBodyGyroJerkMag-mean()
        -	tBodyGyroJerkMag-std()
        -	fBodyAcc-mean()-X
        -	fBodyAcc-mean()-Y
        -	fBodyAcc-mean()-Z
        -	fBodyAcc-std()-X
        -	fBodyAcc-std()-Y
        -	fBodyAcc-std()-Z
        -	fBodyAccJerk-mean()-X
        -	fBodyAccJerk-mean()-Y
        -	fBodyAccJerk-mean()-Z
        -	fBodyAccJerk-std()-X
        -	fBodyAccJerk-std()-Y
        -	fBodyAccJerk-std()-Z
        -	fBodyGyro-mean()-X
        -	fBodyGyro-mean()-Y
        -	fBodyGyro-mean()-Z
        -	fBodyGyro-std()-X
        -	fBodyGyro-std()-Y
        -	fBodyGyro-std()-Z
        -	fBodyAccMag-mean()
        -	fBodyAccMag-std()
        -	fBodyBodyAccJerkMag-mean()
        -	fBodyBodyAccJerkMag-std()
        -	fBodyBodyGyroMag-mean()
        -	fBodyBodyGyroMag-std()
        -	fBodyBodyGyroJerkMag-mean()
        -	fBodyBodyGyroJerkMag-std()
        -	subject
        -	activity

6. Convert activity codes to decriptive activities in the MergeInfo data frame
    - Activity codes:
        1. Walking
        2. Walking_upstairs
        3. Walking_downstairs
        4. Siting
        5. Standing
        6. Laying

7. Relable column names in the MergeInfo data frame with better descriptions
    1. Here is a list of the more descriptive column names:

        -	timeBodyAccelerometer-mean()-X
        -	timeBodyAccelerometer-mean()-Y
        -	timeBodyAccelerometer-mean()-Z
        -	timeBodyAccelerometer-std()-X
        -	timeBodyAccelerometer-std()-Y
        -	timeBodyAccelerometer-std()-Z
        -	timeGravityAccelerometer-mean()-X
        -	timeGravityAccelerometer-mean()-Y
        -	timeGravityAccelerometer-mean()-Z
        -	timeGravityAccelerometer-std()-X
        -	timeGravityAccelerometer-std()-Y
        -	timeGravityAccelerometer-std()-Z
        -	timeBodyAccelerometerJerk-mean()-X
        -	timeBodyAccelerometerJerk-mean()-Y
        -	timeBodyAccelerometerJerk-mean()-Z
        -	timeBodyAccelerometerJerk-std()-X
        -	timeBodyAccelerometerJerk-std()-Y
        -	timeBodyAccelerometerJerk-std()-Z
        -	timeBodyGyroscope-mean()-X
        -	timeBodyGyroscope-mean()-Y
        -	timeBodyGyroscope-mean()-Z
        -	timeBodyGyroscope-std()-X
        -	timeBodyGyroscope-std()-Y
        -	timeBodyGyroscope-std()-Z
        -	timeBodyGyroscopeJerk-mean()-X
        -	timeBodyGyroscopeJerk-mean()-Y
        -	timeBodyGyroscopeJerk-mean()-Z
        -	timeBodyGyroscopeJerk-std()-X
        -	timeBodyGyroscopeJerk-std()-Y
        -	timeBodyGyroscopeJerk-std()-Z
        -	timeBodyAccelerometerMagnitude-mean()
        -	timeBodyAccelerometerMagnitude-std()
        -	timeGravityAccelerometerMagnitude-mean()
        -	timeGravityAccelerometerMagnitude-std()
        -	timeBodyAccelerometerJerkMagnitude-mean()
        -	timeBodyAccelerometerJerkMagnitude-std()
        -	timeBodyGyroscopeMagnitude-mean()
        -	timeBodyGyroscopeMagnitude-std()
        -	timeBodyGyroscopeJerkMagnitude-mean()
        -	timeBodyGyroscopeJerkMagnitude-std()
        -	frequencyBodyAccelerometer-mean()-X
        -	frequencyBodyAccelerometer-mean()-Y
        -	frequencyBodyAccelerometer-mean()-Z
        -	frequencyBodyAccelerometer-std()-X
        -	frequencyBodyAccelerometer-std()-Y
        -	frequencyBodyAccelerometer-std()-Z
        -	frequencyBodyAccelerometerJerk-mean()-X
        -	frequencyBodyAccelerometerJerk-mean()-Y
        -	frequencyBodyAccelerometerJerk-mean()-Z
        -	frequencyBodyAccelerometerJerk-std()-X
        -	frequencyBodyAccelerometerJerk-std()-Y
        -	frequencyBodyAccelerometerJerk-std()-Z
        -	frequencyBodyGyroscope-mean()-X
        -	frequencyBodyGyroscope-mean()-Y
        -	frequencyBodyGyroscope-mean()-Z
        -	frequencyBodyGyroscope-std()-X
        -	frequencyBodyGyroscope-std()-Y
        -	frequencyBodyGyroscope-std()-Z
        -	frequencyBodyAccelerometerMagnitude-mean()
        -	frequencyBodyAccelerometerMagnitude-std()
        -	frequencyBodyAccelerometerJerkMagnitude-mean()
        -	frequencyBodyAccelerometerJerkMagnitude-std()
        -	frequencyBodyGyroscopeMagnitude-mean()
        -	frequencyBodyGyroscopeMagnitude-std()
        -	frequencyBodyGyroscopeJerkMagnitude-mean()
        -	frequencyBodyGyroscopeJerkMagnitude-std()
        -	subject
        -	activity

8. Write the MergeInfo data frame to MergeInfo.CSV
9. Aggregate data from MergeInfo into the MergeInfo2 data frame with the average of all variables
10. Sort MergeInfo2 by Subject and Activity columns
11. Write the MergeInfo2 file to MergeInfoTidyData.csv


Output Files:
1. MergeInfo.CSV -- contains merged accelerometer information
2. MergeInfo2.CSV -- contains tidy accelerometer information
