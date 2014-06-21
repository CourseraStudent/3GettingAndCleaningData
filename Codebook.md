Variables
=========

Varialbe read from the train set
--------------------------------
  * X_train
  * y_train
  * subject_train
  
Varialbe read from the test set
--------------------------------
  * X_test
  * y_test
  * subject_test

Varible read from other files
-----------------------------
  * features is read form the features.txt file
  * activity_labels is the file read from the activity_labels.txt file
  
Other variables
---------------

 * featureMeanAndStdIndices - indices of the features that either Mean or Std
 * featureMeanAndStd - features taken by the featureMeanAndStdIndices indices
 * X_MeanAndStd - data that contain only column with the features featureMeanAndStd
 * Y_labeled - activities id are replaced with the label names
 * wholeDataSet - united data set with subject, y and x
 * meltedData - data set that has values 
 
Result variable
---------------

 * resultData - averages values for all the combinations of subjects and activies

Tables sizes of the mearges data
--------------------------------

features           2x561
X     	             561x10299
Y                	     1x10299
subject          	     1x10299

Column names
============

 * "ActivityLabel" is the column with the activity label
 * "Subject" is the column with the subject
