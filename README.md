# getting-and-cleaning-data
Coursera Getting and Cleaning Data 
---
title: "Getting and Cleaning Data Course Project"
author: "Matthew Mariano"
date: "March 22, 2015"
output: html_document
---
The code is documented and even further documented here.
This project contains the following.

CodeBook.MD - this describes the initial and extracted data sets.
run_analysis.R - this is the main script which combines several of the raw data sets , manipulates , formats and output a tidy data set.
tidy.txt - the tidy data set output from run_analysis.R script. It contains 6 observations for 30 subjects with 79 variables.

---

Cleaning the Data

The first step to cleaning this data set was to remove leading whitespace and extra whitespace. This is usually faster to do from a command line. For example the following fixes the test data by removing the whitespace at the beginning of each line and the extra whitespace that appears on some rows.
It also makes the comma the field sepearator.
cat X_test.txt|sed -e 's/^  //g'|sed -e 's/^ //g'|sed -e 's/  / /g'|sed -e 's/ /,/g' > X_test.csv

The next step is acquiring the extracted features. For this step I simply create a vector pointing to the features we want to keep.
x=grep("mean|std",features[,2])
Now x can be used to subset the data.

Another part of cleaning the data is renaming the columns. The function rename does this.
--- 

Joining the Data

Since the data is split into training and testing sets, first we combine the subjects and activiites for the training set with the training set and then do the same on the testing set.

train=cbind(train_subjects,train_activities,train)
test=cbind(test_subjects,test_activities,test)

Next we combine the training and testing sets:
alldata=rbind(train,test)

---

Grouping and averaging.

sqldf was used to perform the final calculations on the data. the function getSql is used to generate a sql statement that performs the average of each measurement column by first grouping on subject then activity.

"SELECT subject,activity, avg(t_body_acc_mean_z),avg(t_body_acc_std_x),avg(t_body_acc_std_y),avg(t_body_acc_std_z),avg(t_gravity_acc_mean_x),avg(t_gravity_acc_mean_y),avg(t_gravity_acc_mean_z),avg(t_gravity_acc_std_x),avg(t_gravity_acc_std_y),avg(t_gravity_acc_std_z),avg(t_body_acc_jerk_mean_x),avg(t_body_acc_jerk_mean_y),avg(t_body_acc_jerk_mean_z),avg(t_body_acc_jerk_std_x),avg(t_body_acc_jerk_std_y),avg(t_body_acc_jerk_std_z),avg(t_body_gyro_mean_x),avg(t_body_gyro_mean_y),avg(t_body_gyro_mean_z),avg(t_body_gyro_std_x),avg(t_body_gyro_std_y),avg(t_body_gyro_std_z),avg(t_body_gyro_jerk_mean_x),avg(t_body_gyro_jerk_mean_y),avg(t_body_gyro_jerk_mean_z),avg(t_body_gyro_jerk_std_x),avg(t_body_gyro_jerk_std_y),avg(t_body_gyro_jerk_std_z),avg(t_body_acc_mag_mean),avg(t_body_acc_mag_std),avg(t_gravity_acc_mag_mean),avg(t_gravity_acc_mag_std),avg(t_body_acc_jerk_mag_mean),avg(t_body_acc_jerk_mag_std),avg(t_body_gyro_mag_mean),avg(t_body_gyro_mag_std),avg(t_body_gyro_jerk_mag_mean),avg(t_body_gyro_jerk_mag_std),avg(f_body_acc_mean_x),avg(f_body_acc_mean_y),avg(f_body_acc_mean_z),avg(f_body_acc_std_x),avg(f_body_acc_std_y),avg(f_body_acc_std_z),avg(f_body_acc_mean_freq_x),avg(f_body_acc_mean_freq_y),avg(f_body_acc_mean_freq_z),avg(f_body_acc_jerk_mean_x),avg(f_body_acc_jerk_mean_y),avg(f_body_acc_jerk_mean_z),avg(f_body_acc_jerk_std_x),avg(f_body_acc_jerk_std_y),avg(f_body_acc_jerk_std_z),avg(f_body_acc_jerk_mean_freq_x),avg(f_body_acc_jerk_mean_freq_y),avg(f_body_acc_jerk_mean_freq_z),avg(f_body_gyro_mean_x),avg(f_body_gyro_mean_y),avg(f_body_gyro_mean_z),avg(f_body_gyro_std_x),avg(f_body_gyro_std_y),avg(f_body_gyro_std_z),avg(f_body_gyro_mean_freq_x),avg(f_body_gyro_mean_freq_y),avg(f_body_gyro_mean_freq_z),avg(f_body_acc_mag_mean),avg(f_body_acc_mag_std),avg(f_body_acc_mag_mean_freq),avg(f_body_body_acc_jerk_mag_mean),avg(f_body_body_acc_jerk_mag_std),avg(f_body_body_acc_jerk_mag_mean_freq),avg(f_body_body_gyro_mag_mean),avg(f_body_body_gyro_mag_std),avg(f_body_body_gyro_mag_mean_freq),avg(f_body_body_gyro_jerk_mag_mean),avg(f_body_body_gyro_jerk_mag_std),avg(f_body_body_gyro_jerk_mag_mean_freq) FROM alldata GROUP BY subject, activity ORDER BY subject, activity"

---

Sourcing the Script

The script is sourced and the output messages shown.

```{r}
source('run_analysis.R')
```


