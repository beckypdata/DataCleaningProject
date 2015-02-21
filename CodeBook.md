---

#Study Design
---

###The Original Study

This data cleaning effort was based on a study conducted by the Center for 
Machine Learning and Intelligent Systems.  Please refer to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for additional information on the study, and specifically on how study data was gathered.  The study involved 30 participants who each performed 6 activities while wearing a Samsung Galaxy S II on their waist.  The embedded accelerometer and gyroscope within the phone were used to capture linear acceleration (accelerometer) and angular velocity (gyroscope) 3-axial measurements at a constant rate of 50Hz.  These signals were decomposed to derive body acceleration and gravity components at each observation point.  

Finally, summary vectors were derived from the body acceleration and gravity components vectors at same observation points using both time domain and frequency domain.  The result was a set of 561 vectors for each of the 30 participants, performing each of the 6 activities, at all sampling points.  This derived dataset was randomly divided into two datasets with 70% of the participant data stored in the "training" data and 30% in the "test" data.

Specific summary vectors from the original study are detailed below in the Code Book section.  

###Accessing the Original Data

For purposes of this assignment, it is assumed that the original study data has been previously downloaded.  If this has not been done, please follow these steps
  
  * download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
  * extract all files to a local directory

All subsequent steps should be completed from the local directory created

###Data Cleaning Project Goal

Select vectors from the original study that represent mean and standard 
deviation for each combination of subject and activity.  For the selected vectors, calculate a mean value.  Store results in a tidy data set. 

The specific measurements retained from the original study (79 in total) are spelled out in the Code Book section below.  

###Approach Within Project Script

*Step 1: Load dplyr package*

Functions from this package will simplify R script steps below

*Step 2. Read the datasets*

Reads are completed for the individual files from the training directory and the test directory.  A total of 6 files comprise the data needed to reconstruct the study dataset.  Script merges these 6 file into a dataset comparable to the study dataset that existed prior to random division into "training" and "test". Fast read (fread) cannot be used in R for the read as the fread function incorrectly identifies number of columns and subsequently encounters read errors.

+ X datasets represent the 561 vectors derived in the study, 1 column per vector
+ Features.txt contains the measurement names for those 561 derived vectors.  
+ Y datasets represent the activities performed; values will range 1-6 for the 6 activities measured; rows align 1:1 with X datasets.  Critical that these rows not move in subsequent steps and remain aligned with matching rows in X as they do in the study data
+ Subject datasets represent the 1-30 subjects; rows align 1:1 with X and Y 
+ Activity_labels.txt contains the descriptions for each of the 1-6 activities

*Step 3. Variable name cleanup*

Variable names as provided by original study indicate whether the vector was measured by the accelerometer ("Acc") or gyroscope ("Gyro"); whether the derived vector represents body ("fBody") or gravity ("fGravity"); whether the calculations were completed over time domain ("tBody") or frequency domain ("fBody").  As 
part of the effort to create tidy data, these variable names will be expanded 
within the script to provide more user friendly info.  Some additional measure 
name cleanup was also necessary, specifically

+ some values do not align with study info, for example fBodyBody should be 
fBody according to study documentation
+ duplicate measurement names have been created by the current naming 
conventions.  These need to be resolved for subsequent steps of R script to work 
accurately.  This is done by appending a unique identifier (index of the 
vector within the 561 vector set) to the end of the variable name
+ use of , and - are invalid characters for R variable names, and are 
replaced with "_"
+ study variables include () presumably to indicate derivation by functions.  These are invalid for R variable names and could be inaccurately viewed as 
functions in subsequent analysis

*Step 4. Merge the datasets*
    
+ bind rows for each of the X, Y, and Subject datasets.  This results in 
10299 rows for each dataset
+ name the columns within each dataset; this is done at this stage to avoid 
duplication of default name "V1" in the subsequent combined datasets
+ for the columns in the X datasets, merge the R script adjusted features 
descriptions to provide meaningful column descriptions for each vector.  The names as provided in the features file are in exact order of values in X dataset, so assignment to X column names is done by position and does not require matching ID column 
+ bind columns for Subject, Y, and X (in that order) to reconstruct the 
original dataset
+ merge activity descriptions into the dataset using the column "ID". Critically important that this merge not be done until original dataset reconstructed as merge in R can move rows of data frame in undefined order

*Step 5. Select the desired data and generate tidy dataset*

Decision must be made as to whether to use long form or wide form of tidy dataset.  Given the nature of the study vectors decomposition and derivation from initial signals, it would be difficult to state that these measurements are independent.  As such, it is difficult to store them as separate rows/observations which imply independent observations.  

Although it is not clear what subsequent analysis will be completed on the tidy 
data, it is reasonable to assume that some level of correlation assessment 
might be needed.  This will be easiest if these measurements are presented as 
individual columns, so the wide form will be utilized.  If long form is needed, this can be easily accomplished with the melt() function using "Subject" and "Activity" as the ID columns.

To complete the tidying of the data

+ select columns "Subject" "Activity", and any that contain "mean" or "std"
+ exclude those columns with "angle" in the name as in viewing the original 
features names it is clear that mean actually referred to arguments of the angle function and did not represent a mean measurement
+ group by subject and activity in preparation for calculating summary 
statistic for each group
+ calculate mean for each variable vector by subject and activity

