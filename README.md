##README

This README is associated with an assignment to complete data cleaning for data originally generated in a Center for Machine Learning and Intelligent Systems study.

####Code Book

Please refer to the CodeBook.md file in this directory for overview information on the original study, references to that study, as well as details on the data cleaning assignment that has been completed.

Once the CodeBook.md has been reviewed, please proceed with the following to validate the results of the data cleaning assignment.

####Data Setup

As stated in the CodeBook.md, it is assumed that the original study data has been previously downloaded as peer reviewers completed the same assignment.  If this has not been done, please follow these steps
  
  * download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
  * extract all files to a local directory

####Validation Setup

Step 1: Copy the run_analysis.R script in this GitHub directory to the local directory containing the extracted study data.  This can be accomplished with git, or by clicking on script in this Github directory, accessing the Raw form of the file, copying script contents, and saving to local directory

Step 2: Copy the compareTidyDatasets.R script down to directory containing the study data in manner similar to step #1

####Validation Steps

Step 1: From R console, setwd() to the local directory containing the study files.

Step 2: Run the run_analysis.R script from R console.  This may take several seconds to complete due to the reading of the large study files.

Step 3: Validate that a new dataset named tidydata.txt has been stored in working directory.

Step 4: Open the compareTidyDatasets.R script, and validate the fileURL reflects the tidy dataset indicated in the Coursera submission

Step 5: Run the compareTidyDatasets.R script from R console.  Script downloads the Coursera submitted tidy dataset and compares to the dataset generated in Step #2.  Result of TRUE will display to console.  If result displays FALSE, review previous steps to ensure all were followed.
