library(dplyr)
library(tidyr)

download_dataset <- function() {
  if (!file.exists("UCI HAR Dataset")) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "dataset.zip")
    unzip("dataset.zip")
  }
}

# Main function
run_analysis <- function() {
  
  download_dataset()
  
  # Read feature names and activity labels
  features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
  activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
  
  # Read training data
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
  
  # Read test data
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
  
  
  # Merge training and test sets
  X <- rbind(x_train, x_test)
  Y <- rbind(y_train, y_test)
  Subject <- rbind(subject_train, subject_test)
  merged_data <- cbind(Subject, Y, X)
  
  
  
  # Extract mean and sd
  tidy_data <- merged_data %>%
    select(subject, code,
           contains("mean", ignore.case = TRUE),
           contains("std", ignore.case = TRUE))
  
  tidy_data$code <- activities[tidy_data$code, 2]
  
  # Labels
  names(tidy_data)[2] = "activity"
  names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
  names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
  names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
  names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
  names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
  names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))
  
  # create dataset
  final_data <- tidy_data %>%
    group_by(subject, activity) %>%
    summarise(across(everything(), mean))
  
  write.table(final_data, "tidy_data.txt", row.names = FALSE)
  
  return(final_data)
}

# Execute
tidy_dataset <- run_analysis()
