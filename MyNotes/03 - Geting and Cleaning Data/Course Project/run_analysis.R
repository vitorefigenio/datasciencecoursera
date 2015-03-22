# 1st: Merges the training and the test sets to create one data set.

# Create table wuth the variables names
features <- read.table("./data/UCI HAR Dataset/features.txt")

#  Create TEST table: with test dataset
table_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names=features[,2])
test_labels <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names=c("Lab"))
testID <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names=c("ID"))

# Create TRAIN table: with train dataset
table_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names=features[,2])
train_labels <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names=c("Lab"))
trainID <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names=c("ID"))

# Create a MAIN TABLE: with TEST and TRAIN dataset
table_main <- rbind(table_test, table_train)
main_labels <- rbind(test_labels, train_labels)
mainID <- rbind(testID, trainID)

DataMerged <- cbind(mainID, main_labels, table_main)

# 2nd: Extracts only the measurements on the mean and standard deviation for each measurement.
DataMerged <- DataMerged[,c(1:8,43:48,83:88,123:128,163:168,203,204,216,217,229,230,
                242,243,255,256,268:273,296:304,347:352,375:383,426:431,
                454:462,505,506,515:519,528:532,541:545,554:556)]

# 3rd: Uses descriptive activity names to name the activities in the data set
activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
DataMerged$Lab <- activity[DataMerged$Lab,2]

# 4th: Appropriately labels the data set with descriptive variable names.
library(dplyr)
DataMerged <- rename(DataMerged,Activity=Lab,Subject=ID)

# 5th: From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.

library(reshape2)
id_melt = c("Activity","Subject")
labels_melt = setdiff(colnames(DataMerged),id_melt)
DataMelt <- melt(DataMerged,id=id_melt,measure.vars=labels_melt)

LastData <- dcast(DataMelt,Subject+Activity~variable,mean)
write.table(LastData, file = "analysis.txt", sep = ";", eol = "\n", row.names = TRUE, col.names = TRUE)