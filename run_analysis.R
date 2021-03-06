if("dplyr" %in% rownames(installed.packages()) == FALSE) {
  install.packages("dplyr")
}
library(dplyr)

#3 - convertActivityCodeToName()
# DESCRIPTION: Uses descriptive activity names to name the activities in the data set
# INPUT: activityCode - integer value from 1 to 6
# OUTPUT: returns corresponding Activity Code name
convertActivityCodeToName <- function(activityCode) {
  activityMap <- c('WALKING', 'WALKING_UPSTAIRS',
                    'WALKING_DOWNSTAIRS', 'SITTING',
                    'STANDING', 'LAYING')
  
  activityMap[activityCode]
}

#1 - mergeDatasets()  
# DESCRIPTION: Merges the training and the test sets to create one data set.
# INPUT: dir - the directory for "UCI HAR Dataset"
# OUTPUT: returns a uciHarDataFrame (a data.frame of the merged data for test and train. 
#         See code book for more details.)
# EXAMPLE: mergeDatasets('UCI HAR Dataset')
mergeDatasets <- function(dir) {
  #4 Appropriately labels the data set with descriptive variable names.   
  cnames <- list(c('subject'), 
                 c('tBodyAcc.mean.X',
                   'tBodyAcc.mean.Y',
                   'tBodyAcc.mean.Z',
                   'tBodyAcc.std.X',
                   'tBodyAcc.std.Y',
                   'tBodyAcc.std.Z',
                   'tBodyAcc.mad.X',
                   'tBodyAcc.mad.Y',
                   'tBodyAcc.mad.Z',
                   'tBodyAcc.max.X',
                   'tBodyAcc.max.Y',
                   'tBodyAcc.max.Z',
                   'tBodyAcc.min.X',
                   'tBodyAcc.min.Y',
                   'tBodyAcc.min.Z',
                   'tBodyAcc.sma',
                   'tBodyAcc.energy.X',
                   'tBodyAcc.energy.Y',
                   'tBodyAcc.energy.Z',
                   'tBodyAcc.iqr.X',
                   'tBodyAcc.iqr.Y',
                   'tBodyAcc.iqr.Z',
                   'tBodyAcc.entropy.X',
                   'tBodyAcc.entropy.Y',
                   'tBodyAcc.entropy.Z',
                   'tBodyAcc.arCoeff.X.1',
                   'tBodyAcc.arCoeff.X.2',
                   'tBodyAcc.arCoeff.X.3',
                   'tBodyAcc.arCoeff.X.4',
                   'tBodyAcc.arCoeff.Y.1',
                   'tBodyAcc.arCoeff.Y.2',
                   'tBodyAcc.arCoeff.Y.3',
                   'tBodyAcc.arCoeff.Y.4',
                   'tBodyAcc.arCoeff.Z.1',
                   'tBodyAcc.arCoeff.Z.2',
                   'tBodyAcc.arCoeff.Z.3',
                   'tBodyAcc.arCoeff.Z.4',
                   'tBodyAcc.correlation.X.Y',
                   'tBodyAcc.correlation.X.Z',
                   'tBodyAcc.correlation.Y.Z',
                   'tGravityAcc.mean.X',
                   'tGravityAcc.mean.Y',
                   'tGravityAcc.mean.Z',
                   'tGravityAcc.std.X',
                   'tGravityAcc.std.Y',
                   'tGravityAcc.std.Z',
                   'tGravityAcc.mad.X',
                   'tGravityAcc.mad.Y',
                   'tGravityAcc.mad.Z',
                   'tGravityAcc.max.X',
                   'tGravityAcc.max.Y',
                   'tGravityAcc.max.Z',
                   'tGravityAcc.min.X',
                   'tGravityAcc.min.Y',
                   'tGravityAcc.min.Z',
                   'tGravityAcc.sma',
                   'tGravityAcc.energy.X',
                   'tGravityAcc.energy.Y',
                   'tGravityAcc.energy.Z',
                   'tGravityAcc.iqr.X',
                   'tGravityAcc.iqr.Y',
                   'tGravityAcc.iqr.Z',
                   'tGravityAcc.entropy.X',
                   'tGravityAcc.entropy.Y',
                   'tGravityAcc.entropy.Z',
                   'tGravityAcc.arCoeff.X.1',
                   'tGravityAcc.arCoeff.X.2',
                   'tGravityAcc.arCoeff.X.3',
                   'tGravityAcc.arCoeff.X.4',
                   'tGravityAcc.arCoeff.Y.1',
                   'tGravityAcc.arCoeff.Y.2',
                   'tGravityAcc.arCoeff.Y.3',
                   'tGravityAcc.arCoeff.Y.4',
                   'tGravityAcc.arCoeff.Z.1',
                   'tGravityAcc.arCoeff.Z.2',
                   'tGravityAcc.arCoeff.Z.3',
                   'tGravityAcc.arCoeff.Z.4',
                   'tGravityAcc.correlation.X.Y',
                   'tGravityAcc.correlation.X.Z',
                   'tGravityAcc.correlation.Y.Z',
                   'tBodyAccJerk.mean.X',
                   'tBodyAccJerk.mean.Y',
                   'tBodyAccJerk.mean.Z',
                   'tBodyAccJerk.std.X',
                   'tBodyAccJerk.std.Y',
                   'tBodyAccJerk.std.Z',
                   'tBodyAccJerk.mad.X',
                   'tBodyAccJerk.mad.Y',
                   'tBodyAccJerk.mad.Z',
                   'tBodyAccJerk.max.X',
                   'tBodyAccJerk.max.Y',
                   'tBodyAccJerk.max.Z',
                   'tBodyAccJerk.min.X',
                   'tBodyAccJerk.min.Y',
                   'tBodyAccJerk.min.Z',
                   'tBodyAccJerk.sma',
                   'tBodyAccJerk.energy.X',
                   'tBodyAccJerk.energy.Y',
                   'tBodyAccJerk.energy.Z',
                   'tBodyAccJerk.iqr.X',
                   'tBodyAccJerk.iqr.Y',
                   'tBodyAccJerk.iqr.Z',
                   'tBodyAccJerk.entropy.X',
                   'tBodyAccJerk.entropy.Y',
                   'tBodyAccJerk.entropy.Z',
                   'tBodyAccJerk.arCoeff.X.1',
                   'tBodyAccJerk.arCoeff.X.2',
                   'tBodyAccJerk.arCoeff.X.3',
                   'tBodyAccJerk.arCoeff.X.4',
                   'tBodyAccJerk.arCoeff.Y.1',
                   'tBodyAccJerk.arCoeff.Y.2',
                   'tBodyAccJerk.arCoeff.Y.3',
                   'tBodyAccJerk.arCoeff.Y.4',
                   'tBodyAccJerk.arCoeff.Z.1',
                   'tBodyAccJerk.arCoeff.Z.2',
                   'tBodyAccJerk.arCoeff.Z.3',
                   'tBodyAccJerk.arCoeff.Z.4',
                   'tBodyAccJerk.correlation.X.Y',
                   'tBodyAccJerk.correlation.X.Z',
                   'tBodyAccJerk.correlation.Y.Z',
                   'tBodyGyro.mean.X',
                   'tBodyGyro.mean.Y',
                   'tBodyGyro.mean.Z',
                   'tBodyGyro.std.X',
                   'tBodyGyro.std.Y',
                   'tBodyGyro.std.Z',
                   'tBodyGyro.mad.X',
                   'tBodyGyro.mad.Y',
                   'tBodyGyro.mad.Z',
                   'tBodyGyro.max.X',
                   'tBodyGyro.max.Y',
                   'tBodyGyro.max.Z',
                   'tBodyGyro.min.X',
                   'tBodyGyro.min.Y',
                   'tBodyGyro.min.Z',
                   'tBodyGyro.sma',
                   'tBodyGyro.energy.X',
                   'tBodyGyro.energy.Y',
                   'tBodyGyro.energy.Z',
                   'tBodyGyro.iqr.X',
                   'tBodyGyro.iqr.Y',
                   'tBodyGyro.iqr.Z',
                   'tBodyGyro.entropy.X',
                   'tBodyGyro.entropy.Y',
                   'tBodyGyro.entropy.Z',
                   'tBodyGyro.arCoeff.X.1',
                   'tBodyGyro.arCoeff.X.2',
                   'tBodyGyro.arCoeff.X.3',
                   'tBodyGyro.arCoeff.X.4',
                   'tBodyGyro.arCoeff.Y.1',
                   'tBodyGyro.arCoeff.Y.2',
                   'tBodyGyro.arCoeff.Y.3',
                   'tBodyGyro.arCoeff.Y.4',
                   'tBodyGyro.arCoeff.Z.1',
                   'tBodyGyro.arCoeff.Z.2',
                   'tBodyGyro.arCoeff.Z.3',
                   'tBodyGyro.arCoeff.Z.4',
                   'tBodyGyro.correlation.X.Y',
                   'tBodyGyro.correlation.X.Z',
                   'tBodyGyro.correlation.Y.Z',
                   'tBodyGyroJerk.mean.X',
                   'tBodyGyroJerk.mean.Y',
                   'tBodyGyroJerk.mean.Z',
                   'tBodyGyroJerk.std.X',
                   'tBodyGyroJerk.std.Y',
                   'tBodyGyroJerk.std.Z',
                   'tBodyGyroJerk.mad.X',
                   'tBodyGyroJerk.mad.Y',
                   'tBodyGyroJerk.mad.Z',
                   'tBodyGyroJerk.max.X',
                   'tBodyGyroJerk.max.Y',
                   'tBodyGyroJerk.max.Z',
                   'tBodyGyroJerk.min.X',
                   'tBodyGyroJerk.min.Y',
                   'tBodyGyroJerk.min.Z',
                   'tBodyGyroJerk.sma',
                   'tBodyGyroJerk.energy.X',
                   'tBodyGyroJerk.energy.Y',
                   'tBodyGyroJerk.energy.Z',
                   'tBodyGyroJerk.iqr.X',
                   'tBodyGyroJerk.iqr.Y',
                   'tBodyGyroJerk.iqr.Z',
                   'tBodyGyroJerk.entropy.X',
                   'tBodyGyroJerk.entropy.Y',
                   'tBodyGyroJerk.entropy.Z',
                   'tBodyGyroJerk.arCoeff.X.1',
                   'tBodyGyroJerk.arCoeff.X.2',
                   'tBodyGyroJerk.arCoeff.X.3',
                   'tBodyGyroJerk.arCoeff.X.4',
                   'tBodyGyroJerk.arCoeff.Y.1',
                   'tBodyGyroJerk.arCoeff.Y.2',
                   'tBodyGyroJerk.arCoeff.Y.3',
                   'tBodyGyroJerk.arCoeff.Y.4',
                   'tBodyGyroJerk.arCoeff.Z.1',
                   'tBodyGyroJerk.arCoeff.Z.2',
                   'tBodyGyroJerk.arCoeff.Z.3',
                   'tBodyGyroJerk.arCoeff.Z.4',
                   'tBodyGyroJerk.correlation.X.Y',
                   'tBodyGyroJerk.correlation.X.Z',
                   'tBodyGyroJerk.correlation.Y.Z',
                   'tBodyAccMag.mean',
                   'tBodyAccMag.std',
                   'tBodyAccMag.mad',
                   'tBodyAccMag.max',
                   'tBodyAccMag.min',
                   'tBodyAccMag.sma',
                   'tBodyAccMag.energy',
                   'tBodyAccMag.iqr',
                   'tBodyAccMag.entropy',
                   'tBodyAccMag.arCoeff.1',
                   'tBodyAccMag.arCoeff.2',
                   'tBodyAccMag.arCoeff.3',
                   'tBodyAccMag.arCoeff.4',
                   'tGravityAccMag.mean',
                   'tGravityAccMag.std',
                   'tGravityAccMag.mad',
                   'tGravityAccMag.max',
                   'tGravityAccMag.min',
                   'tGravityAccMag.sma',
                   'tGravityAccMag.energy',
                   'tGravityAccMag.iqr',
                   'tGravityAccMag.entropy',
                   'tGravityAccMag.arCoeff.1',
                   'tGravityAccMag.arCoeff.2',
                   'tGravityAccMag.arCoeff.3',
                   'tGravityAccMag.arCoeff.4',
                   'tBodyAccJerkMag.mean',
                   'tBodyAccJerkMag.std',
                   'tBodyAccJerkMag.mad',
                   'tBodyAccJerkMag.max',
                   'tBodyAccJerkMag.min',
                   'tBodyAccJerkMag.sma',
                   'tBodyAccJerkMag.energy',
                   'tBodyAccJerkMag.iqr',
                   'tBodyAccJerkMag.entropy',
                   'tBodyAccJerkMag.arCoeff.1',
                   'tBodyAccJerkMag.arCoeff.2',
                   'tBodyAccJerkMag.arCoeff.3',
                   'tBodyAccJerkMag.arCoeff.4',
                   'tBodyGyroMag.mean',
                   'tBodyGyroMag.std',
                   'tBodyGyroMag.mad',
                   'tBodyGyroMag.max',
                   'tBodyGyroMag.min',
                   'tBodyGyroMag.sma',
                   'tBodyGyroMag.energy',
                   'tBodyGyroMag.iqr',
                   'tBodyGyroMag.entropy',
                   'tBodyGyroMag.arCoeff.1',
                   'tBodyGyroMag.arCoeff.2',
                   'tBodyGyroMag.arCoeff.3',
                   'tBodyGyroMag.arCoeff.4',
                   'tBodyGyroJerkMag.mean',
                   'tBodyGyroJerkMag.std',
                   'tBodyGyroJerkMag.mad',
                   'tBodyGyroJerkMag.max',
                   'tBodyGyroJerkMag.min',
                   'tBodyGyroJerkMag.sma',
                   'tBodyGyroJerkMag.energy',
                   'tBodyGyroJerkMag.iqr',
                   'tBodyGyroJerkMag.entropy',
                   'tBodyGyroJerkMag.arCoeff.1',
                   'tBodyGyroJerkMag.arCoeff.2',
                   'tBodyGyroJerkMag.arCoeff.3',
                   'tBodyGyroJerkMag.arCoeff.4',
                   'fBodyAcc.mean.X',
                   'fBodyAcc.mean.Y',
                   'fBodyAcc.mean.Z',
                   'fBodyAcc.std.X',
                   'fBodyAcc.std.Y',
                   'fBodyAcc.std.Z',
                   'fBodyAcc.mad.X',
                   'fBodyAcc.mad.Y',
                   'fBodyAcc.mad.Z',
                   'fBodyAcc.max.X',
                   'fBodyAcc.max.Y',
                   'fBodyAcc.max.Z',
                   'fBodyAcc.min.X',
                   'fBodyAcc.min.Y',
                   'fBodyAcc.min.Z',
                   'fBodyAcc.sma',
                   'fBodyAcc.energy.X',
                   'fBodyAcc.energy.Y',
                   'fBodyAcc.energy.Z',
                   'fBodyAcc.iqr.X',
                   'fBodyAcc.iqr.Y',
                   'fBodyAcc.iqr.Z',
                   'fBodyAcc.entropy.X',
                   'fBodyAcc.entropy.Y',
                   'fBodyAcc.entropy.Z',
                   'fBodyAcc.maxInds.X',
                   'fBodyAcc.maxInds.Y',
                   'fBodyAcc.maxInds.Z',
                   'fBodyAcc.meanFreq.X',
                   'fBodyAcc.meanFreq.Y',
                   'fBodyAcc.meanFreq.Z',
                   'fBodyAcc.skewness.X',
                   'fBodyAcc.kurtosis.X',
                   'fBodyAcc.skewness.Y',
                   'fBodyAcc.kurtosis.Y',
                   'fBodyAcc.skewness.Z',
                   'fBodyAcc.kurtosis.Z',
                   'fBodyAcc.bandsEnergy.1.8.1',
                   'fBodyAcc.bandsEnergy.9.16.1',
                   'fBodyAcc.bandsEnergy.17.24.1',
                   'fBodyAcc.bandsEnergy.25.32.1',
                   'fBodyAcc.bandsEnergy.33.40.1',
                   'fBodyAcc.bandsEnergy.41.48.1',
                   'fBodyAcc.bandsEnergy.49.56.1',
                   'fBodyAcc.bandsEnergy.57.64.1',
                   'fBodyAcc.bandsEnergy.1.16.1',
                   'fBodyAcc.bandsEnergy.17.32.1',
                   'fBodyAcc.bandsEnergy.33.48.1',
                   'fBodyAcc.bandsEnergy.49.64.1',
                   'fBodyAcc.bandsEnergy.1.24.1',
                   'fBodyAcc.bandsEnergy.25.48.1',
                   'fBodyAcc.bandsEnergy.1.8.2',
                   'fBodyAcc.bandsEnergy.9.16.2',
                   'fBodyAcc.bandsEnergy.17.24.2',
                   'fBodyAcc.bandsEnergy.25.32.2',
                   'fBodyAcc.bandsEnergy.33.40.2',
                   'fBodyAcc.bandsEnergy.41.48.2',
                   'fBodyAcc.bandsEnergy.49.56.2',
                   'fBodyAcc.bandsEnergy.57.64.2',
                   'fBodyAcc.bandsEnergy.1.16.2',
                   'fBodyAcc.bandsEnergy.17.32.2',
                   'fBodyAcc.bandsEnergy.33.48.2',
                   'fBodyAcc.bandsEnergy.49.64.2',
                   'fBodyAcc.bandsEnergy.1.24.2',
                   'fBodyAcc.bandsEnergy.25.48.2',
                   'fBodyAcc.bandsEnergy.1.8.3',
                   'fBodyAcc.bandsEnergy.9.16.3',
                   'fBodyAcc.bandsEnergy.17.24.3',
                   'fBodyAcc.bandsEnergy.25.32.3',
                   'fBodyAcc.bandsEnergy.33.40.3',
                   'fBodyAcc.bandsEnergy.41.48.3',
                   'fBodyAcc.bandsEnergy.49.56.3',
                   'fBodyAcc.bandsEnergy.57.64.3',
                   'fBodyAcc.bandsEnergy.1.16.3',
                   'fBodyAcc.bandsEnergy.17.32.3',
                   'fBodyAcc.bandsEnergy.33.48.3',
                   'fBodyAcc.bandsEnergy.49.64.3',
                   'fBodyAcc.bandsEnergy.1.24.3',
                   'fBodyAcc.bandsEnergy.25.48.3',
                   'fBodyAccJerk.mean.X',
                   'fBodyAccJerk.mean.Y',
                   'fBodyAccJerk.mean.Z',
                   'fBodyAccJerk.std.X',
                   'fBodyAccJerk.std.Y',
                   'fBodyAccJerk.std.Z',
                   'fBodyAccJerk.mad.X',
                   'fBodyAccJerk.mad.Y',
                   'fBodyAccJerk.mad.Z',
                   'fBodyAccJerk.max.X',
                   'fBodyAccJerk.max.Y',
                   'fBodyAccJerk.max.Z',
                   'fBodyAccJerk.min.X',
                   'fBodyAccJerk.min.Y',
                   'fBodyAccJerk.min.Z',
                   'fBodyAccJerk.sma',
                   'fBodyAccJerk.energy.X',
                   'fBodyAccJerk.energy.Y',
                   'fBodyAccJerk.energy.Z',
                   'fBodyAccJerk.iqr.X',
                   'fBodyAccJerk.iqr.Y',
                   'fBodyAccJerk.iqr.Z',
                   'fBodyAccJerk.entropy.X',
                   'fBodyAccJerk.entropy.Y',
                   'fBodyAccJerk.entropy.Z',
                   'fBodyAccJerk.maxInds.X',
                   'fBodyAccJerk.maxInds.Y',
                   'fBodyAccJerk.maxInds.Z',
                   'fBodyAccJerk.meanFreq.X',
                   'fBodyAccJerk.meanFreq.Y',
                   'fBodyAccJerk.meanFreq.Z',
                   'fBodyAccJerk.skewness.X',
                   'fBodyAccJerk.kurtosis.X',
                   'fBodyAccJerk.skewness.Y',
                   'fBodyAccJerk.kurtosis.Y',
                   'fBodyAccJerk.skewness.Z',
                   'fBodyAccJerk.kurtosis.Z',
                   'fBodyAccJerk.bandsEnergy.1.8.1',
                   'fBodyAccJerk.bandsEnergy.9.16.1',
                   'fBodyAccJerk.bandsEnergy.17.24.1',
                   'fBodyAccJerk.bandsEnergy.25.32.1',
                   'fBodyAccJerk.bandsEnergy.33.40.1',
                   'fBodyAccJerk.bandsEnergy.41.48.1',
                   'fBodyAccJerk.bandsEnergy.49.56.1',
                   'fBodyAccJerk.bandsEnergy.57.64.1',
                   'fBodyAccJerk.bandsEnergy.1.16.1',
                   'fBodyAccJerk.bandsEnergy.17.32.1',
                   'fBodyAccJerk.bandsEnergy.33.48.1',
                   'fBodyAccJerk.bandsEnergy.49.64.1',
                   'fBodyAccJerk.bandsEnergy.1.24.1',
                   'fBodyAccJerk.bandsEnergy.25.48.1',
                   'fBodyAccJerk.bandsEnergy.1.8.2',
                   'fBodyAccJerk.bandsEnergy.9.16.2',
                   'fBodyAccJerk.bandsEnergy.17.24.2',
                   'fBodyAccJerk.bandsEnergy.25.32.2',
                   'fBodyAccJerk.bandsEnergy.33.40.2',
                   'fBodyAccJerk.bandsEnergy.41.48.2',
                   'fBodyAccJerk.bandsEnergy.49.56.2',
                   'fBodyAccJerk.bandsEnergy.57.64.2',
                   'fBodyAccJerk.bandsEnergy.1.16.2',
                   'fBodyAccJerk.bandsEnergy.17.32.2',
                   'fBodyAccJerk.bandsEnergy.33.48.2',
                   'fBodyAccJerk.bandsEnergy.49.64.2',
                   'fBodyAccJerk.bandsEnergy.1.24.2',
                   'fBodyAccJerk.bandsEnergy.25.48.2',
                   'fBodyAccJerk.bandsEnergy.1.8.3',
                   'fBodyAccJerk.bandsEnergy.9.16.3',
                   'fBodyAccJerk.bandsEnergy.17.24.3',
                   'fBodyAccJerk.bandsEnergy.25.32.3',
                   'fBodyAccJerk.bandsEnergy.33.40.3',
                   'fBodyAccJerk.bandsEnergy.41.48.3',
                   'fBodyAccJerk.bandsEnergy.49.56.3',
                   'fBodyAccJerk.bandsEnergy.57.64.3',
                   'fBodyAccJerk.bandsEnergy.1.16.3',
                   'fBodyAccJerk.bandsEnergy.17.32.3',
                   'fBodyAccJerk.bandsEnergy.33.48.3',
                   'fBodyAccJerk.bandsEnergy.49.64.3',
                   'fBodyAccJerk.bandsEnergy.1.24.3',
                   'fBodyAccJerk.bandsEnergy.25.48.3',
                   'fBodyGyro.mean.X',
                   'fBodyGyro.mean.Y',
                   'fBodyGyro.mean.Z',
                   'fBodyGyro.std.X',
                   'fBodyGyro.std.Y',
                   'fBodyGyro.std.Z',
                   'fBodyGyro.mad.X',
                   'fBodyGyro.mad.Y',
                   'fBodyGyro.mad.Z',
                   'fBodyGyro.max.X',
                   'fBodyGyro.max.Y',
                   'fBodyGyro.max.Z',
                   'fBodyGyro.min.X',
                   'fBodyGyro.min.Y',
                   'fBodyGyro.min.Z',
                   'fBodyGyro.sma',
                   'fBodyGyro.energy.X',
                   'fBodyGyro.energy.Y',
                   'fBodyGyro.energy.Z',
                   'fBodyGyro.iqr.X',
                   'fBodyGyro.iqr.Y',
                   'fBodyGyro.iqr.Z',
                   'fBodyGyro.entropy.X',
                   'fBodyGyro.entropy.Y',
                   'fBodyGyro.entropy.Z',
                   'fBodyGyro.maxInds.X',
                   'fBodyGyro.maxInds.Y',
                   'fBodyGyro.maxInds.Z',
                   'fBodyGyro.meanFreq.X',
                   'fBodyGyro.meanFreq.Y',
                   'fBodyGyro.meanFreq.Z',
                   'fBodyGyro.skewness.X',
                   'fBodyGyro.kurtosis.X',
                   'fBodyGyro.skewness.Y',
                   'fBodyGyro.kurtosis.Y',
                   'fBodyGyro.skewness.Z',
                   'fBodyGyro.kurtosis.Z',
                   'fBodyGyro.bandsEnergy.1.8.1',
                   'fBodyGyro.bandsEnergy.9.16.1',
                   'fBodyGyro.bandsEnergy.17.24.1',
                   'fBodyGyro.bandsEnergy.25.32.1',
                   'fBodyGyro.bandsEnergy.33.40.1',
                   'fBodyGyro.bandsEnergy.41.48.1',
                   'fBodyGyro.bandsEnergy.49.56.1',
                   'fBodyGyro.bandsEnergy.57.64.1',
                   'fBodyGyro.bandsEnergy.1.16.1',
                   'fBodyGyro.bandsEnergy.17.32.1',
                   'fBodyGyro.bandsEnergy.33.48.1',
                   'fBodyGyro.bandsEnergy.49.64.1',
                   'fBodyGyro.bandsEnergy.1.24.1',
                   'fBodyGyro.bandsEnergy.25.48.1',
                   'fBodyGyro.bandsEnergy.1.8.2',
                   'fBodyGyro.bandsEnergy.9.16.2',
                   'fBodyGyro.bandsEnergy.17.24.2',
                   'fBodyGyro.bandsEnergy.25.32.2',
                   'fBodyGyro.bandsEnergy.33.40.2',
                   'fBodyGyro.bandsEnergy.41.48.2',
                   'fBodyGyro.bandsEnergy.49.56.2',
                   'fBodyGyro.bandsEnergy.57.64.2',
                   'fBodyGyro.bandsEnergy.1.16.2',
                   'fBodyGyro.bandsEnergy.17.32.2',
                   'fBodyGyro.bandsEnergy.33.48.2',
                   'fBodyGyro.bandsEnergy.49.64.2',
                   'fBodyGyro.bandsEnergy.1.24.2',
                   'fBodyGyro.bandsEnergy.25.48.2',
                   'fBodyGyro.bandsEnergy.1.8.3',
                   'fBodyGyro.bandsEnergy.9.16.3',
                   'fBodyGyro.bandsEnergy.17.24.3',
                   'fBodyGyro.bandsEnergy.25.32.3',
                   'fBodyGyro.bandsEnergy.33.40.3',
                   'fBodyGyro.bandsEnergy.41.48.3',
                   'fBodyGyro.bandsEnergy.49.56.3',
                   'fBodyGyro.bandsEnergy.57.64.3',
                   'fBodyGyro.bandsEnergy.1.16.3',
                   'fBodyGyro.bandsEnergy.17.32.3',
                   'fBodyGyro.bandsEnergy.33.48.3',
                   'fBodyGyro.bandsEnergy.49.64.3',
                   'fBodyGyro.bandsEnergy.1.24.3',
                   'fBodyGyro.bandsEnergy.25.48.3',
                   'fBodyAccMag.mean',
                   'fBodyAccMag.std',
                   'fBodyAccMag.mad',
                   'fBodyAccMag.max',
                   'fBodyAccMag.min',
                   'fBodyAccMag.sma',
                   'fBodyAccMag.energy',
                   'fBodyAccMag.iqr',
                   'fBodyAccMag.entropy',
                   'fBodyAccMag.maxInds',
                   'fBodyAccMag.meanFreq',
                   'fBodyAccMag.skewness',
                   'fBodyAccMag.kurtosis',
                   'fBodyBodyAccJerkMag.mean',
                   'fBodyBodyAccJerkMag.std',
                   'fBodyBodyAccJerkMag.mad',
                   'fBodyBodyAccJerkMag.max',
                   'fBodyBodyAccJerkMag.min',
                   'fBodyBodyAccJerkMag.sma',
                   'fBodyBodyAccJerkMag.energy',
                   'fBodyBodyAccJerkMag.iqr',
                   'fBodyBodyAccJerkMag.entropy',
                   'fBodyBodyAccJerkMag.maxInds',
                   'fBodyBodyAccJerkMag.meanFreq',
                   'fBodyBodyAccJerkMag.skewness',
                   'fBodyBodyAccJerkMag.kurtosis',
                   'fBodyBodyGyroMag.mean',
                   'fBodyBodyGyroMag.std',
                   'fBodyBodyGyroMag.mad',
                   'fBodyBodyGyroMag.max',
                   'fBodyBodyGyroMag.min',
                   'fBodyBodyGyroMag.sma',
                   'fBodyBodyGyroMag.energy',
                   'fBodyBodyGyroMag.iqr',
                   'fBodyBodyGyroMag.entropy',
                   'fBodyBodyGyroMag.maxInds',
                   'fBodyBodyGyroMag.meanFreq',
                   'fBodyBodyGyroMag.skewness',
                   'fBodyBodyGyroMag.kurtosis',
                   'fBodyBodyGyroJerkMag.mean',
                   'fBodyBodyGyroJerkMag.std',
                   'fBodyBodyGyroJerkMag.mad',
                   'fBodyBodyGyroJerkMag.max',
                   'fBodyBodyGyroJerkMag.min',
                   'fBodyBodyGyroJerkMag.sma',
                   'fBodyBodyGyroJerkMag.energy',
                   'fBodyBodyGyroJerkMag.iqr',
                   'fBodyBodyGyroJerkMag.entropy',
                   'fBodyBodyGyroJerkMag.maxInds',
                   'fBodyBodyGyroJerkMag.meanFreq',
                   'fBodyBodyGyroJerkMag.skewness',
                   'fBodyBodyGyroJerkMag.kurtosis',
                   'angle.tBodyAccMean.gravity',
                   'angle.tBodyAccJerkMean.gravityMean',
                   'angle.tBodyGyroMean.gravityMean',
                   'angle.tBodyGyroJerkMean.gravityMean',
                   'angle.X.gravityMean',
                   'angle.Y.gravityMean',
                   'angle.Z.gravityMean'), 
                  c('activity'))
  testFilenames <- c("test/subject_test.txt", "test/X_test.txt", "test/y_test.txt")
  trainFilenames <- c("train/subject_train.txt", "train/X_train.txt", "train/y_train.txt")
  
  uciHarDataFrame <- NULL

  for(i in 1:length(testFilenames)) {
    testFilename <- testFilenames[i]
    trainFilename <- trainFilenames[i]
      
    #currData1 <- read.table(file=paste('.', dir, testFilename, sep='/'))
    #currData2 <- read.table(file=paste('.', dir, trainFilename, sep='/'))
    currData1 <- read.table(file=paste(dir, testFilename, sep='/'))
    currData2 <- read.table(file=paste(dir, trainFilename, sep='/'))    
    currData <- rbind(currData1, currData2)
    
    if (i == 3) {
      currData <- data.frame(apply(currData, 1, convertActivityCodeToName))
    }
    
    currColNames <- cnames[[i]]
    
    if (is.null(uciHarDataFrame)) {
      colnames(currData) <- currColNames
      uciHarDataFrame <- currData
    } else {
      colnames(currData) <- currColNames
      uciHarDataFrame <- cbind(uciHarDataFrame, currData, deparse.level = 0)
    }
  }
  
  # 2 - filter out all columns except subject, activity and the mean and std measurements
  measureCols <- cnames[[2]]
  filteredMeasureCols <- measureCols[grepl("\\.(mean$|mean\\.|std)", measureCols)]
  filterCols <- append(filteredMeasureCols, c('subject', 'activity'), after = 0)
  
  uciHarDataFrame[, filterCols]
}

#5 - getTidyUciHarMeanByActivitySubject()
# DESCRIPTION: From the data set in step 4, creates a second, independent tidy data set with the average 
#              of each variable for each activity and each subject.
# INPUT: uciHarDataFrame - the output of mergeDatasets()  
# OUTPUT: returns a new data.frame with the mean of each numeric value by Activity and Subject
getTidyUciHarMeanByActivitySubject <- function(uciHarDataFrame) {
  g <- uciHarDataFrame %>% group_by(activity, subject)
  allColNames <- names(uciHarDataFrame)
  c <- allColNames[allColNames != 'subject' & allColNames != 'activity']  
  g %>% summarise_each_(funs(mean), c)
}
  
# uciHarDataFrame <- mergeDatasets('UCI HAR Dataset')
# tidyUciHarMeanByActivitySubject <- getTidyUciHarMeanByActivitySubject(uciHarDataFrame)
# write.table(tidyUciHarMeanByActivitySubject, file='tidyUciHarMeanByActivitySubject.txt', row.name=FALSE)