## Task page: https://class.coursera.org/getdata-004/human_grading/view/courses/972137/assessments/3/submissions
## FAQ:       https://class.coursera.org/getdata-004/forum/thread?thread_id=106

## features           2x561
## X     	            561x10299
## Y                	  1x10299
## subject          	  1x10299

## featureMeanAndStd  2x46

setwd("d:/R/3GettingAndCleaningData/CourseProject/") ## 

dataLocation     <- paste(getwd(), "/UCI HAR Dataset", sep="")

## 0. Read the data

X_train          <- read.table(paste(dataLocation, "/train/X_train.txt", sep=""))
X_test           <- read.table(paste(dataLocation, "/test/X_test.txt", sep=""))

y_train          <- read.table(paste(dataLocation, "/train/y_train.txt", sep=""))
y_test           <- read.table(paste(dataLocation, "/test/y_test.txt", sep=""))

subject_train    <- read.table(paste(dataLocation, "/train/subject_train.txt", sep=""))
subject_test     <- read.table(paste(dataLocation, "/test/subject_test.txt", sep=""))

## 1. Merges the training and the test sets to create one data set.

X <- rbind(X_train, X_test)
Y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##Based on column names in the features is an open question as to is the the entries that 
##include mean() and std() at the end, or does it include entries with mean in an earlier 
##part of the name as well. 

features         <- read.table(paste(dataLocation, "/features.txt", sep=""), col.names=c("ID", "Name"))
featureMeanAndStdIndices <- grep("mean|^std\\(\\)", features$Name)
featureMeanAndStd <- features[featureMeanAndStdIndices,]

X_MeanAndStd <- X[,featureMeanAndStdIndices]


##3. Uses descriptive activity names to name the activities in the data set
## you need to get the activity numbers in the data and replace them with descriptive terms which are words.

activity_labels  <- read.table(paste(dataLocation, "/activity_labels.txt", sep=""))

Y_labeled <- Y
Y_labeled[,1] = activity_labels[Y[,1], 2]
names(Y_labeled) <- "ActivityLabel"

##4. Appropriately labels the data set with descriptive variable names.
names(X_MeanAndStd) <- featureMeanAndStd[,c("Name")]

##5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

names(subject) = "Subject"
wholeDataSet <- cbind(subject, Y_labeled, X_MeanAndStd)

##https://class.coursera.org/getdata-004/forum/thread?thread_id=219
meltedData <- melt(wholeDataSet, c("Subject", "ActivityLabel"))

##https://class.coursera.org/getdata-004/forum/thread?thread_id=262
library(reshape2)
resultData = dcast(meltedData, Subject + ActivityLabel ~ variable, mean)
write.table(resultData, file = "./resultData.txt")