*Step 6. Write the tidy dataset*

Write the result as a txt file; ensure no row names in output

---
#Code Book
---

###Original Study derived variables from initial signals

####***Variable base names***

The following base names were leveraged for naming of all subsequent estimated variables in the original study.  Units for all study estimated variables share the units of the original derived measurements.  These units are noted next to the base name below.  Units are not repeated for the derived measurements; those units are inherited from the base name.  

All measurements were normalized and bounded with [-1,1]

*3-axial time domain derived acceleration from accelerometer and gyroscope*

+ tBodyAcc - units m/s^2
+ tGravityAcc - units m/s^2
+ tBodyGyro - units radians/s

*3-axial time domain derived Jerk signals*

+ tBodyAccJerk - units m/s^2
+ tBodyGyroJerk - units radians/s

*Euclidean norm calculated magnitude of time domain accelerometer and gyroscope signals*

+ tBodyAccMag - units m/s^2
+ tGravityAccMag - units m/s^2
+ tBodyAccJerkMag - units m/s^2
+ tBodyGyroMag - units radians/s
+ tBodyGyroJerkMag - units radians/s

*3-axial frequency domain derived signals from accelerometer and gyroscope*

+ fBodyAcc - units m/s^2
+ fBodyAccJerk - units m/s^2
+ fBodyGyro - units radians/s

*Euclidean norm calculated magnitude of frequency domain accelerometer and gyroscope signals*

+ fBodyAccMag - units m/s^2
+ fBodyAccJerkMag - units m/s^2
+ fBodyGyroMag - unts radians/s
+ fBodyGyroJerkMag - units radians/s

####***Estimated values from derived signals*** (561 vectors)

*Mean value*

+ tBodyAcc-mean()-X
+ tBodyAcc-mean()-Y
+ tBodyAcc-mean()-Z
+ tGravityAcc-mean()-X
+ tGravityAcc-mean()-Y
+ tGravityAcc-mean()-Z
+ tBodyAccJerk-mean()-X
+ tBodyAccJerk-mean()-Y
+ tBodyAccJerk-mean()-Z
+ tBodyGyro-mean()-X
+ tBodyGyro-mean()-Y
+ tBodyGyro-mean()-Z
+ tBodyGyroJerk-mean()-X
+ tBodyGyroJerk-mean()-Y
+ tBodyGyroJerk-mean()-Z
+ tBodyAccMag-mean()
+ tGravityAccMag-mean()
+ tBodyAccJerkMag-mean()
+ tBodyGyroMag-mean()
+ tBodyGyroJerkMag-mean()
+ fBodyAcc-mean()-X
+ fBodyAcc-mean()-Y
+ fBodyAcc-mean()-Z
+ fBodyAccJerk-mean()-X
+ fBodyAccJerk-mean()-Y
+ fBodyAccJerk-mean()-Z
+ fBodyGyro-mean()-X
+ fBodyGyro-mean()-Y
+ fBodyGyro-mean()-Z
+ fBodyAccMag-mean()
+ fBodyBodyAccJerkMag-mean()
+ fBodyBodyGyroMag-mean()
+ fBodyBodyGyroJerkMag-mean()

*Standard deviation*

+ tBodyAcc-std()-X
+ tBodyAcc-std()-Y
+ tBodyAcc-std()-Z
+ tGravityAcc-std()-X
+ tGravityAcc-std()-Y
+ tGravityAcc-std()-Z
+ tBodyAccJerk-std()-X
+ tBodyAccJerk-std()-Y
+ tBodyAccJerk-std()-Z
+ tBodyGyro-std()-X
+ tBodyGyro-std()-Y
+ tBodyGyro-std()-Z
+ tBodyGyroJerk-std()-X
+ tBodyGyroJerk-std()-Y
+ tBodyGyroJerk-std()-Z
+ tBodyAccMag-std()
+ tGravityAccMag-std()
+ tBodyAccJerkMag-std()
+ tBodyGyroMag-std()
+ tBodyGyroJerkMag-std()
+ fBodyAcc-std()-X
+ fBodyAcc-std()-Y
+ fBodyAcc-std()-Z
+ fBodyAccJerk-std()-X
+ fBodyAccJerk-std()-Y
+ fBodyAccJerk-std()-Z
+ fBodyGyro-std()-X
+ fBodyGyro-std()-Y
+ fBodyGyro-std()-Z
+ fBodyAccMag-std()
+ fBodyBodyAccJerkMag-std()
+ fBodyBodyGyroMag-std()
+ fBodyBodyGyroJerkMag-std()

*Median absolute deviation*

