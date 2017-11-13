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
        
8. activity_labels.txt -- This files contains the activity codes
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
    2. Here is the selected/ extracted colum list:
        1	tBodyAcc-mean()-X
        2	tBodyAcc-mean()-Y
        3	tBodyAcc-mean()-Z
        4	tBodyAcc-std()-X
        5	tBodyAcc-std()-Y
        6	tBodyAcc-std()-Z
        7	tGravityAcc-mean()-X
        8	tGravityAcc-mean()-Y
        9	tGravityAcc-mean()-Z
        10	tGravityAcc-std()-X
        11	tGravityAcc-std()-Y
        12	tGravityAcc-std()-Z
        13	tBodyAccJerk-mean()-X
        14	tBodyAccJerk-mean()-Y
        15	tBodyAccJerk-mean()-Z
        16	tBodyAccJerk-std()-X
        17	tBodyAccJerk-std()-Y
        18	tBodyAccJerk-std()-Z
        19	tBodyGyro-mean()-X
        20	tBodyGyro-mean()-Y
        21	tBodyGyro-mean()-Z
        22	tBodyGyro-std()-X
        23	tBodyGyro-std()-Y
        24	tBodyGyro-std()-Z
        25	tBodyGyroJerk-mean()-X
        26	tBodyGyroJerk-mean()-Y
        27	tBodyGyroJerk-mean()-Z
        28	tBodyGyroJerk-std()-X
        29	tBodyGyroJerk-std()-Y
        30	tBodyGyroJerk-std()-Z
        31	tBodyAccMag-mean()
        32	tBodyAccMag-std()
        33	tGravityAccMag-mean()
        34	tGravityAccMag-std()
        35	tBodyAccJerkMag-mean()
        36	tBodyAccJerkMag-std()
        37	tBodyGyroMag-mean()
        38	tBodyGyroMag-std()
        39	tBodyGyroJerkMag-mean()
        40	tBodyGyroJerkMag-std()
        41	fBodyAcc-mean()-X
        42	fBodyAcc-mean()-Y
        43	fBodyAcc-mean()-Z
        44	fBodyAcc-std()-X
        45	fBodyAcc-std()-Y
        46	fBodyAcc-std()-Z
        47	fBodyAccJerk-mean()-X
        48	fBodyAccJerk-mean()-Y
        49	fBodyAccJerk-mean()-Z
        50	fBodyAccJerk-std()-X
        51	fBodyAccJerk-std()-Y
        52	fBodyAccJerk-std()-Z
        53	fBodyGyro-mean()-X
        54	fBodyGyro-mean()-Y
        55	fBodyGyro-mean()-Z
        56	fBodyGyro-std()-X
        57	fBodyGyro-std()-Y
        58	fBodyGyro-std()-Z
        59	fBodyAccMag-mean()
        60	fBodyAccMag-std()
        61	fBodyBodyAccJerkMag-mean()
        62	fBodyBodyAccJerkMag-std()
        63	fBodyBodyGyroMag-mean()
        64	fBodyBodyGyroMag-std()
        65	fBodyBodyGyroJerkMag-mean()
        66	fBodyBodyGyroJerkMag-std()
        67	subject
        68	activity        

6. Convert activity codes to decriptive activities in the MergeInfo data frame
    - Activity codes:
        1. Walking
        2. Walking_upstairs
        3. Walking_downstairs
        4. Siting
        5. Standing
        6. Laying

