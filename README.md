---
title: "Project Data Cleaning"
author: "Boukje Niemann"
date: "Mar 12 2017"
output:
  html_document:
    keep_md: yes
---

## Project Getting and Cleaning Data
The purpose of this projec is to demonstrate my ability to collect, work with, and clean a dataset.
The goal is to prepare tidy data that can be used for later analysis. 

It works with a dataset given from the UCI Machine Learning Repository.
The full description and also a more resent dataset can be found here [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 
The description is also available in the README.txt from the dataset which is loaded with the R-script in this repository.

In this repository are 4 files:
* `README.md` -- this file explaning the project and how to use the files in this repository
* `Codebook.md` -- description of all the variables in the output file of the R-script
* `run_analysis.R` -- the R-script to download the data, process the data and make a tidy dataset
* `result.txt` -- the resulting tidy dataset with the avarage values of each variable for each activity and each subject. This has to be done only on the measurements in the raw data on the mean and the standard deviation for each measurement.


##Study design and data processing

###Collection of the raw data
The basis of this study is a dataset collected by 30 volunteers wearing a smartphone (Samsung Galaxy S II) on the waist. They each performed 6 different activities, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity were capture at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The signals that were collected in this way were preprocessed. Which resulted in a file with a large number of variables all
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

###Notes on the original (raw) data 
All the data needed is loaded in with the script which stores it the data in a folder in your working directory.
In the UCI HAR Dataset are several files and folders.
The preprocessed raw data is available in the dataset in the Inertial Signals folders. They are noted in "g" and rad/sec.
The 561 features that were calculated from that are stored in the X_train.txt and X_test.txt files. These variables are normalized, so all have a value between -1 and 1.

###Description of the (raw) dataset
The dataset includes the following files:
* 'README.txt': which explains the project
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all 561 features.
* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set, containing 7352 observations of 561 variables.
* 'train/y_train.txt': Training labels, containing which activity the measurements are from.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* 'test/X_test.txt': Test set, containing 2947 observations of 561 variables.
* 'test/y_test.txt': Test labels, containing which activity the measurements are from.
* 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The following files are available for the train and test data. Their descriptions are equivalent. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

##Creating the tidy datafile

###Guide to create the tidy data file, this is done by the R-script run_analysis.R
The script uses the package dplyr, so it assumes you have installed that package.
I wanted to use the select statement to select the required columns. This creates a little bit more seperate dataframes and combine steps, than other solutions.
The script follows the following structure:
1. download and unzip the raw data and store them in a new created directory
2. read the data into seperate dataframes
3. transform the columnnames of the feature dataframe
4. combining the corresponding datasets, subject, x and y of the test and train subgroups into datasets with all 10.299 observations
5. select the required columns out of the x file, whichs creates two subsets, one with the mean, and one with the standard deviation variables
6. combine the y, subject, x_mean and x_std into one dataset
7. merge with the activities dataset and delete the activity_id column, to get the activity names in the dataset. Note: this also orders the dataset by activity.
8. create the required dataset by calculating the mean of each variable for each activity and each subject_id
9. give the resulting dataset more meaningfull names by adding "Mean.Of." before the variable names of the original variable.
10. cleaning up the workspace, leaving only the downloaded dataset zip-file, the unpacked dataset and the 'result.txt' file in a folder named "ProjectDataCleaning" in you working directory

###Cleaning of the data
In step 3 the column names of the original features are made more tidy.
R transforms underscores and brackets into dots, when using the descriptions in the feature.txt file as columnames of a dataframe.
So to avoid names with ... in them, I first delete the brackets. The resulting columnnames are now seperated by one dot.
Also there are some variables which have "BodyBody" in the description. This seems incorrect, so I replaced that with a name containing only "Body".

In step 5 the goal is to select all the measurements in the raw data on the mean and the standard deviation for each measurement.
I considered the variables with "meanFreq" and the variables of the angle vector not to fit in that category, so I exluded the from the sets which have all the variables containing "mean" or "std" in them.