+ tBodyAcc-mad()-X
+ tBodyAcc-mad()-Y
+ tBodyAcc-mad()-Z
+ tGravityAcc-mad()-X
+ tGravityAcc-mad()-Y
+ tGravityAcc-mad()-Z
+ tBodyAccJerk-mad()-X
+ tBodyAccJerk-mad()-Y
+ tBodyAccJerk-mad()-Z
+ tBodyGyro-mad()-X
+ tBodyGyro-mad()-Y
+ tBodyGyro-mad()-Z
+ tBodyGyroJerk-mad()-X
+ tBodyGyroJerk-mad()-Y
+ tBodyGyroJerk-mad()-Z
+ tBodyAccMag-mad()
+ tGravityAccMag-mad()
+ tBodyAccJerkMag-mad()
+ tBodyGyroMag-mad()
+ tBodyGyroJerkMag-mad()
+ fBodyAcc-mad()-X
+ fBodyAcc-mad()-Y
+ fBodyAcc-mad()-Z
+ fBodyAccJerk-mad()-X
+ fBodyAccJerk-mad()-Y
+ fBodyAccJerk-mad()-Z
+ fBodyGyro-mad()-X
+ fBodyGyro-mad()-Y
+ fBodyGyro-mad()-Z
+ fBodyAccMag-mad()
+ fBodyBodyAccJerkMag-mad()
+ fBodyBodyGyroMag-mad()
+ fBodyBodyGyroJerkMag-mad()

*Largest value in array*

+ tBodyAcc-max()-X
+ tBodyAcc-max()-Y
+ tBodyAcc-max()-Z
+ tGravityAcc-max()-X
+ tGravityAcc-max()-Y
+ tGravityAcc-max()-Z
+ tBodyAccJerk-max()-X
+ tBodyAccJerk-max()-Y
+ tBodyAccJerk-max()-Z
+ tBodyGyro-max()-X
+ tBodyGyro-max()-Y
+ tBodyGyro-max()-Z
+ tBodyGyroJerk-max()-X
+ tBodyGyroJerk-max()-Y
+ tBodyGyroJerk-max()-Z
+ tBodyAccMag-max()
+ tGravityAccMag-max()
+ tBodyAccJerkMag-max()
+ tBodyGyroMag-max()
+ tBodyGyroJerkMag-max()
+ fBodyAcc-max()-X
+ fBodyAcc-max()-Y
+ fBodyAcc-max()-Z
+ fBodyAccJerk-max()-X
+ fBodyAccJerk-max()-Y
+ fBodyAccJerk-max()-Z
+ fBodyGyro-max()-X
+ fBodyGyro-max()-Y
+ fBodyGyro-max()-Z
+ fBodyAccMag-max()
+ fBodyBodyAccJerkMag-max()
+ fBodyBodyGyroMag-max()
+ fBodyBodyGyroJerkMag-max()

*Smallest value in array*

+ tBodyAcc-min()-X
+ tBodyAcc-min()-Y
+ tBodyAcc-min()-Z
+ tGravityAcc-min()-X
+ tGravityAcc-min()-Y
+ tGravityAcc-min()-Z
+ tBodyAccJerk-min()-X
+ tBodyAccJerk-min()-Y
+ tBodyAccJerk-min()-Z
+ tBodyGyro-min()-X
+ tBodyGyro-min()-Y
+ tBodyGyro-min()-Z
+ tBodyGyroJerk-min()-X
+ tBodyGyroJerk-min()-Y
+ tBodyGyroJerk-min()-Z
+ tBodyAccMag-min()
+ tGravityAccMag-min()
+ tBodyAccJerkMag-min()
+ tBodyGyroMag-min()
+ tBodyGyroJerkMag-min()
+ fBodyAcc-min()-X
+ fBodyAcc-min()-Y
+ fBodyAcc-min()-Z
+ fBodyAccJerk-min()-X
+ fBodyAccJerk-min()-Y
+ fBodyAccJerk-min()-Z
+ fBodyGyro-min()-X
+ fBodyGyro-min()-Y
+ fBodyGyro-min()-Z
+ fBodyAccMag-min()
+ fBodyBodyAccJerkMag-min()
+ fBodyBodyGyroMag-min()
+ fBodyBodyGyroJerkMag-min()

*Signal magnitude area*

+ tBodyAcc-sma()
+ tGravityAcc-sma()
+ tBodyAccJerk-sma()
+ tBodyGyro-sma()
+ tBodyGyroJerk-sma()
+ tBodyAccMag-sma()
+ tGravityAccMag-sma()
+ tBodyAccJerkMag-sma()
+ tBodyGyroMag-sma()
+ tBodyGyroJerkMag-sma()
+ fBodyAcc-sma()
+ fBodyAccJerk-sma()
+ fBodyGyro-sma()
+ fBodyAccMag-sma()
+ fBodyBodyAccJerkMag-sma()
+ fBodyBodyGyroMag-sma()
+ fBodyBodyGyroJerkMag-sma()

*Energy measure.  Sum of squares divide by number of values*

+ tBodyAcc-energy()-X
+ tBodyAcc-energy()-Y
+ tBodyAcc-energy()-Z
+ tGravityAcc-energy()-X
+ tGravityAcc-energy()-Y
+ tGravityAcc-energy()-Z
+ tBodyAccJerk-energy()-X
+ tBodyAccJerk-energy()-Y
+ tBodyAccJerk-energy()-Z
+ tBodyGyro-energy()-X
+ tBodyGyro-energy()-Y
+ tBodyGyro-energy()-Z
+ tBodyGyroJerk-energy()-X
+ todyGyroJerk-energy()-Y
+ tBodyGyroJerk-energy()-Z
+ tBodyAccMag-energy()
+ tGravityAccMag-energy()
+ tBodyAccJerkMag-energy()
+ tBodyGyroMag-energy()
+ tBodyGyroJerkMag-energy()
+ fBodyAcc-energy()-X
+ fBodyAcc-energy()-Y
+ fBodyAcc-energy()-Z
+ fBodyAccJerk-energy()-X
+ fBodyAccJerk-energy()-Y
+ fBodyAccJerk-energy()-Z
+ fBodyGyro-energy()-X
+ fBodyGyro-energy()-Y
+ fBodyGyro-energy()-Z
+ fBodyAccMag-energy()
+ fBodyBodyAccJerkMag-energy()
+ fBodyBodyGyroMag-energy()
+ fBodyBodyGyroJerkMag-energy()

