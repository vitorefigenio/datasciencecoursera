---
title: "README"
author: "Efigenio, Vitor"
date: "Sunday, March 22, 2015"
output: html_document
---
## Getting and Cleaning Data: Course Project

I created one R script called run_analysis.R that does the following:

1st: Create a table with de variable's names from the data set given UCI HAR Dataset/features.txt

2nd: Create table with test ("UCI HAR Dataset/test/X_test.txt") dataset and another with train ("UCI HAR Dataset/train/X_train.txt") dataset. 

Other tables with labels (Y_train.txt and Y_test.txt) and the ID's (subject_train.txt and subject_test.txt).

3rd: Select columns that have the mean and standard deviation (mean, std). At that point I understood that all variables that had "mean", "std", "skewness" and "kurtosis" were measurements on the mean or the standard deviation.

4th: Create another table "activity" with the descriptive activity names. From the file ("UCI HAR Dataset/activity_labels.txt") and I replaced the codes to this names.

5th: I used the rename function from the dplyr package for change the names.

6th: From the data set in step 4th, I created another dataset with the average of each variable for each activity and each subject. I used the functions melt and dcast from the package reshape2 for that step.

Finally I used the write.table to export the FinalData (my tidy data) to a .txt file.