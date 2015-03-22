# Code Book
The raw data consists of many files which have been put in a folder called ucihar-data. THere are test and training datasets under that folder as well as 
files common to both data sets. Here are the relevant files
activity_labels.txt  - the labels for each of the six activities described below.
features.txt         - the measurement names described below
feature_info.txt     - the info for all of the features. this document is attached below
subject_test.txt     - the id of the subject for each row in the test data
X_test.txt           - the test data measurements
y_test.csv           - the activity for each test data observation

subject_train.txt    - the subject id for the training data
X_train.txt          - the measurements for the training data
y_train.txt          - the subjects for the training data

## ID or key Fields

* subject - participant id. From 1 to 30.
* activity - the name of the activity from the activity_labels.txt. One of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

## EXTRACTED FEATURES - These are the indices for the features with mean or std in the name

 [1]   1   2   3   4   5   6  41  42  43  44  45  46  81  82  83  84  85  86 121 122 123 124 125 126 161 162 163 164 165 166 201 202 214 215 227 228 240 241 253
[40] 254 266 267 268 269 270 271 294 295 296 345 346 347 348 349 350 373 374 375 424 425 426 427 428 429 452 453 454 503 504 513 516 517 526 529 530 539 542 543
[79] 552

## original and extracted feature name
  id   index old-name                          new-name                             