*Interquartile range*

+ tBodyAcc-iqr()-X
+ tBodyAcc-iqr()-Y
+ tBodyAcc-iqr()-Z
+ tGravityAcc-iqr()-X
+ tGravityAcc-iqr()-Y
+ tGravityAcc-iqr()-Z
+ tBodyAccJerk-iqr()-X
+ tBodyAccJerk-iqr()-Y
+ tBodyAccJerk-iqr()-Z
+ tBodyGyro-iqr()-X
+ tBodyGyro-iqr()-Y
+ tBodyGyro-iqr()-Z
+ tBodyGyroJerk-iqr()-X
+ tBodyGyroJerk-iqr()-Y
+ tBodyGyroJerk-iqr()-Z
+ tBodyAccMag-iqr()
+ tGravityAccMag-iqr()
+ tBodyAccJerkMag-iqr()
+ tBodyGyroMag-iqr()
+ tBodyGyroJerkMag-iqr()
+ fBodyAcc-iqr()-X
+ fBodyAcc-iqr()-Y
+ fBodyAcc-iqr()-Z
+ fBodyAccJerk-iqr()-X
+ fBodyAccJerk-iqr()-Y
+ fBodyAccJerk-iqr()-Z
+ fBodyGyro-iqr()-X
+ fBodyGyro-iqr()-Y
+ fBodyGyro-iqr()-Z
+ fBodyAccMag-iqr()
+ fBodyBodyAccJerkMag-iqr()
+ fBodyBodyGyroMag-iqr()
+ fBodyBodyGyroJerkMag-iqr()

*Signal entropy*

+ tBodyAcc-entropy()-X
+ tBodyAcc-entropy()-Y
+ tBodyAcc-entropy()-Z
+ tGravityAcc-entropy()-X
+ tGravityAcc-entropy()-Y
+ tGravityAcc-entropy()-Z
+ tBodyAccJerk-entropy()-X
+ tBodyAccJerk-entropy()-Y
+ tBodyAccJerk-entropy()-Z
+ tBodyGyro-entropy()-X
+ tBodyGyro-entropy()-Y
+ tBodyGyro-entropy()-Z
+ tBodyGyroJerk-entropy()-X
+ tBodyGyroJerk-entropy()-Y
+ tBodyGyroJerk-entropy()-Z
+ tBodyAccMag-entropy()
+ tGravityAccMag-entropy()
+ tBodyAccJerkMag-entropy()
+ tBodyGyroMag-entropy()
+ tBodyGyroJerkMag-entropy()
+ fBodyAcc-entropy()-X
+ fBodyAcc-entropy()-Y
+ fBodyAcc-entropy()-Z
+ fBodyAccJerk-entropy()-X
+ fBodyAccJerk-entropy()-Y
+ fBodyAccJerk-entropy()-Z
+ fBodyGyro-entropy()-X
+ fBodyGyro-entropy()-Y
+ fBodyGyro-entropy()-Z
+ fBodyAccMag-entropy()
+ fBodyBodyAccJerkMag-entropy()
+ fBodyBodyGyroMag-entropy()
+ fBodyBodyGyroJerkMag-entropy()

*Autoregresion coefficients with Burg order equal to 4*

