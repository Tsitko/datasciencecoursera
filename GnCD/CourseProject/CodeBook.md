The script run_analysis.R:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

As the result, we have a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.
Variables
X_train, y_train, X_test, y_test, subject_train and subject_test contain the data from the initial files.
X_data, y_data and subject_data merge the previous datasets to further analysis.
features contains the correct names for the X_data dataset, it applied to the column names in mean_std
data merges X_data, y_data and subject_data in one dataset.
averages_data contains the relevant averages to save as a .txt file.