* 1    1     tBodyAcc-mean()-X                 t_body_acc_mean_x                   
* 2    2     tBodyAcc-mean()-Y                 t_body_acc_mean_y                   
* 3    3     tBodyAcc-mean()-Z                 t_body_acc_mean_z                   
* 4    4     tBodyAcc-std()-X                  t_body_acc_std_x                    
* 5    5     tBodyAcc-std()-Y                  t_body_acc_std_y                    
* 6    6     tBodyAcc-std()-Z                  t_body_acc_std_z                    
* 7    41    tGravityAcc-mean()-X              t_gravity_acc_mean_x                
* 8    42    tGravityAcc-mean()-Y              t_gravity_acc_mean_y                
* 9    43    tGravityAcc-mean()-Z              t_gravity_acc_mean_z                
* 10   44    tGravityAcc-std()-X               t_gravity_acc_std_x                 
* 11   45    tGravityAcc-std()-Y               t_gravity_acc_std_y                 
* 12   46    tGravityAcc-std()-Z               t_gravity_acc_std_z                 
* 13   81    tBodyAccJerk-mean()-X             t_body_acc_jerk_mean_x              
* 14   82    tBodyAccJerk-mean()-Y             t_body_acc_jerk_mean_y              
* 15   83    tBodyAccJerk-mean()-Z             t_body_acc_jerk_mean_z              
* 16   84    tBodyAccJerk-std()-X              t_body_acc_jerk_std_x               
* 17   85    tBodyAccJerk-std()-Y              t_body_acc_jerk_std_y               
* 18   86    tBodyAccJerk-std()-Z              t_body_acc_jerk_std_z               
* 19   121   tBodyGyro-mean()-X                t_body_gyro_mean_x                  
* 20   122   tBodyGyro-mean()-Y                t_body_gyro_mean_y                  
* 21   123   tBodyGyro-mean()-Z                t_body_gyro_mean_z                  
* 22   124   tBodyGyro-std()-X                 t_body_gyro_std_x                   
* 23   125   tBodyGyro-std()-Y                 t_body_gyro_std_y                   
* 24   126   tBodyGyro-std()-Z                 t_body_gyro_std_z                   
* 25   161   tBodyGyroJerk-mean()-X            t_body_gyro_jerk_mean_x             
* 26   162   tBodyGyroJerk-mean()-Y            t_body_gyro_jerk_mean_y             
* 27   163   tBodyGyroJerk-mean()-Z            t_body_gyro_jerk_mean_z             
* 28   164   tBodyGyroJerk-std()-X             t_body_gyro_jerk_std_x              
* 29   165   tBodyGyroJerk-std()-Y             t_body_gyro_jerk_std_y              
* 30   166   tBodyGyroJerk-std()-Z             t_body_gyro_jerk_std_z              
* 31   201   tBodyAccMag-mean()                t_body_acc_mag_mean                 
* 32   202   tBodyAccMag-std()                 t_body_acc_mag_std                  
* 33   214   tGravityAccMag-mean()             t_gravity_acc_mag_mean              
* 34   215   tGravityAccMag-std()              t_gravity_acc_mag_std               
* 35   227   tBodyAccJerkMag-mean()            t_body_acc_jerk_mag_mean            
* 36   228   tBodyAccJerkMag-std()             t_body_acc_jerk_mag_std             
* 37   240   tBodyGyroMag-mean()               t_body_gyro_mag_mean                
* 38   241   tBodyGyroMag-std()                t_body_gyro_mag_std                 
* 39   253   tBodyGyroJerkMag-mean()           t_body_gyro_jerk_mag_mean           
* 40   254   tBodyGyroJerkMag-std()            t_body_gyro_jerk_mag_std            
* 41   266   fBodyAcc-mean()-X                 f_body_acc_mean_x                   
* 42   267   fBodyAcc-mean()-Y                 f_body_acc_mean_y                   
* 43   268   fBodyAcc-mean()-Z                 f_body_acc_mean_z                   
* 44   269   fBodyAcc-std()-X                  f_body_acc_std_x                    
* 45   270   fBodyAcc-std()-Y                  f_body_acc_std_y                    
* 46   271   fBodyAcc-std()-Z                  f_body_acc_std_z                    
* 47   294   fBodyAcc-meanFreq()-X             f_body_acc_mean_freq_x              
* 48   295   fBodyAcc-meanFreq()-Y             f_body_acc_mean_freq_y              
* 49   296   fBodyAcc-meanFreq()-Z             f_body_acc_mean_freq_z              
* 50   345   fBodyAccJerk-mean()-X             f_body_acc_jerk_mean_x              
* 51   346   fBodyAccJerk-mean()-Y             f_body_acc_jerk_mean_y              
* 52   347   fBodyAccJerk-mean()-Z             f_body_acc_jerk_mean_z              
* 53   348   fBodyAccJerk-std()-X              f_body_acc_jerk_std_x               
* 54   349   fBodyAccJerk-std()-Y              f_body_acc_jerk_std_y               
* 55   350   fBodyAccJerk-std()-Z              f_body_acc_jerk_std_z               
* 56   373   fBodyAccJerk-meanFreq()-X         f_body_acc_jerk_mean_freq_x         
* 57   374   fBodyAccJerk-meanFreq()-Y         f_body_acc_jerk_mean_freq_y         
* 58   375   fBodyAccJerk-meanFreq()-Z         f_body_acc_jerk_mean_freq_z         
* 59   424   fBodyGyro-mean()-X                f_body_gyro_mean_x                  
* 60   425   fBodyGyro-mean()-Y                f_body_gyro_mean_y                  
* 61   426   fBodyGyro-mean()-Z                f_body_gyro_mean_z                  
* 62   427   fBodyGyro-std()-X                 f_body_gyro_std_x                   
* 63   428   fBodyGyro-std()-Y                 f_body_gyro_std_y                   
* 64   429   fBodyGyro-std()-Z                 f_body_gyro_std_z                   
* 65   452   fBodyGyro-meanFreq()-X            f_body_gyro_mean_freq_x             
* 66   453   fBodyGyro-meanFreq()-Y            f_body_gyro_mean_freq_y             
* 67   454   fBodyGyro-meanFreq()-Z            f_body_gyro_mean_freq_z             
* 68   503   fBodyAccMag-mean()                f_body_acc_mag_mean                 
* 69   504   fBodyAccMag-std()                 f_body_acc_mag_std                  
* 70   513   fBodyAccMag-meanFreq()            f_body_acc_mag_mean_freq            
* 71   516   fBodyBodyAccJerkMag-mean()        f_body_body_acc_jerk_mag_mean       
* 72   517   fBodyBodyAccJerkMag-std()         f_body_body_acc_jerk_mag_std        
* 73   526   fBodyBodyAccJerkMag-meanFreq()    f_body_body_acc_jerk_mag_mean_freq  
* 74   529   fBodyBodyGyroMag-mean()           f_body_body_gyro_mag_mean           
* 75   530   fBodyBodyGyroMag-std()            f_body_body_gyro_mag_std            
* 76   539   fBodyBodyGyroMag-meanFreq()       f_body_body_gyro_mag_mean_freq      
* 77   542   fBodyBodyGyroJerkMag-mean()       f_body_body_gyro_jerk_mag_mean      
* 78   543   fBodyBodyGyroJerkMag-std()        f_body_body_gyro_jerk_mag_std       
* 79   552   fBodyBodyGyroJerkMag-meanFreq()   f_body_body_gyro_jerk_mag_mean_freq
## Activity Labels

* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

## FROM THE ORIGINAL features_info.txt
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