+ tBodyAcc-arCoeff()-X,1
+ tBodyAcc-arCoeff()-X,2
+ tBodyAcc-arCoeff()-X,3
+ tBodyAcc-arCoeff()-X,4
+ tBodyAcc-arCoeff()-Y,1
+ tBodyAcc-arCoeff()-Y,2
+ tBodyAcc-arCoeff()-Y,3
+ tBodyAcc-arCoeff()-Y,4
+ tBodyAcc-arCoeff()-Z,1
+ tBodyAcc-arCoeff()-Z,2
+ tBodyAcc-arCoeff()-Z,3
+ tBodyAcc-arCoeff()-Z,4
+ tGravityAcc-arCoeff()-X,1
+ tGravityAcc-arCoeff()-X,2
+ tGravityAcc-arCoeff()-X,3
+ tGravityAcc-arCoeff()-X,4
+ tGravityAcc-arCoeff()-Y,1
+ tGravityAcc-arCoeff()-Y,2
+ tGravityAcc-arCoeff()-Y,3
+ tGravityAcc-arCoeff()-Y,4
+ tGravityAcc-arCoeff()-Z,1
+ tGravityAcc-arCoeff()-Z,2
+ tGravityAcc-arCoeff()-Z,3
+ tGravityAcc-arCoeff()-Z,4
+ tBodyAccJerk-arCoeff()-X,1
+ tBodyAccJerk-arCoeff()-X,2
+ tBodyAccJerk-arCoeff()-X,3
+ tBodyAccJerk-arCoeff()-X,4
+ tBodyAccJerk-arCoeff()-Y,1
+ tBodyAccJerk-arCoeff()-Y,2
+ tBodyAccJerk-arCoeff()-Y,3
+ tBodyAccJerk-arCoeff()-Y,4
+ tBodyAccJerk-arCoeff()-Z,1
+ tBodyAccJerk-arCoeff()-Z,2
+ tBodyAccJerk-arCoeff()-Z,3
+ tBodyAccJerk-arCoeff()-Z,4
+ tBodyGyro-arCoeff()-X,1
+ tBodyGyro-arCoeff()-X,2
+ tBodyGyro-arCoeff()-X,3
+ tBodyGyro-arCoeff()-X,4
+ tBodyGyro-arCoeff()-Y,1
+ tBodyGyro-arCoeff()-Y,2
+ tBodyGyro-arCoeff()-Y,3
+ tBodyGyro-arCoeff()-Y,4
+ tBodyGyro-arCoeff()-Z,1
+ tBodyGyro-arCoeff()-Z,2
+ tBodyGyro-arCoeff()-Z,3
+ tBodyGyro-arCoeff()-Z,4
+ tBodyGyroJerk-arCoeff()-X,1
+ tBodyGyroJerk-arCoeff()-X,2
+ tBodyGyroJerk-arCoeff()-X,3
+ tBodyGyroJerk-arCoeff()-X,4
+ tBodyGyroJerk-arCoeff()-Y,1
+ tBodyGyroJerk-arCoeff()-Y,2
+ tBodyGyroJerk-arCoeff()-Y,3
+ tBodyGyroJerk-arCoeff()-Y,4
+ tBodyGyroJerk-arCoeff()-Z,1
+ tBodyGyroJerk-arCoeff()-Z,2
+ tBodyGyroJerk-arCoeff()-Z,3
+ tBodyGyroJerk-arCoeff()-Z,4
+ tBodyAccMag-arCoeff()1
+ tBodyAccMag-arCoeff()2
+ tBodyAccMag-arCoeff()3
+ tBodyAccMag-arCoeff()4
+ tGravityAccMag-arCoeff()1
+ tGravityAccMag-arCoeff()2
+ tGravityAccMag-arCoeff()3
+ tGravityAccMag-arCoeff()4
+ tBodyAccJerkMag-arCoeff()1
+ tBodyAccJerkMag-arCoeff()2
+ tBodyAccJerkMag-arCoeff()3
+ tBodyAccJerkMag-arCoeff()4
+ tBodyGyroMag-arCoeff()1
+ tBodyGyroMag-arCoeff()2
+ tBodyGyroMag-arCoeff()3
+ tBodyGyroMag-arCoeff()4
+ tBodyGyroJerkMag-arCoeff()1
+ tBodyGyroJerkMag-arCoeff()2
+ tBodyGyroJerkMag-arCoeff()3
+ tBodyGyroJerkMag-arCoeff()4

*Correlation coefficient between two signals*

+ tBodyAcc-correlation()-X,Y
+ tBodyAcc-correlation()-X,Z
+ tBodyAcc-correlation()-Y,Z
+ tGravityAcc-correlation()-X,Y
+ tGravityAcc-correlation()-X,Z
+ tGravityAcc-correlation()-Y,Z
+ tBodyAccJerk-correlation()-X,Y
+ tBodyAccJerk-correlation()-X,Z
+ tBodyAccJerk-correlation()-Y,Z
+ tBodyGyro-correlation()-X,Y
+ tBodyGyro-correlation()-X,Z
+ tBodyGyro-correlation()-Y,Z
+ tBodyGyroJerk-correlation()-X,Y
+ tBodyGyroJerk-correlation()-X,Z
+ tBodyGyroJerk-correlation()-Y,Z

*Index of the frequency component with largest magnitude*

+ fBodyAcc-maxInds-X
+ fBodyAcc-maxInds-Y
+ fBodyAcc-maxInds-Z
+ fBodyAccJerk-maxInds-X
+ fBodyAccJerk-maxInds-Y
+ fBodyAccJerk-maxInds-Z
+ fBodyGyro-maxInds-X
+ fBodyGyro-maxInds-Y
+ fBodyGyro-maxInds-Z
+ fBodyAccMag-maxInds
+ fBodyBodyAccJerkMag-maxInds
+ fBodyBodyGyroMag-maxInds
+ fBodyBodyGyroJerkMag-maxInds

*Weighted average of the frequency components to obtain a mean frequency*

+ fBodyAcc-meanFreq()-X
+ fBodyAcc-meanFreq()-Y
+ fBodyAcc-meanFreq()-Z
+ fBodyAccJerk-meanFreq()-X
+ fBodyAccJerk-meanFreq()-Y
+ fBodyAccJerk-meanFreq()-Z
+ fBodyGyro-meanFreq()-X
+ fBodyGyro-meanFreq()-Y
+ fBodyGyro-meanFreq()-Z
+ fBodyAccMag-meanFreq()
+ fBodyBodyAccJerkMag-meanFreq()
+ fBodyBodyGyroMag-meanFreq()
+ fBodyBodyGyroJerkMag-meanFreq()

*Skewness of the frequency domain signal*

