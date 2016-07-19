if(!file.exists("./data/raw.zip")) source("Download_Dataset.R")

require("knitr")
require("dplyr")
require("tidyr")



## Step 1 - (merge the training and test data set) ----------------------------------------

# import reference data
features <- read.table("./data/UCI HAR Dataset/features.txt", col.names = c("featureID","feature_name"), colClasses = c("numeric","character"))
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("actID","activity"))

# import the test dataset and add subject and activity identifiers to each observation
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subjectID")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "actID")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = features$feature_name)

# import the train dataset and add subject and activity identifiers to each observation
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subjectID")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = "actID")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = features$feature_name)

# merge the test and train observation dataset into 1
x_combined <- rbind(x_test,x_train)
y_combined <- rbind(y_test,y_train)
subject_combined <- rbind(subject_test, subject_train)

## Step 2 - (Extract only mean and standard deviation measures) ----------------------------
target_columns <- grep("mean[(]|std",features$feature_name)
x_trim <- x_combined[,target_columns]

## Step 3 - (Apply discriptive activity names) ---------------------------------------------
y_desc <- merge(y_combined,activity_labels,by.x = "actID", by.y = "actID") 
Dataset <- cbind(subject_combined,"activity" = y_desc$activity, x_trim)

## Step 4 - (labe the data set with descriptive variable names) ----------------------------
# this was completed as part of the import step of x observations

## Step 5 - (create an independent tidy data set with the average of each variable 
#       for each activity and each subject)

Dataset <- tbl_df(Dataset)

Dataset_summary <- 
        Dataset %>% 
        gather(variable,value,-subjectID,-activity) %>%
        group_by(subjectID,activity,variable) %>% 
        summarise(average = mean(value)) %>%
        spread(variable,average)


