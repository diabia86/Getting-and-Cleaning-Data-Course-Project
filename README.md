# Codebook

This CodeBook that describes the variables, the data, and any transformations or work that was performed to clean up
the source data to create a tidy dataset as per requirements of course project.

The script run_analysis.R analyses the data from UCI Machine Learning Repository
by merging the training and test sets to create one data set, followed by
replacing the activity values in the dataset with descriptive activity names.
The script extracts only the measurements (features) on the mean and standard deviation for each measurement and
appropriately labels the columns with descriptive names, thus
creating a second, independent tidy dataset with an average of each variable for each each activity and each subject. 
The script also assumes that plyr library is already installed.

## Script process

The first step of the preprocessing is to read data from files into the variables.  Next the training and test sets were merged.  This was done by first concatenating the data table by rows and setting names to the variables. After the merge operation the resulting data, the table contains 562 columns (560 measurements, subject identifier and activity label).

After the merge operation, mean and standard deviation features are extracted for further processing. The dataframe was subsetted to extract mean and standard deviation

Next, the activity labels are replaced with descriptive activity names, defined in activity_labels.txt in the original data folder.

The final step creates a tidy data set with the average of each variable for each activity and each subject. 10299 instances are split into 180 groups (30 subjects and 6 activities) and 66 mean and standard deviation features are averaged for each group. The resulting data table has 180 rows and 66 columns. 

## Appropriately labels the data set with descriptive variable names
In the former part, variables activity and subject and names of the activities have been labelled using descriptive names.In this part, Names of Feteatures will labelled using descriptive variable names.

- prefix t is replaced by time
- Acc is replaced by Accelerometer
- Gyro is replaced by Gyroscope
- prefix f is replaced by frequency
- Mag is replaced by Magnitude
- BodyBody is replaced by Body




