###Original Study derived variables from initial signals

---

####***Variable base names***

The following base names were leveraged for naming of all subsequent       estimated variables in the original study.  No measured values are associated with these names.  

Units are noted next to the base name below; estimated vectors from study share units with these base names.  

All measurements were normalized and bounded with [-1,1] in the original study

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

---

####***Estimated values from derived signals*** (561 vectors)

---

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

*Energy of frequency interval within the 64 bins of Fast Fourier Transform of each window*

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