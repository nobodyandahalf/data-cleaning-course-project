# Getting and Cleaning Data Course Project - CodeBook

## Raw Data
The following files are available in the UCI HAR Dataset zip file and used in this analysis:
* `features_info.txt`: Shows information about the variables used on the feature vector.
* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.
* `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* `test/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* `train/y_train.txt`: Training labels that link dataset to activity performed.
* `test/y_test.txt`: Test labels that link dataset to activity performed.
* `train/X_train.txt`: Training data set.
* `test/X_test.txt`: Test data set.

## Data Transformations
These steps are taken to transform the raw data files into the tidy dataset(s):
1. Load `reshape2` and `dplyr` libraries.
2. Read in activity labels, features, and subjects of both types (train and test).
3. Read in files linking observations to activity being performed.
4. Read in full data files with observations, using the "features" dataset as columns.
5. Add type, subject, and activity columns to the data sets.
6. Merge the "train" and "test" data to create one dataset.
7. Melt data so each row includes only one observation.
8. Extract only the mean and std measurements - review the features_info.txt file to understand this.
9. Name all columns appropriately and clearly
10. Using the above final data set, use the dplyr package to create an independent tidy data set of averages for each variable/activity/subject combination.
11. Export `tidysummary.txt` to the same working directory.

## Variables
In the final tidy dataset output, there are four variables:
* `variable`: Lists the "mean" or "std" of one of the measurements in the original dataset
* `activity`: Lists one of the six activities: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
* `subject`: Represented by the integers 1-30, this indicates the unique subject from whom the data was collected
* `avgresults`: Average of all results for a particular variable, activity, and subject.
