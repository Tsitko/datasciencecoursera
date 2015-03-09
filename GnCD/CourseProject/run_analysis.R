library(plyr)

# Merging the training and test sets in one data set


X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# creating merged X data set
X_data <- rbind(X_train, X_test)

# creating merged y data set
y_data <- rbind(y_train, y_test)

# creating merged subject data set
subject_data <- rbind(subject_train, subject_test)


# Extracting measurements on the mean and std deviation for each measurement


features <- read.table("features.txt")

# get columns with std or mean
mean_std <- grep("-(mean|std)\\(\\)", features[, 2])

# subseting X_data
X_data <- X_data[,mean_std]

# setting column names for X_data
names(X_data) <- features[mean_std, 2]


# Naming the activities in the data set


activities <- read.table("activity_labels.txt")

# filling values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# setting column name for y_data
names(y_data) <- "activity"

# Combining the data



names(subject_data) <- "subject"


data <- cbind(X_data, y_data, subject_data)

# Writing the result into file


averages <- ddply(data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(data, "averages_data.txt", row.name=FALSE)