+ fBodyAcc-skewness()-X
+ fBodyAcc-skewness()-Y
+ fBodyAcc-skewness()-Z
+ fBodyAccJerk-skewness()-X
+ fBodyAccJerk-skewness()-Y
+ fBodyAccJerk-skewness()-Z
+ fBodyGyro-skewness()-X
+ fBodyGyro-skewness()-Y
+ fBodyGyro-skewness()-Z
+ fBodyAccMag-skewness()
+ fBodyBodyAccJerkMag-skewness()
+ fBodyBodyGyroMag-skewness()
+ fBodyBodyGyroJerkMag-skewness()

*Kurtosis of the frequency domain signal*

+ fBodyAcc-kurtosis()-X
+ fBodyAcc-kurtosis()-Y
+ fBodyAcc-kurtosis()-Z
+ fBodyAccJerk-kurtosis()-X
+ fBodyAccJerk-kurtosis()-Y
+ fBodyAccJerk-kurtosis()-Z
+ fBodyGyro-kurtosis()-X
+ fBodyGyro-kurtosis()-Y
+ fBodyGyro-kurtosis()-Z
+ fBodyAccMag-kurtosis()
+ fBodyBodyAccJerkMag-kurtosis()
+ fBodyBodyGyroMag-kurtosis()
+ fBodyBodyGyroJerkMag-kurtosis()

*Energy of frequency interval within the 64 bins of FFT of each window*

+ fBodyAcc-bandsEnergy()-1,8
+ fBodyAcc-bandsEnergy()-9,16
+ fBodyAcc-bandsEnergy()-17,24
+ fBodyAcc-bandsEnergy()-25,32
+ fBodyAcc-bandsEnergy()-33,40
+ fBodyAcc-bandsEnergy()-41,48
+ fBodyAcc-bandsEnergy()-49,56
+ fBodyAcc-bandsEnergy()-57,64
+ fBodyAcc-bandsEnergy()-1,16
+ fBodyAcc-bandsEnergy()-17,32
+ fBodyAcc-bandsEnergy()-33,48
+ fBodyAcc-bandsEnergy()-49,64
+ fBodyAcc-bandsEnergy()-1,24
+ fBodyAcc-bandsEnergy()-25,48
+ fBodyAcc-bandsEnergy()-1,8
+ fBodyAcc-bandsEnergy()-9,16
+ fBodyAcc-bandsEnergy()-17,24
+ fBodyAcc-bandsEnergy()-25,32
+ fBodyAcc-bandsEnergy()-33,40
+ fBodyAcc-bandsEnergy()-41,48
+ fBodyAcc-bandsEnergy()-49,56
+ fBodyAcc-bandsEnergy()-57,64
+ fBodyAcc-bandsEnergy()-1,16
+ fBodyAcc-bandsEnergy()-17,32
+ fBodyAcc-bandsEnergy()-33,48
+ fBodyAcc-bandsEnergy()-49,64
+ fBodyAcc-bandsEnergy()-1,24
+ fBodyAcc-bandsEnergy()-25,48
+ fBodyAcc-bandsEnergy()-1,8
+ fBodyAcc-bandsEnergy()-9,16
+ fBodyAcc-bandsEnergy()-17,24
+ fBodyAcc-bandsEnergy()-25,32
+ fBodyAcc-bandsEnergy()-33,40
+ fBodyAcc-bandsEnergy()-41,48
+ fBodyAcc-bandsEnergy()-49,56
+ fBodyAcc-bandsEnergy()-57,64
+ fBodyAcc-bandsEnergy()-1,16
+ fBodyAcc-bandsEnergy()-17,32
+ fBodyAcc-bandsEnergy()-33,48
+ fBodyAcc-bandsEnergy()-49,64
+ fBodyAcc-bandsEnergy()-1,24
+ fBodyAcc-bandsEnergy()-25,48
+ fBodyAccJerk-bandsEnergy()-1,8
+ fBodyAccJerk-bandsEnergy()-9,16
+ fBodyAccJerk-bandsEnergy()-17,24
+ fBodyAccJerk-bandsEnergy()-25,32
+ fBodyAccJerk-bandsEnergy()-33,40
+ fBodyAccJerk-bandsEnergy()-41,48
+ fBodyAccJerk-bandsEnergy()-49,56
+ fBodyAccJerk-bandsEnergy()-57,64
+ fBodyAccJerk-bandsEnergy()-1,16
+ fBodyAccJerk-bandsEnergy()-17,32
+ fBodyAccJerk-bandsEnergy()-33,48
+ fBodyAccJerk-bandsEnergy()-49,64
+ fBodyAccJerk-bandsEnergy()-1,24
+ fBodyAccJerk-bandsEnergy()-25,48
+ fBodyAccJerk-bandsEnergy()-1,8
+ fBodyAccJerk-bandsEnergy()-9,16
+ fBodyAccJerk-bandsEnergy()-17,24
+ fBodyAccJerk-bandsEnergy()-25,32
+ fBodyAccJerk-bandsEnergy()-33,40
+ fBodyAccJerk-bandsEnergy()-41,48
+ fBodyAccJerk-bandsEnergy()-49,56
+ fBodyAccJerk-bandsEnergy()-57,64
+ fBodyAccJerk-bandsEnergy()-1,16
+ fBodyAccJerk-bandsEnergy()-17,32
+ fBodyAccJerk-bandsEnergy()-33,48
+ fBodyAccJerk-bandsEnergy()-49,64
+ fBodyAccJerk-bandsEnergy()-1,24
+ fBodyAccJerk-bandsEnergy()-25,48
+ fBodyAccJerk-bandsEnergy()-1,8
+ fBodyAccJerk-bandsEnergy()-9,16
+ fBodyAccJerk-bandsEnergy()-17,24
+ fBodyAccJerk-bandsEnergy()-25,32
+ fBodyAccJerk-bandsEnergy()-33,40
+ fBodyAccJerk-bandsEnergy()-41,48
+ fBodyAccJerk-bandsEnergy()-49,56
+ fBodyAccJerk-bandsEnergy()-57,64
+ fBodyAccJerk-bandsEnergy()-1,16
+ fBodyAccJerk-bandsEnergy()-17,32
+ fBodyAccJerk-bandsEnergy()-33,48
+ fBodyAccJerk-bandsEnergy()-49,64
+ fBodyAccJerk-bandsEnergy()-1,24
+ fBodyAccJerk-bandsEnergy()-25,48
+ fBodyGyro-bandsEnergy()-1,8
+ fBodyGyro-bandsEnergy()-9,16
+ fBodyGyro-bandsEnergy()-17,24
+ fBodyGyro-bandsEnergy()-25,32
+ fBodyGyro-bandsEnergy()-33,40
+ fBodyGyro-bandsEnergy()-41,48
+ fBodyGyro-bandsEnergy()-49,56
+ fBodyGyro-bandsEnergy()-57,64
+ fBodyGyro-bandsEnergy()-1,16
+ fBodyGyro-bandsEnergy()-17,32
+ fBodyGyro-bandsEnergy()-33,48
+ fBodyGyro-bandsEnergy()-49,64
+ fBodyGyro-bandsEnergy()-1,24
+ fBodyGyro-bandsEnergy()-25,48
+ fBodyGyro-bandsEnergy()-1,8
+ fBodyGyro-bandsEnergy()-9,16
+ fBodyGyro-bandsEnergy()-17,24
+ fBodyGyro-bandsEnergy()-25,32
+ fBodyGyro-bandsEnergy()-33,40
+ fBodyGyro-bandsEnergy()-41,48
+ fBodyGyro-bandsEnergy()-49,56
+ fBodyGyro-bandsEnergy()-57,64
+ fBodyGyro-bandsEnergy()-1,16
+ fBodyGyro-bandsEnergy()-17,32
+ fBodyGyro-bandsEnergy()-33,48
+ fBodyGyro-bandsEnergy()-49,64
+ fBodyGyro-bandsEnergy()-1,24
+ fBodyGyro-bandsEnergy()-25,48
+ fBodyGyro-bandsEnergy()-1,8
+ fBodyGyro-bandsEnergy()-9,16
+ fBodyGyro-bandsEnergy()-17,24
+ fBodyGyro-bandsEnergy()-25,32
+ fBodyGyro-bandsEnergy()-33,40
+ fBodyGyro-bandsEnergy()-41,48
+ fBodyGyro-bandsEnergy()-49,56
+ fBodyGyro-bandsEnergy()-57,64
+ fBodyGyro-bandsEnergy()-1,16
+ fBodyGyro-bandsEnergy()-17,32
+ fBodyGyro-bandsEnergy()-33,48
+ fBodyGyro-bandsEnergy()-49,64
+ fBodyGyro-bandsEnergy()-1,24
+ fBodyGyro-bandsEnergy()-25,48

