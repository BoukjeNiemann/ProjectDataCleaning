# run_analysis.R
# This R-script works on the file  
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# after unzipping this file there is a directory "UCI HAR Dataset" which contains all data and metadata
# To work in a neat way, first this script makes a new folder in your working directory
#
if(!file.exists("ProjectDataCleaning")) {
    dir.create("ProjectDataCleaning")
}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="./ProjectDataCleaning/Dataset.zip")
unzip("./ProjectDataCleaning/Dataset.zip", exdir="./ProjectDataCleaning")
old.dir <- getwd()

# make the working directory the "UCI HAR Dataset" directory, for convenience
setwd("./ProjectDataCleaning/UCI HAR Dataset")

# loading used packages, install the package first if you don't have it
library(dplyr)

# read in the metadata
activities <- read.table("activity_labels.txt", col.names = c("activity_id","activity"))
features <- read.table("features.txt", col.names = c("number","featurename"), stringsAsFactors = FALSE)

# the column feature name contains variables with brackets in them
# these are not permitted as columnnames in R (it converts it into dots, same with underscores)
# so first we remove the brackets
features$featurename <- gsub("[()]","",features$featurename)

# there are some variables with double "body" in the name
# make this nicer by making it a name with "body" once
features$featurename <- gsub("BodyBody","Body",features$featurename)

# read in the test data
subject_test <- read.table("./test/subject_test.txt", col.names = "subject_id")
x_test <- read.table("./test/X_test.txt", col.names = features$featurename)
y_test <- read.table("./test/y_test.txt", col.names = "activity_id")

# read in the train data
subject_train <- read.table("./train/subject_train.txt", col.names = "subject_id")
x_train <- read.table("./train/X_train.txt", col.names = features$featurename)
y_train <- read.table("./train/y_train.txt", col.names = "activity_id")

# combine the train and test data for the files subject, x and y
subject <- bind_rows(subject_train,subject_test)
x <- bind_rows(x_train, x_test)
y <- bind_rows(y_train, y_test)

# select the required columns from x
x_mean <- x %>% 
            select(contains("mean")) %>%
            select(-contains("angle")) %>%
            select(-contains("meanFreq"))
x_std <- select(x,contains("std")) 

# combine the data
dataset <- bind_cols(y,subject,x_mean, x_std)

# replace activity_id by the activity description
# the merge makes the dataset ordered by activity_id
totaldataset <- merge(activities, dataset)
totaldataset <- select(totaldataset, -activity_id)

# Create the required output dataset
result <-   totaldataset %>% 
            group_by(activity,subject_id) %>%
            summarize_all(mean) 
# give more meaningfull columnnames
names(result) <- gsub("^t", "Mean.Of.t", names(result))
names(result) <- gsub("^f", "Mean.Of.f", names(result))

# reset working directory
setwd(old.dir)
write.table(result,file = "./ProjectDataCleaning/result.txt", row.names = FALSE, col.names = TRUE)
# clean-up workspace
rm(list=ls())
# to readback the result use
# result <- read.table("./ProjectDataCleaning/result.txt", header = TRUE)
