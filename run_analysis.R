## Working directory has to be the parent of the 'UCI HAR Dataset/' directory
## Dependencies: 'data.table' and 'reshapre2' packages

require("data.table")
require("reshape2")

# Read the features, store in data table
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Extract the mean and standard deviation from features
extract_vars <- grepl("mean|std", features)

# Read X_test, store in data table
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Set the variable names for X_test data table from features
names(X_test) <- features

# Extract the data for the mean and standard deviation only
X_test <- X_test[,extract_vars]

# Read the activity labels, store in table
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Read y_test, store in data table
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Load the activity labels from y_test and store them in a second column
y_test[,2] <- activity_labels[y_test[,1]]

# Set the variable names for y_test data table
names(y_test) <- c("id", "label")

# Read the subject tests, store in data table
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Set the variable name for subject_test data table
names(subject_test) <- "subject"

# Bind the columns of subject_tests, y_test, and X_test
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# Read X_train, store in data table
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Set the variable names for X_train data table from features
names(X_train) <- features

# Extract the the mean and standard deviation only
X_train <- X_train[,extract_vars]

# Read y_train, store in data table
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Load the activity labels from y_train and store them in a second column
y_train[,2] <- activity_labels[y_train[,1]]

# Set the variable names for y_test data table
names(y_train) <- c("id", "label")

# Read subject_train, store in data table
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Set the variable name for subject_train
names(subject_train) <- "subject"

# Bind the columns of subject_train, y_train, and X_train
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge test_data and train_data
data <- rbind(test_data, train_data)

# Create a character vector that contains the variables names we will use in the final data set
id_labels <- c("subject", "id", "label")

# Get the variable names from data that do not match id_labels
data_labels <- setdiff(colnames(data), id_labels)

# Create a data frame using melt, with id_labels as the variable names, and data_labels as values in each observation
melt_data <- melt(data, id = id_labels, measure.vars = data_labels)

# Use dcast to find the mean of the data set with respective to the 'subject' and 'label' variables
tidy_data <- dcast(melt_data, subject + label ~ variable, mean)

write.table(tidy_data, file = "./Step5_tidy_data_set.txt", row.name = FALSE)