# CleanDataProject
ProjectForGettingAndCleaningData Course

##Prepare the training data
* Load the training data onto a data frame
* Load the training activity onto a data frame
*  Load the activity label file onto a data frame
* Load the training subject onto a data frame
* Load the column labels for the data onto a dataframe
* Identify the indices of column labels that have mean and std in their names
* Extract the columns from the training data based on the indices from previous step
* Combine the selected columns from training data with subject and activity(looked up activity values)
* Add the descriptive column names to the columns

## Repeate the steps for test data

## Merge the training and test data prepared in the previous steps

## Group By and Summarize

* Group the merged data by subject and then activity
* Summarize - grouped by subject and activity, mean of each column
* write the output of the summary into the output file summary_data
* The output has 30 subjects and 6 activity per subject to give 180 rows

## Codebook for the output file
* subject - Subject numberr
* activity - subject's activity the measurements are taken from
* Column names ending with mean - mean of the mean value of accelerometer and gyro readings
     grouped by subject and activity
* Column names ending with std - mean of the std deviation of accelerometer and gyro readings grouped by subject and activity

* The details of each column is in features_info.txt found in the repository





