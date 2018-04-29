##Project script

##Reading raw text files

x_train<-read.table("C:/Users/Aisha/Desktop/Project course R/Dataset/train/X_train.txt", sep="")
y_train<-read.table ("C:/Users/Aisha/Desktop/Project course R/Dataset/train/y_train.txt", sep="")
subject_train<-read.table("C:/Users/Aisha/Desktop/Project course R/Dataset/train/subject_train.txt", sep="")
x_test<-read.table("C:/Users/Aisha/Desktop/Project course R/Dataset/test/X_test.txt", sep="")
y_test<-read.table("C:/Users/Aisha/Desktop/Project course R/Dataset/test/y_test.txt", sep="")
subject_test<-read.table("C:/Users/Aisha/Desktop/Project course R/Dataset/test/subject_test.txt", sep="")
features<-read.table("C:/Users/Aisha/Desktop/Project course R/Dataset/features.txt", sep="")
activities<-read.table("C:/Users/Aisha/Desktop/Project course R/Dataset/activity_labels.txt", header=FALSE)

##binding datasets

dataSubject<-rbind(subject_train,subject_test)
dataActivity<-rbind(y_train, y_test)
dataFeatures<-rbind(x_train, x_test)

##Naming variables

names(dataSubject)<- c("subject")
names(dataActivity) <- c("activity")
names(dataFeatures) <- features$V2

##Merge columns to get one data frame

combine<-cbind(dataSubject, dataActivity)
AllData<- cbind(dataFeatures, combine)

##Extracts only the measurements on the mean and 
##standard deviation for each measurement.

subdataFeatures<- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
Names<-c(as.character(subdataFeatures), "subject", "activity")
AllData<- subset(AllData, select=Names)

##Uses descriptive activity names to name the activities in the data set

AllData$activity<-factor(AllData$activity, labels=as.character(activities$V2))

##Appropriately labels the data set with descriptive variable names

names(AllData)<-gsub("^t", "time", names(AllData))
names(AllData)<-gsub("^f", "frequency", names(AllData))
names(AllData)<-gsub("Acc", "Accelerometer", names(AllData))
names(AllData)<-gsub("Gyro", "Gyroscope", names(AllData))
names(AllData)<-gsub("Mag", "Magnitude", names(AllData))
names(AllData)<-gsub("BodyBody", "Body", names(AllData))

##From the data set in step 4, creates a second, independent tidy data 
##set with the average of each variable for each activity and each subject.

library(plyr)
Datanew<- aggregate(. ~subject + activity, AllData, mean)
Datanew<- Datanew[order(Datanew$subject, Datanew$activity), ]
write.table(Datanew, file= "tidy_data.txt", row.name=FALSE)












