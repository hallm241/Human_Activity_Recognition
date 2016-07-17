#download files
# check for data directory. create if required
if(!file.exists("./data")) dir.create("./data")

zip_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zip_url,"./data/Raw.zip")

setwd("./data")
unzip("Raw.zip")
setwd("..")