# getdata-014: Getting and Cleaning Data - Course Project
## Running run\_analysis.R
### Download and unzip the data
1. Download the zip file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip file in the current working directory. (You can either get your current working directory before you unzip the file with getwd() or set it after you unzip the file with setwd().)

### Load and run run\_analysis.R
#### Running the script will do the following:
1. Load the data by calling mergeDatasets() with unzipped data directory of 'UCI HAR Dataset' by calling:
    * uciHarDataFrame <- mergeDatasets('UCI HAR Dataset')
2. To create the independent tidy data set with the average of each variable for each activity and each subject, it will call getTidyUciHarMeanByActivitySubject() with the result of mergeDatasets().
3. The output of getTidyUciHarMeanByActivitySubject() will be writen to a file called 'tidyUciHarMeanByActivitySubject.txt', in the current working directory.
    
## Dependencies
1. run\_analysis.R uses dplyr.  If it is not already installed, run_analysis.R will try to install it for you when you run it.
2. run\_analysis.R expects the 'UCI HAR Dataset' directory to be in the current working directory.