*Angle between two vectors*

Vectors obtained by averaging signals in signal window sample, using angle() 
variable

+ angle(tBodyAccMean,gravity)
+ angle(tBodyAccJerkMean),gravityMean)
+ angle(tBodyGyroMean,gravityMean)
+ angle(tBodyGyroJerkMean,gravityMean)
+ angle(X,gravityMean)
+ angle(Y,gravityMean)
+ angle(Z,gravityMean)

###Tidy Data Set retained vectors; 79 total

*Cleaned variable names*

Names were derived according to the steps indicated in script overview in Study Guide section above.  Only names were adjusted; no modification to original vector measure, derivation, or values

+ TimeDomainBodyAccelerometer_mean_X (units m/s^2)
+ TimeDomainBodyAccelerometer_mean_Y (units m/s^2)
+ TimeDomainBodyAccelerometer_mean_Z (units m/s^2)
+ TimeDomainGravityAccelerometer_mean_X (units m/s^2)
+ TimeDomainGravityAccelerometer_mean_Y (units m/s^2)
+ TimeDomainGravityAccelerometer_mean_Z (units m/s^2)
+ TimeDomainBodyAccelerometerJerk_mean_X (units m/s^2)
+ TimeDomainBodyAccelerometerJerk_mean_Y (units m/s^2)
+ TimeDomainBodyAccelerometerJerk_mean_Z (units m/s^2)
+ TimeDomainBodyGyroscope_mean_X (units radians/s)
+ TimeDomainBodyGyroscope_mean_Y (units radians/s)
+ TimeDomainBodyGyroscope_mean_Z (units radians/s)
+ TimeDomainBodyGyroscopeJerk_mean_X (units radians/s)
+ TimeDomainBodyGyroscopeJerk_mean_Y (units radians/s)
+ TimeDomainBodyGyroscopeJerk_mean_Z (units radians/s)
+ TimeDomainBodyAccelerometerMag_mean (units m/s^2)
+ TimeDomainGravityAccelerometerMag_mean (units m/s^2)
+ TimeDomainBodyAccelerometerJerkMag_mean (units m/s^2)
+ TimeDomainBodyGyroscopeMag_mean (units radians/s)
+ TimeDomainBodyGyroscopeJerkMag_mean (units radians/s)
+ FreqDomainBodyAccelerometer_mean_X (units m/s^2)
+ FreqDomainBodyAccelerometer_mean_Y (units m/s^2)
+ FreqDomainBodyAccelerometer_mean_Z (units m/s^2)
+ FreqDomainBodyAccelerometer_meanFreq_X (units m/s^2)
+ FreqDomainBodyAccelerometer_meanFreq_Y (units m/s^2)
+ FreqDomainBodyAccelerometer_meanFreq_Z (units m/s^2)
+ FreqDomainBodyAccelerometerJerk_mean_X (units m/s^2)
+ FreqDomainBodyAccelerometerJerk_mean_Y (units m/s^2)
+ FreqDomainBodyAccelerometerJerk_mean_Z (units m/s^2)
+ FreqDomainBodyAccelerometerJerk_meanFreq_X (units m/s^2)
+ FreqDomainBodyAccelerometerJerk_meanFreq_Y (units m/s^2)
+ FreqDomainBodyAccelerometerJerk_meanFreq_Z (units m/s^2)
+ FreqDomainBodyGyroscope_mean_X (units radians/s)
+ FreqDomainBodyGyroscope_mean_Y (units radians/s)
+ FreqDomainBodyGyroscope_mean_Z (units radians/s)
+ FreqDomainBodyGyroscope_meanFreq_X (units radians/s)
+ FreqDomainBodyGyroscope_meanFreq_Y (units radians/s)
+ FreqDomainBodyGyroscope_meanFreq_Z (units radians/s)
+ FreqDomainBodyAccelerometerMag_mean (units m/s^2)
+ FreqDomainBodyAccelerometerMag_meanFreq (units m/s^2)
+ FreqDomainBodyAccelerometerJerkMag_mean (units m/s^2)
+ FreqDomainBodyAccelerometerJerkMag_meanFreq (units m/s^2)
+ FreqDomainBodyGyroscopeMag_mean (units radians/s)
+ FreqDomainBodyGyroscopeMag_meanFreq (units radians/s)
+ FreqDomainBodyGyroscopeJerkMag_mean (units radians/s)
+ FreqDomainBodyGyroscopeJerkMag_meanFreq (units radians/s)
+ TimeDomainBodyAccelerometer_std_X (units m/s^2)
+ TimeDomainBodyAccelerometer_std_Y (units m/s^2)
+ TimeDomainBodyAccelerometer_std_Z (units m/s^2)
+ TimeDomainGravityAccelerometer_std_X (units m/s^2)
+ TimeDomainGravityAccelerometer_std_Y (units m/s^2)
+ TimeDomainGravityAccelerometer_std_Z (units m/s^2)
+ TimeDomainBodyAccelerometerJerk_std_X (units m/s^2)
+ TimeDomainBodyAccelerometerJerk_std_Y (units m/s^2)
+ TimeDomainBodyAccelerometerJerk_std_Z (units m/s^2)
+ TimeDomainBodyGyroscope_std_X (units radians/s)
+ TimeDomainBodyGyroscope_std_Y (units radians/s)
+ TimeDomainBodyGyroscope_std_Z (units radians/s)
+ TimeDomainBodyGyroscopeJerk_std_X (units radians/s)
+ TimeDomainBodyGyroscopeJerk_std_Y (units radians/s)
+ TimeDomainBodyGyroscopeJerk_std_Z (units radians/s)
+ TimeDomainBodyAccelerometerMag_std (units m/s^2)
+ TimeDomainGravityAccelerometerMag_std (units m/s^2)
+ TimeDomainBodyAccelerometerJerkMag_std (units m/s^2)
+ TimeDomainBodyGyroscopeMag_std (units radians/s)
+ TimeDomainBodyGyroscopeJerkMag_std (units radians/s)
+ FreqDomainBodyAccelerometer_std_X (units m/s^2)
+ FreqDomainBodyAccelerometer_std_Y (units m/s^2)
+ FreqDomainBodyAccelerometer_std_Z (units m/s^2)
+ FreqDomainBodyAccelerometerJerk_std_X (units m/s^2)
+ FreqDomainBodyAccelerometerJerk_std_Y (units m/s^2)
+ FreqDomainBodyAccelerometerJerk_std_Z (units m/s^2)
+ FreqDomainBodyGyroscope_std_X (units radians/s)
+ FreqDomainBodyGyroscope_std_Y (units radians/s)
+ FreqDomainBodyGyroscope_std_Z (units radians/s)
+ FreqDomainBodyAccelerometerMag_std (units m/s^2)
+ FreqDomainBodyAccelerometerJerkMag_std (units m/s^2)
+ FreqDomainBodyGyroscopeMag_std (units radians/s)
+ FreqDomainBodyGyroscopeJerkMag_std (units radians/s)