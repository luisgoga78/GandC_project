# GandC_project
Coursera getting and cleaning data project


This R script performs all the actions to:

1-    Merges the training and the test sets to create one data set.
2-    Extracts only the measurements on the mean and standard deviation for each measurement. 
3-    Uses descriptive activity names to name the activities in the data set
4-    Appropriately labels the data set with descriptive variable names. 
5-    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

First of all this script requieres next file to be in working directory:

X_train.txt
X_test.txt
subject_test.txt
subject_train.txt
y_test.txt
y_train.txt
features.txt


Actions are as follow:

variable xtrain -- I read X_train.txt file
variable xtest -- I read X_test.txt file
variable features -- I read features.txt file

variable v -- character vector to store activity names from features data frame

I do assign descriptive activity names to name the activities in the data sets xtrain and xtest

variable sub -- I read subject_train.txt, with setnames function I set the column name to "sujeto"
variable sub2 -- I read subject_test.txt, with setnames function I set the column name to "sujeto"

variable ytrain -- I read y_train.txt, with setnames function I set the column name to "actividad"
variable ytest -- I read y_test.txt, with setnames function I set the column name to "actividad"

Now I star merging:

for train data set I cbind ytrain with xtrain and the result with sub. Obtaining tabla2 data frame
for test data set I cbind ytest with xtest and the result with sub2. Obtaining tabla4 data frame

after that I rbind those complete sets of train and test (both with activity and subject columns) to obtain the tablon data frame

then I change activity ids by activity names  (tablon[which(tablon$actividad==1),]$actividad <- 'WALKING') and so on

then I take only those columns regarding mean and standard deviation in the solution data frame(solucion<-tablon[,grepl('mean',colnames(tablon))|grepl('std',colnames(tablon))|grepl('sujeto',colnames(tablon))|grepl('actividad',colnames(tablon))])

and then to obtain the asked final data set I get the average of the measurements by subject and activity:

data table datat:  datat <- data.table(solucion)

and then  the final operation: datat.agg <- datat[, lapply(.SD, mean), by=c("sujeto","actividad")]
