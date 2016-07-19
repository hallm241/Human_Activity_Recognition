# Human Activity Recognition
> human activity recognition using smart phone data (samsung datasets)

## Scripts
This repository contains 3 main scripts:  
1. Download_Dataset.R  
2. run_analysis.R  
3. codebook.Rmd  

### Download_Dataset.R
Script downloads the raw smart phone data to the '/data' directory and unzips it

### run_analysis.R
The run analysis script is the main script used for loading, merging, and tidying
the smart phone data in preparation for analysis.

It starts by checking for the raw smart phone data, and if it cannot find it
it sources the "Download_Dataset.R" script to download and unzip it. 
The script then checks for required R packages (installing if necessary) and loads them.

It then completes the requested 5 steps:  
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set  
4. Appropriately labels the data set with descriptive variable names.  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Step 1
step 1 first involves reading in the required data and reference tables.

The reference tables 'features' contains the 561 variables (i.e. columns) in the 'test and train'x' data sets.
The 'activity labels' table contains the descriptive names of each numbered activity listed in the 'y' datasets.