7. Relable column names in the MergeInfo data frame with better descriptions
        1	timeBodyAccelerometer-mean()-X
        2	timeBodyAccelerometer-mean()-Y
        3	timeBodyAccelerometer-mean()-Z
        4	timeBodyAccelerometer-std()-X
        5	timeBodyAccelerometer-std()-Y
        6	timeBodyAccelerometer-std()-Z
        7	timeGravityAccelerometer-mean()-X
        8	timeGravityAccelerometer-mean()-Y
        9	timeGravityAccelerometer-mean()-Z
        10	timeGravityAccelerometer-std()-X
        11	timeGravityAccelerometer-std()-Y
        12	timeGravityAccelerometer-std()-Z
        13	timeBodyAccelerometerJerk-mean()-X
        14	timeBodyAccelerometerJerk-mean()-Y
        15	timeBodyAccelerometerJerk-mean()-Z
        16	timeBodyAccelerometerJerk-std()-X
        17	timeBodyAccelerometerJerk-std()-Y
        18	timeBodyAccelerometerJerk-std()-Z
        19	timeBodyGyroscope-mean()-X
        20	timeBodyGyroscope-mean()-Y
        21	timeBodyGyroscope-mean()-Z
        22	timeBodyGyroscope-std()-X
        23	timeBodyGyroscope-std()-Y
        24	timeBodyGyroscope-std()-Z
        25	timeBodyGyroscopeJerk-mean()-X
        26	timeBodyGyroscopeJerk-mean()-Y
        27	timeBodyGyroscopeJerk-mean()-Z
        28	timeBodyGyroscopeJerk-std()-X
        29	timeBodyGyroscopeJerk-std()-Y
        30	timeBodyGyroscopeJerk-std()-Z
        31	timeBodyAccelerometerMagnitude-mean()
        32	timeBodyAccelerometerMagnitude-std()
        33	timeGravityAccelerometerMagnitude-mean()
        34	timeGravityAccelerometerMagnitude-std()
        35	timeBodyAccelerometerJerkMagnitude-mean()
        36	timeBodyAccelerometerJerkMagnitude-std()
        37	timeBodyGyroscopeMagnitude-mean()
        38	timeBodyGyroscopeMagnitude-std()
        39	timeBodyGyroscopeJerkMagnitude-mean()
        40	timeBodyGyroscopeJerkMagnitude-std()
        41	frequencyBodyAccelerometer-mean()-X
        42	frequencyBodyAccelerometer-mean()-Y
        43	frequencyBodyAccelerometer-mean()-Z
        44	frequencyBodyAccelerometer-std()-X
        45	frequencyBodyAccelerometer-std()-Y
        46	frequencyBodyAccelerometer-std()-Z
        47	frequencyBodyAccelerometerJerk-mean()-X
        48	frequencyBodyAccelerometerJerk-mean()-Y
        49	frequencyBodyAccelerometerJerk-mean()-Z
        50	frequencyBodyAccelerometerJerk-std()-X
        51	frequencyBodyAccelerometerJerk-std()-Y
        52	frequencyBodyAccelerometerJerk-std()-Z
        53	frequencyBodyGyroscope-mean()-X
        54	frequencyBodyGyroscope-mean()-Y
        55	frequencyBodyGyroscope-mean()-Z
        56	frequencyBodyGyroscope-std()-X
        57	frequencyBodyGyroscope-std()-Y
        58	frequencyBodyGyroscope-std()-Z
        59	frequencyBodyAccelerometerMagnitude-mean()
        60	frequencyBodyAccelerometerMagnitude-std()
        61	frequencyBodyAccelerometerJerkMagnitude-mean()
        62	frequencyBodyAccelerometerJerkMagnitude-std()
        63	frequencyBodyGyroscopeMagnitude-mean()
        64	frequencyBodyGyroscopeMagnitude-std()
        65	frequencyBodyGyroscopeJerkMagnitude-mean()
        66	frequencyBodyGyroscopeJerkMagnitude-std()
        67	subject
        68	activity

8. Write the MergeInfo data frame to MergeInfo.CSV
9. Aggregate data from MergeInfo into the MergeInfo2 data frame with the average of all variables
10. Sort MergeInfo2 by Subject and Activity columns
11. Write the MergeInfo2 file to MergeInfoTidyData.csv


Output Files:
1. MergeInfo.CSV -- contains merged accelerometer information
2. MergeInfo2.CSV -- contains tidy accelerometer information
