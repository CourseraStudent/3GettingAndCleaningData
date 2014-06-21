3GettingAndCleaningData
=======================

How to install
--------------

1. Unpuck the [archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the "UCI HAR Dataset" folder
2. Put the run_analysis.R file next to the "UCI HAR Dataset" folder
3. Run run_analysis.R script

Required libraries
------------------
* reshape2

The run_analysis.R script does the following
-------------------------------------------------
1. Reads data files
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 
6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
7. Save cleared file
