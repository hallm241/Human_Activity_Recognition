if(!file.exists("./data/raw.zip")) source("Download_Dataset.R")

library(dplyr)

#reference tables
features <- read.table("./data/UCI HAR Dataset/features.txt", col.names = c("featureID","feature_name"), colClasses = c("numeric","character"))
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("actID","activity"))

# import the test dataset and add subject and activity identifiers to each observation
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subjectID")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "actID")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = features$feature_name)
test <- cbind(subject_test,y_test,x_test)

# import the train dataset and add subject and activity identifiers to each observation
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subjectID")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = "actID")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = features$feature_name)
train <- cbind(subject_train,y_train,x_train)

# merge the test and train dataset into 1
Combined <- rbind(test,train)



?read.table


target_columns <- grep("mean[(]|std",features$feature_name)
target_features <- features$feature_name[target_columns]
select(Combined,target_features)

sub <- Combined[,target_columns+2]

#str(sub)

#?grep
