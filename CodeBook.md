---
title: "CodeBook"
author: "Boukje Niemann"
date: "Mar 12 2017"
output: html_document
---

This decribes the variables in the `result.txt` file.
The result tidy dataset contains 180 observations of 68 variables, the activity, the subject_id, 33 variables conserning the mean of a measurement, 33 variables conserning the standard deviation of a measurement.

All variables except activity and subject_id are normalized, that means devided by the units used, so they no longer have a unit and are in the range [-1, 1].
They all have "Mean.Of." before the variable name of the original dataset.
This means a mean over all sliding windows of 2.56 seconds that are recorded for a combination of activity and subject_id.
The second mean or the std means that the mean or standard deviation is determined for this variable over the 128 readings per sliding window.

Variable | Description
---------|------------
activity | one of these values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
subject_id | 1 - 30 meaning the number of the test person performing the activity
Mean.Of.tBodyAcc.mean.X | Mean of the time domain signal mean body acceleration on the X axis
Mean.Of.tBodyAcc.mean.Y | Mean of the time domain signal mean body acceleration on the Y axis
Mean.Of.tBodyAcc.mean.Z | Mean of the time domain signal mean body acceleration on the Z axis
Mean.Of.tGravityAcc.mean.X | Mean of the time domain signal mean gravity acceleration on the X axis
Mean.Of.tGravityAcc.mean.Y | Mean of the time domain signal mean gravity acceleration on the Y axis
Mean.Of.tGravityAcc.mean.Z | Mean of the time domain signal mean gravity acceleration on the Z axis
Mean.Of.tBodyAccJerk.mean.X | Mean of the time domain signal mean of the jerk of the body acceleration on the X axis
Mean.Of.tBodyAccJerk.mean.Y | Mean of the time domain signal mean of the jerk of the body acceleration on the Y axis
Mean.Of.tBodyAccJerk.mean.Z | Mean of the time domain signal mean of the jerk of the body acceleration on the Z axis
Mean.Of.tBodyGyro.mean.X | Mean of the time domain signal indicating the mean of the body angular velocity on the X axis
Mean.Of.tBodyGyro.mean.Y | Mean of the time domain signal indicating the mean of the body angular velocity on the Y axis
Mean.Of.tBodyGyro.mean.Z | Mean of the time domain signal indicating the mean of the body angular velocity on the Z axis
Mean.Of.tBodyGyroJerk.mean.X | Mean of the time domain signal indicating the mean of the jerk of the body angular velocity on the X axis
Mean.Of.tBodyGyroJerk.mean.Y | Mean of the time domain signal indicating the mean of the jerk of the body angular velocity on the Y axis
Mean.Of.tBodyGyroJerk.mean.Z | Mean of the time domain signal indicating the mean of the jerk of the body angular velocity on the Z axis
Mean.Of.tBodyAccMag.mean | Mean of the time domain signal indicating the mean of magnitude of the body acceleration 
Mean.Of.tGravityAccMag.mean | Mean of the time domain signal indicating the mean of magnitude of the gravity
Mean.Of.tBodyAccJerkMag.mean | Mean of the time domain signal indicating the mean of magnitude of the jerk of the body acceleration
Mean.Of.tBodyGyroMag.mean | Mean of the time domain signal indicating the mean of the magnitude of the body angular velocity
Mean.Of.tBodyGyroJerkMag.mean | Mean of the time domain signal indicating the mean of the magnitude of the jerk of the body angular velocity
Mean.Of.fBodyAcc.mean.X | Mean of the frequency domain signal mean body acceleration on the X axis
Mean.Of.fBodyAcc.mean.Y | Mean of the frequency domain signal mean body acceleration on the Y axis
Mean.Of.fBodyAcc.mean.Z | Mean of the frequency domain signal mean body acceleration on the Z axis
Mean.Of.fBodyAccJerk.mean.X | Mean of the frequency domain signal mean of the jerk of the body acceleration on the X axis
Mean.Of.fBodyAccJerk.mean.Y | Mean of the frequency domain signal mean of the jerk of the body acceleration on the Y axis
Mean.Of.fBodyAccJerk.mean.Z | Mean of the frequency domain signal mean of the jerk of the body acceleration on the Z axis
Mean.Of.fBodyGyro.mean.X | Mean of the frequency domain signal indicating the mean of the body angular velocity on the X axis
Mean.Of.fBodyGyro.mean.Y | Mean of the frequency domain signal indicating the mean of the body angular velocity on the Y axis
Mean.Of.fBodyGyro.mean.Z | Mean of the frequency domain signal indicating the mean of the body angular velocity on the Z axis
Mean.Of.fBodyAccMag.mean | Mean of the frequency domain signal indicating the mean of magnitude of the body acceleration
Mean.Of.fBodyAccJerkMag.mean | Mean of the frequency domain signal indicating the mean of the magnitude of the jerk of the body acceleration
Mean.Of.fBodyGyroMag.mean | Mean of the frequency domain signal indicating the mean of the magnitude of the body angular velocity
Mean.Of.fBodyGyroJerkMag.mean | Mean of the frequency domain signal indicating the mean of the magnitude of the jerk of the body angular velocity
Mean.Of.tBodyAcc.std.X | Mean of the time domain signal standard deviation of the body acceleration on the X axis
Mean.Of.tBodyAcc.std.Y | Mean of the time domain signal standard deviation of the body acceleration on the Y axis
Mean.Of.tBodyAcc.std.Z | Mean of the time domain signal standard deviation of the body acceleration on the Z axis
Mean.Of.tGravityAcc.std.X | Mean of the time domain signal standard deviation of the gravity acceleration on the X axis
Mean.Of.tGravityAcc.std.Y | Mean of the time domain signal standard deviation of the gravity acceleration on the Y axis
Mean.Of.tGravityAcc.std.Z | Mean of the time domain signal standard deviation of the gravity acceleration on the Z axis
Mean.Of.tBodyAccJerk.std.X | Mean of the time domain signal standard deviation of the jerk of the body acceleration on the X axis
Mean.Of.tBodyAccJerk.std.Y | Mean of the time domain signal standard deviation of the jerk of the body acceleration on the Y axis
Mean.Of.tBodyAccJerk.std.Z | Mean of the time domain signal standard deviation of the jerk of the body acceleration on the Z axis
Mean.Of.tBodyGyro.std.X | Mean of the time domain signal indicating the standard deviation of the body angular velocity on the X axis
Mean.Of.tBodyGyro.std.Y | Mean of the time domain signal indicating the standard deviation of the body angular velocity on the Y axis
Mean.Of.tBodyGyro.std.Z | Mean of the time domain signal indicating the standard deviation of the body angular velocity on the Z axis
Mean.Of.tBodyGyroJerk.std.X | Mean of the time domain signal indicating the standard deviation of the jerk of the body angular velocity on the X axis
Mean.Of.tBodyGyroJerk.std.Y | Mean of the time domain signal indicating the standard deviation of the jerk of the body angular velocity on the Y axis
Mean.Of.tBodyGyroJerk.std.Z | Mean of the time domain signal indicating the standard deviation of the jerk of the body angular velocity on the Z axis
Mean.Of.tBodyAccMag.std | Mean of the time domain signal indicating the standard deviation of the magnitude of the body acceleration
Mean.Of.tGravityAccMag.std | Mean of the time domain signal indicating the standard deviation of the magnitude of the gravity
Mean.Of.tBodyAccJerkMag.std | Mean of the time domain signal indicating the standard deviation of magnitude of the jerk of the body acceleration
Mean.Of.tBodyGyroMag.std | Mean of the time domain signal indicating the standard deviation of the magnitude of the body angular velocity
Mean.Of.tBodyGyroJerkMag.std | Mean of the time domain signal indicating the standard deviation of the magnitude of the jerk of the body angular velocity
Mean.Of.fBodyAcc.std.X | Mean of the frequency domain signal standard deviation body acceleration on the X axis
Mean.Of.fBodyAcc.std.Y | Mean of the frequency domain signal standard deviation body acceleration on the Y axis
Mean.Of.fBodyAcc.std.Z | Mean of the frequency domain signal standard deviation body acceleration on the Z axis
Mean.Of.fBodyAccJerk.std.X | Mean of the frequency domain signal standard deviation of the jerk of the body acceleration on the X axis
Mean.Of.fBodyAccJerk.std.Y | Mean of the frequency domain signal standard deviation of the jerk of the body acceleration on the Y axis
Mean.Of.fBodyAccJerk.std.Z | Mean of the frequency domain signal standard deviation of the jerk of the body acceleration on the Z axis
Mean.Of.fBodyGyro.std.X | Mean of the frequency domain signal indicating the standard deviation of the body angular velocity on the X axis
Mean.Of.fBodyGyro.std.Y | Mean of the frequency domain signal indicating the standard deviation of the body angular velocity on the Y axis
Mean.Of.fBodyGyro.std.Z | Mean of the frequency domain signal indicating the standard deviation of the body angular velocity on the Z axis
Mean.Of.fBodyAccMag.std | Mean of the frequency domain signal indicating the standard deviation of the magnitude of the body acceleration
Mean.Of.fBodyAccJerkMag.std | Mean of the frequency domain signal indicating the standard deviation of the magnitude of the jerk of the body acceleration
Mean.Of.fBodyGyroMag.std | Mean of the frequency domain signal indicating the standard deviation of the magnitude of the body angular velocity
Mean.Of.fBodyGyroJerkMag.std | Mean of the frequency domain signal indicating the standard deviation of the magnitude of the jerk of the body angular velocity
