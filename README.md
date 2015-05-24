# getdata-014: Getting and Cleaning Data - Course Project
## Running run_analysis.R:
1. Download the zip file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip file
3. Load the data by calling mergeDatasets() with unzipped data directory of 'UCI HAR Dataset'.
    * i.e.:
        - uciHarDataFrame <- mergeDatasets('UCI HAR Dataset')
    * If the 'UCI HAR Dataset' is not in your current working directory, use the full path for the 'UCI HAR Dataset' directory.
4. To create the independent tidy data set with the average of each variable for each activity and each subject, call getTidyUciHarMeanByActivitySubject() with the result of mergeDatasets()
    * i.e.:
        - tidyUciHarMeanByActivitySubject <- getTidyUciHarMeanByActivitySubject(uciHarDataFrame)
    
## Dependencies
run\_analysis.R uses dplyr.  If it is not already installed, run_analysis.R will try to install it for you when you run it.
