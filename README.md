# Getting and Cleaning Data Course Project

## Introduction
The goal of the "Getting and Cleaning Data" Course Project is to collect, work with, and clean the "Human Activity Recognition Using Smartphones" Dataset. The analysis does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Running the Data Analysis
The data analysis can be replicated via these instructions and the files in the repository:

1. The dataset, located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, is downloaded and unzipped into a local folder named `UCI HAR Dataset`.

2. The R working directory is then set to that folder.

3. Place `run_analysis.R` in that working directory, then execute `source("run_analysis.R")`.
  * Assumption: `reshape2` and `dplyr` libraries have already been installed.

4. The R code processes all required data transformations and analyses, and generates `tidysummary.txt`.

## CodeBook
The `CodeBook.md` markdown file contains an overview of the data and variables used in the data analysis.
