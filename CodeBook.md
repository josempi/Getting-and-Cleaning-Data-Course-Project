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
    
        -	tBodyAcc-mean()-X: Number - measurement
        -	tBodyAcc-mean()-Y: Number - measurement
        -	tBodyAcc-mean()-Z: Number - measurement
        -	tBodyAcc-std()-X: Number - measurement
        -	tBodyAcc-std()-Y: Number - measurement
        -	tBodyAcc-std()-Z: Number - measurement
        -	tGravityAcc-mean()-X: Number - measurement
        -	tGravityAcc-mean()-Y: Number - measurement
        -	tGravityAcc-mean()-Z: Number - measurement
        -	tGravityAcc-std()-X: Number - measurement
        -	tGravityAcc-std()-Y: Number - measurement
        -	tGravityAcc-std()-Z: Number - measurement
        -	tBodyAccJerk-mean()-X: Number - measurement
        -	tBodyAccJerk-mean()-Y: Number - measurement
        -	tBodyAccJerk-mean()-Z: Number - measurement
        -	tBodyAccJerk-std()-X: Number - measurement
        -	tBodyAccJerk-std()-Y: Number - measurement
        -	tBodyAccJerk-std()-Z: Number - measurement
        -	tBodyGyro-mean()-X: Number - measurement
        -	tBodyGyro-mean()-Y: Number - measurement
        -	tBodyGyro-mean()-Z: Number - measurement
        -	tBodyGyro-std()-X: Number - measurement
        -	tBodyGyro-std()-Y: Number - measurement
        -	tBodyGyro-std()-Z: Number - measurement
        -	tBodyGyroJerk-mean()-X: Number - measurement
        -	tBodyGyroJerk-mean()-Y: Number - measurement
        -	tBodyGyroJerk-mean()-Z: Number - measurement
        -	tBodyGyroJerk-std()-X: Number - measurement
        -	tBodyGyroJerk-std()-Y: Number - measurement
        -	tBodyGyroJerk-std()-Z: Number - measurement
        -	tBodyAccMag-mean(): Number - measurement
        -	tBodyAccMag-std(): Number - measurement
        -	tGravityAccMag-mean(): Number - measurement
        -	tGravityAccMag-std(): Number - measurement
        -	tBodyAccJerkMag-mean(): Number - measurement
        -	tBodyAccJerkMag-std(): Number - measurement
        -	tBodyGyroMag-mean(): Number - measurement
        -	tBodyGyroMag-std(): Number - measurement
        -	tBodyGyroJerkMag-mean(): Number - measurement
        -	tBodyGyroJerkMag-std(): Number - measurement
        -	fBodyAcc-mean()-X: Number - measurement
        -	fBodyAcc-mean()-Y: Number - measurement
        -	fBodyAcc-mean()-Z: Number - measurement
        -	fBodyAcc-std()-X: Number - measurement
        -	fBodyAcc-std()-Y: Number - measurement
        -	fBodyAcc-std()-Z: Number - measurement
        -	fBodyAccJerk-mean()-X: Number - measurement
        -	fBodyAccJerk-mean()-Y: Number - measurement
        -	fBodyAccJerk-mean()-Z: Number - measurement
        -	fBodyAccJerk-std()-X: Number - measurement
        -	fBodyAccJerk-std()-Y: Number - measurement
        -	fBodyAccJerk-std()-Z: Number - measurement
        -	fBodyGyro-mean()-X: Number - measurement
        -	fBodyGyro-mean()-Y: Number - measurement
        -	fBodyGyro-mean()-Z: Number - measurement
        -	fBodyGyro-std()-X: Number - measurement
        -	fBodyGyro-std()-Y: Number - measurement
        -	fBodyGyro-std()-Z: Number - measurement
        -	fBodyAccMag-mean(): Number - measurement
        -	fBodyAccMag-std(): Number - measurement
        -	fBodyBodyAccJerkMag-mean(): Number - measurement
        -	fBodyBodyAccJerkMag-std(): Number - measurement
        -	fBodyBodyGyroMag-mean(): Number - measurement
        -	fBodyBodyGyroMag-std(): Number - measurement
        -	fBodyBodyGyroJerkMag-mean(): Number - measurement
        -	fBodyBodyGyroJerkMag-std(): Number - measurement
        -	subject: Number - measurement
        -	activity: Number - measurement

6. Convert activity codes to decriptive activities in the MergeInfo data frame
    - Activity description and codes:
        1. Walking = 1
        2. Walking_upstairs = 2
        3. Walking_downstairs = 3
        4. Siting = 4
        5. Standing = 5
        6. Laying = 6

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

8. Write the MergeInfo data frame to MergeInfo.csv
9. Aggregate data from MergeInfo into the MergeInfo2 data frame with the average of all variables
10. Sort MergeInfo2 by Subject and Activity columns
11. Write the MergeInfo2 file to a text file called MergeInfoTidyData.txt


Output Files:
1. MergeInfo.csv -- contains merged accelerometer information
2. MergeInfo2.txt -- contains tidy accelerometer information
