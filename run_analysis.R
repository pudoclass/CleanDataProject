
#Load the training dataset

trn <- read.table("UCI HAR Dataset\\train\\X_train.txt", header = FALSE,  stringsAsFactors = FALSE, colClasses = c("numeric"), strip.white = TRUE)
#Load the activity labels
actlbl <- read.table("UCI HAR Dataset\\activity_labels.txt", header = FALSE,  stringsAsFactors = FALSE, strip.white = TRUE)
#update column name of activity label 
colnames(actlbl) = c("acode", "albl")
#load training activity
atrn <- read.table("UCI HAR Dataset\\train\\y_train.txt", header = FALSE,  stringsAsFactors = FALSE, strip.white = TRUE)
#Set the column name
colnames(atrn) = c("acode")

#Load the training subject data
strn <- read.table("UCI HAR Dataset\\train\\subject_train.txt",header = FALSE,stringsAsFactors = FALSE, colClasses = c("integer"), strip.white = TRUE)
#set the column name
colnames(strn) = "subject"

#read the list of column names from features file
collbl <- read.table("UCI HAR Dataset\\features.txt", header = FALSE,  stringsAsFactors = FALSE, colClasses = c("integer", "character"), strip.white = TRUE)
#Set the column names
colnames(collbl) = c("cnum", "cname")
#Find the indices of columns that contain mean and std
colneeded <- grep("mean|std", collbl$cname)
#Extracat the needed columns from training data set
trn_data <- trn[, colneeded]

#combine the subject, activity label and training data
trn_data <- cbind(strn$subject, actlbl[atrn$acode, 2], trn_data)

#set the column names to be descriptive names
colnames(trn_data) <- c("subject", "activity", collbl[colneeded, 2])

######    Test Dataset

#Load the test dataset
tst <- read.table("UCI HAR Dataset\\test\\X_test.txt", header = FALSE,  stringsAsFactors = FALSE, colClasses = c("numeric"), strip.white = TRUE)
#Load the test activity
atst <- read.table("UCI HAR Dataset\\test\\y_test.txt", header = FALSE,  stringsAsFactors = FALSE, strip.white = TRUE)
#set column names for activity data
colnames(atst) = c("acode")

#load the test subject data
stst <- read.table("UCI HAR Dataset\\test\\subject_test.txt",header = FALSE,stringsAsFactors = FALSE, colClasses = c("integer"), strip.white = TRUE)
#set column name for subject data
colnames(stst) = "subject"

#Extract needed columns from test data
tst_data <- tst[, colneeded]

#Combine the subject, activity label and test data 
tst_data <- cbind(stst$subject, actlbl[atst$acode, 2], tst_data)

#set column name for the test data
colnames(tst_data) <- c("subject", "activity", collbl[colneeded, 2])



###  Combine training and test data  ###
main_data <- rbind(trn_data, tst_data)

library(dplyr)
data_df = tbl_df(main_data)

#group by subject and activity
data_df_group = group_by(data_df, subject, activity)

#Find the mean of each variable grouped by subject and activity
data_group_mean = summarize_each(data_df_group, funs(mean))

# Write the data into a file

write.table(data_group_mean, file = "summary_data.txt", row.name = FALSE)

