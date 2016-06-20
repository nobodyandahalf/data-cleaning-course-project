## Download, unzip file
download.file("","./data/UCI HAR Dataset.zip",method="libcurl")
unzip("./data/UCI HAR Dataset.zip",exdir=getwd())
## Extracted files are now in "./UCI HAR Dataset"
setwd("./UCI HAR Dataset")

## Load libraries needed for analysis
library(reshape2)
library(dplyr)

## Read activity labels, features, and subjects of both types
activity_labels<-read.table("activity_labels.txt",col.names=c("id","name"))
features<-read.table("features.txt",col.names=c("id","name"))
subject_train<-read.table("./train/subject_train.txt",col.names="subject")
subject_test<-read.table("./test/subject_test.txt",col.names="subject")

## Read files linking data to activity being performed
y_train<-read.table("./train/y_train.txt",col.names="activity")
y_test<-read.table("./test/y_test.txt",col.names="activity")

## Read data files, using the "features" dataset to link each data point
X_train<-read.table("./train/X_train.txt",col.names=features[,2])
X_test<-read.table("./test/X_test.txt",col.names=features[,2])

## Add type, subject, and activity data to each data set
X_train<-cbind(type=rep_len("train",nrow(subject_train)),subject_train,y_train,X_train)
X_test<-cbind(type=rep_len("test",nrow(subject_test)),subject_test,y_test,X_test)

## Merge "train" and "test" data to create one dataset
all_data<-rbind(X_train,X_test)

## Melt data so each row includes only one observation
all_data_melt<-melt(all_data,id=c("type","subject","activity"))

## Extract only mean and std measurements
meanstddata<-all_data_melt[grep("(\.mean\.)|std",all_data_melt$variable,ignore.case=TRUE),]
meanstddata$variable<-gsub("\\.\\.\\..*","",meanstddata$variable)

## Use descriptive activity names to name activities in the dataset
meanstddata<-mutate(meanstddata,new_activity=activity_labels[activity,]$name)[,c(1,2,6,4,5)]
names(meanstddata)<-c("type","subject","activity","variable","value")

## From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
meanstdsummary<-meanstddata %>% group_by(variable,activity,subject) %>% summarize(avgresults=mean(value))

## Write summary of tidy average data into txt file
write.table(meanstdsummary,file="tidysummary.txt",row.names=FALSE)